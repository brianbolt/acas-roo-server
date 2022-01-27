package com.labsynch.labseer.chemclasses.bbchem;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.BitSet;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;
import java.util.Collections;

import com.labsynch.labseer.chemclasses.CmpdRegMolecule;
import com.labsynch.labseer.domain.AbstractBBChemStructure;
import com.labsynch.labseer.exceptions.CmpdRegMolFormatException;
import com.labsynch.labseer.utils.PropertiesUtilService;
import com.labsynch.labseer.utils.SimpleUtil;
import com.labsynch.labseer.utils.Response;
import com.labsynch.labseer.utils.Request;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class BBChemStructureServiceImpl  implements BBChemStructureService {

	Logger logger = LoggerFactory.getLogger(BBChemStructureServiceImpl.class);

	@Autowired
	private PropertiesUtilService propertiesUtilService;


	@Override
	public JsonNode getPreprocessorSettings() throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(propertiesUtilService.getPreprocessorSettings());
		return jsonNode;
	}

	private String getUrlFromPreprocessorSettings(String propertyKey) throws IOException {
		JsonNode jsonNode = null;
		jsonNode = getPreprocessorSettings();
		JsonNode urlNode = jsonNode.get(propertyKey);
		if(urlNode == null || urlNode.isNull()) {
			logger.error("Missing preprocessorSettings "+propertyKey+"!!");
			throw new IOException("Missing preprocessorSettings "+propertyKey+"!!");
		}
		String url = urlNode.getTextValue();
		return url;

	}


	private HashMap<String, BitSet> molsToFingerprints(HashMap<String, String> structures, String type)  throws CmpdRegMolFormatException{
		// Fetch the fingerprint from the BBChem fingerprint service
		String url = null;
		try {
			url = getUrlFromPreprocessorSettings("fingerprintURL");
		} catch (IOException e) {
			throw new CmpdRegMolFormatException(e);
		}
		
		// Create the request data object
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode requestData = mapper.createObjectNode();

		// Split the list of structures into chunks of propertiesUtilService.getExternalStructureProcessingBatchSize()
		List<List<String>> structureGroups = splitIntoListOfLists(structures);
		
		Collection<Callable<Response>> tasks = new ArrayList<>();
		// Create the tasks and include an id for the task
		for (int i = 0; i < structureGroups.size(); i++) {
			List<String> structureGroupList = structureGroups.get(i);

			// Add the structures to the request
			ArrayNode arrayNode = mapper.createArrayNode();

			for (String structure : structureGroupList) {
				arrayNode.add(structure);
			}
			requestData.put("sdfs", arrayNode);
			requestData.put("fingerprint_type", type);

			// Post to the service and parse the response
			String requestString = requestData.toString();
			logger.debug("requestString: " + requestString);
			tasks.add(new Request(i, url, requestString));
		}
		
		ForkJoinPool pool = new ForkJoinPool(Runtime.getRuntime().availableProcessors());
		logger.info("Invoking " + tasks.size() + " fingerprint tasks");
		List<Future<Response>> results = pool.invokeAll(tasks);
		HashMap<Integer, JsonNode> responseMap = new HashMap<Integer, JsonNode>();
		for(Future<Response> response : results){
			String responseBody;
			int responseCode;
			Integer responseId;
			try {
				responseBody = response.get().getResponseBody();
				responseCode = response.get().getResponseCode();
				responseId = response.get().getId();
			} catch (InterruptedException | ExecutionException e) {
				throw new CmpdRegMolFormatException("Error posting to fingerprint service: " + e.getMessage());
			}

			if(responseCode != 200) {
				logger.error("Response Body: " + responseBody);
				logger.error("URL was: " + url);
				throw new CmpdRegMolFormatException("Error posting to fingerprint service: " + responseBody);
			}

			// Parse the response json to get the standardized mol
			ObjectMapper responseMapper = new ObjectMapper();
			JsonNode responseNode;
			try {
				responseNode = responseMapper.readTree(responseBody);
			} catch (IOException e) {
				throw new CmpdRegMolFormatException("Error parsing finger print service response: " + responseBody);
			}
			responseMap.put(responseId, responseNode);
		}
		logger.info("Got response for all " + tasks.size() + " fingerprint tasks");

        // The output array is guaranteed to be in the same order as its inputs
		// Sort the response hashmap by the keys
		List<Integer> responseIds = new ArrayList<Integer>(responseMap.keySet());
		Collections.sort(responseIds);
		
        // Return hashmap with the String key from the input hashmap and the fingerprint BitSet
		HashMap<String, BitSet> fingerprints = new HashMap<String, BitSet>();
		Object[] structuresArray = structures.keySet().toArray();
		int s = 0;
		for(Integer responseId : responseIds) {			
			logger.debug("Response ID: " + responseId);
			// Combine the json nodes
			JsonNode responseNode = responseMap.get(responseId);
			JsonNode resultsNode = responseNode.get("fingerprint_results");
			for (int i = 0; i < resultsNode.size(); i++) {
				JsonNode resultNode = resultsNode.get(i);
				String stringFingerPrint = resultNode.asText();
				BitSet bitSet = SimpleUtil.stringToBitSet(stringFingerPrint);
				String structureKey = structuresArray[s].toString();
				s++;
				fingerprints.put(structureKey, bitSet);
			}
		}
		return fingerprints;
	}

	private BitSet getFingerprint(String molStructure, String type)  throws CmpdRegMolFormatException{
		// Get a single fingerprint by calling the BBChem fingerprint service
		try {
			// Create the request data object
			HashMap<String, String> structures = new HashMap<String, String>();

			// Temporary key just to match the molToFingerprints hashmap key/value inputs
			String structureKey = "TmpKey01";
			structures.put(structureKey, molStructure);
			HashMap<String, BitSet> fingerPrintHashMap = molsToFingerprints(structures, type);
			return fingerPrintHashMap.get(structureKey);
		} catch (Exception e) {
			logger.error("Error posting to fingerprint service: " + e.getMessage());
			throw new CmpdRegMolFormatException("Error posting to fingerprint service: " + e.getMessage());
		}
	}

	List<List<String>> splitIntoListOfLists(HashMap<String, String> stringHashMap) {
		// Split the hashmap into chunks of propertiesUtilService.getExternalStructureProcessingBatchSize()
		List<List<String>> groups = new ArrayList<List<String>>();
		List<String> group = new ArrayList<String>();
		Object[] array = stringHashMap.keySet().toArray();
		for (String key : stringHashMap.keySet()) {
			group.add(stringHashMap.get(key));

			// Check if structure group size is now propertiesUtilService.getExternalStructureProcessingBatchSize() or this is the last item in the original hashmap
			if (group.size() == propertiesUtilService.getExternalStructureProcessingBatchSize() || key == array[array.length - 1]) {
				groups.add(group);
				group = new ArrayList<String>();
			}
		}
		return groups;
	}
	
	private JsonNode postToProcessService(HashMap<String, String> structures)  throws IOException {

		String url = getUrlFromPreprocessorSettings("processURL");

		JsonNode jsonNode = getPreprocessorSettings();

		// Create the request data object
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode requestData = mapper.createObjectNode();

		// Get the standardization actions and options
		ObjectNode options = (ObjectNode) jsonNode.get("process_options");

		// We do not want standardization here but the route requires a standardization object to be sent in.
		// Adding an empty standardizer actions so to avoid any standardization
		options.put("standardizer_actions", mapper.createObjectNode());
		requestData.put("options", options);

		// Split the list of structures into chunks for processing
		List<List<String>> structureGroups = splitIntoListOfLists(structures);

		Collection<Callable<Response>> tasks = new ArrayList<>();
		// Create the tasks and include an id for the task
		for (int i = 0; i < structureGroups.size(); i++) {
			List<String> structureGroupList = structureGroups.get(i);

			// Add the structures to the request
			ArrayNode arrayNode = mapper.createArrayNode();

			for (String structure : structureGroupList) {
				arrayNode.add(structure);
			}
			requestData.put("structures", arrayNode);

			// Post to the service and parse the response
			String requestString = requestData.toString();
			logger.debug("requestString: " + requestString);
			tasks.add(new Request(i, url, requestString));
		}

		ForkJoinPool pool = new ForkJoinPool(Runtime.getRuntime().availableProcessors());
		logger.info("Invoking " + tasks.size() + " process tasks");
		List<Future<Response>> results = pool.invokeAll(tasks);
		HashMap<Integer, JsonNode> responseMap = new HashMap<Integer, JsonNode>();
		for(Future<Response> response : results){
			String responseBody;
			int responseCode;
			int responseId;
			try {
				responseBody = response.get().getResponseBody();
				responseCode = response.get().getResponseCode();
				responseId = response.get().getId();
			} catch (InterruptedException | ExecutionException e) {
				throw new IOException("Error posting to process service: " + e.getMessage());
			}

			if(responseCode != 200) {
				logger.error("Response Body: " + responseBody);
				logger.error("URL was: " + url);
				throw new IOException("Error posting to process service: " + responseBody);
			}

			// Parse the response json to get the standardized mol
			ObjectMapper responseMapper = new ObjectMapper();
			JsonNode responseNode = responseMapper.readTree(responseBody);
			responseMap.put(responseId, responseNode);
		}
		logger.info("Got response for all " + tasks.size() + " process tasks");

		// Sort the response hashmap by the keys
		List<Integer> responseIds = new ArrayList<Integer>(responseMap.keySet());
		Collections.sort(responseIds);
		//Empty json node array
		ArrayNode responseArray = mapper.createArrayNode();
		for(Integer responseId : responseIds) {
			logger.debug("Response ID: " + responseId);
			// Combine the json nodes
			JsonNode responseNode = responseMap.get(responseId);
			responseArray.addAll((ArrayNode) responseNode);
		}
		return responseArray;
	}

	@Override
	public JsonNode postToProcessService(String molfile) throws IOException {
		
		//New hashamp
		HashMap<String, String> structures = new HashMap<String, String>();
		//Add the molfile to the hashmap
		structures.put("mol", molfile);
		//Post to the service
		JsonNode jsonNode = postToProcessService(structures);

		return jsonNode;
	}

	@Override
	public HashMap<String, String> getPreprocessedStructures(HashMap<String, String> structures)  throws CmpdRegMolFormatException, IOException{
		// Returns standardized mols
		String url = getUrlFromPreprocessorSettings("preprocessURL");

		JsonNode jsonNode = getPreprocessorSettings();

		ObjectMapper mapper = new ObjectMapper();
		ObjectNode requestData = mapper.createObjectNode();
		JsonNode standardizerActions = jsonNode.get("standardizer_actions");
		requestData.put("config", standardizerActions);
		requestData.put("output_format", "MOL");

		// Split the list of structures into chunks of propertiesUtilService.getExternalStructureProcessingBatchSize()
		List<HashMap<String, String>> structureGroups = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> structureGroup = new HashMap<String, String>();
		Object[] structuresArray = structures.keySet().toArray();
		for (String structure : structures.keySet()) {
			structureGroup.put(structure, structures.get(structure));
			if(structureGroup.size() == propertiesUtilService.getExternalStructureProcessingBatchSize() || structure == structuresArray[structuresArray.length - 1]) {
				structureGroups.add(structureGroup);
				structureGroup = new HashMap<String, String>();
			}
		}

		Collection<Callable<Response>> tasks = new ArrayList<>();
		// Create the tasks and include an id for the task
		for (int i = 0; i < structureGroups.size(); i++) {
			HashMap<String, String> structureGroupList = structureGroups.get(i);

			// Add the structures to the request
			ObjectNode structuresNode = mapper.createObjectNode();

			// Create a "structures": { "structure-id": "molfile" } object and add it to the request
			for (String structureId : structureGroupList.keySet()){
				String structure = structureGroupList.get(structureId);
				structuresNode.put(structureId, structure);
			}
			requestData.put("structures", structuresNode);

			// Post to the service and parse the response
			String requestString = requestData.toString();
			logger.debug("requestString: " + requestString);
			tasks.add(new Request(i, url, requestString));
		}

		ForkJoinPool pool = new ForkJoinPool(Runtime.getRuntime().availableProcessors());
		logger.info("Invoking " + tasks.size() + " preprocess tasks");
		List<Future<Response>> results = pool.invokeAll(tasks);
		HashMap<Integer, JsonNode> responseMap = new HashMap<Integer, JsonNode>();
		for(Future<Response> response : results){
			String responseBody;
			int responseCode;
			Integer responseId;
			try {
				responseBody = response.get().getResponseBody();
				responseCode = response.get().getResponseCode();
				responseId = response.get().getId();
			} catch (InterruptedException | ExecutionException e) {
				throw new IOException("Error posting to process service: " + e.getMessage());
			}

			if(responseCode != 200) {
				logger.error("Response Body: " + responseBody);
				logger.error("URL was: " + url);
				throw new IOException("Error posting to preprocess service: " + responseBody);
			}

			// Parse the response json to get the standardized mol
			ObjectMapper responseMapper = new ObjectMapper();
			JsonNode responseNode = responseMapper.readTree(responseBody);
			responseMap.put(responseId, responseNode);
		}
		logger.info("Got response for all " + tasks.size() + " preprocess tasks");

		// Sort the response hashmap by the keys
		List<Integer> responseIds = new ArrayList<Integer>(responseMap.keySet());
		Collections.sort(responseIds);
		//Empty hashmap
		HashMap<String, String> standardizedStructures = new HashMap<String, String>();
		for(Integer responseId : responseIds) {
			logger.debug("Response ID: " + responseId);
			// Combine the json nodes
			JsonNode responseNode = responseMap.get(responseId);
			JsonNode structuresResponseNode = responseNode.get("structures");

			// Add the standardized structures to the hashmap
			structuresResponseNode.getFieldNames().forEachRemaining(structureId -> {
				String structure = structuresResponseNode.get(structureId).get("structure").asText();
				standardizedStructures.put(structureId, structure);
			});
		}

		return standardizedStructures;
	}

	@Override
	public HashMap<String, BBChemParentStructure> getProcessedStructures(HashMap<String, String> structures, Boolean includeFingerprints) throws CmpdRegMolFormatException {

		// Return map
		HashMap<String, BBChemParentStructure> processedStructures = new HashMap<String, BBChemParentStructure>();
		
		// Post to the service and parse the response
		try {
			JsonNode responseNode;
			try {
				responseNode = postToProcessService(structures);
			} catch (IOException e) {
				throw new CmpdRegMolFormatException(e);
			}

			// The output array is guaranteed to be in the same order as its inputs
			// Its most efficient to match the input keys to the output keys by index
			// when the input keys are converted to an array first
			Object[] structuresArray = structures.keySet().toArray();
			// Loop through length of response node
			for (int i = 0; i < responseNode.size(); i++) {
				
				JsonNode responseJsonNode = responseNode.get(i);
				
				BBChemParentStructure bbChemStructure = new BBChemParentStructure();
				
				// Throw exception if there is an error reading the molecule
				JsonNode errorCodeNode = responseJsonNode.get("error_code");

				// Check if we have an error code
				if( errorCodeNode != null) {
					throw new CmpdRegMolFormatException("Error processing structures: Error Code " + errorCodeNode.getTextValue() + " " + responseJsonNode.get("error_msg").getTextValue());
				}
				JsonNode registrationHashesNode = responseJsonNode.get("registration_hash");
				String registrationHash = registrationHashesNode.get(0).asText();
				bbChemStructure.setReg(registrationHashesNode.get(0).asText());

				JsonNode noStereoHashNode = responseJsonNode.get("no_stereo_hash");
				bbChemStructure.setPreReg(noStereoHashNode.asText());

				JsonNode sdfNode = responseJsonNode.get("sdf");
				bbChemStructure.setMol(sdfNode.asText());

				JsonNode averageMolWeightNode = responseJsonNode.get("molecular_weight");
				bbChemStructure.setAverageMolWeight(averageMolWeightNode.asDouble());

				JsonNode exactMolWeightNode = responseJsonNode.get("exact_molecular_weight");
				bbChemStructure.setExactMolWeight(exactMolWeightNode.asDouble());

				JsonNode totalChargeNode = responseJsonNode.get("total_charge");
				bbChemStructure.setTotalCharge(Integer.valueOf(totalChargeNode.asInt()));

				JsonNode smilesNode = responseJsonNode.get("smiles");
				bbChemStructure.setSmiles(smilesNode.asText());

				JsonNode molecularFormulaNode = responseJsonNode.get("molecular_formula");
				bbChemStructure.setMolecularFormula(molecularFormulaNode.asText());

				// Set recorded date todays date. This simplifies the code when we need to persist the structure
				// in various places.
				bbChemStructure.setRecordedDate(new Date());

				// The output array is guaranteed to be in the same order as its inputs
				// So get the key from the array we created above and assume the same order
				String structureKey = structuresArray[i].toString();
				
				// Add to the map
				processedStructures.put(structureKey, bbChemStructure);
			}

			if(includeFingerprints) {
				// Input fingerprint hashes
				HashMap<String, String> processedStructureHash = new HashMap<String, String>();
				for (String structureId : processedStructures.keySet()){
					processedStructureHash.put(structureId, processedStructures.get(structureId).getMol());
				}

				// Get the fingerprints
				HashMap<String, BitSet> substructureHashMap = molsToFingerprints(processedStructureHash, "substructure_search");
				HashMap<String, BitSet> similarityHashMap = molsToFingerprints(processedStructureHash, "similarity_score");

				// Add the substructure fingerprints to the processed structures
				for (String structureId : substructureHashMap.keySet()){
					processedStructures.get(structureId).setSubstructure(substructureHashMap.get(structureId));
				}

				// Add the similarity fingerprints to the processed structures
				for (String structureId : similarityHashMap.keySet()){
					processedStructures.get(structureId).setSimilarity(similarityHashMap.get(structureId));
				}
			}

			return processedStructures;
		} catch (CmpdRegMolFormatException e) {
			logger.error("Error processing structures: " + e.getMessage());
			throw new CmpdRegMolFormatException(e);
		}

	}

	@Override
	public BBChemParentStructure getProcessedStructure(String molfile, Boolean includeFingerprints) throws CmpdRegMolFormatException {
		BBChemParentStructure bbChemStructure = new BBChemParentStructure();
		// Post to the service and parse the response
		try {
			// Input hashmap 
			HashMap<String, String> structures = new HashMap<String, String>();
			structures.put("molstructure", molfile);

			HashMap<String, BBChemParentStructure> processedStructuresHashMap = getProcessedStructures(structures, includeFingerprints);

			// Get the first structure
			bbChemStructure = processedStructuresHashMap.get("molstructure");
			return bbChemStructure;

		} catch (CmpdRegMolFormatException e) {
			logger.error("Error in getProcessedStructures: " + e.getMessage());
			throw new CmpdRegMolFormatException(e);
		}
	}

	@Override
	public String getSDF(BBChemParentStructure bbChemStructure) throws IOException{

		String url = getUrlFromPreprocessorSettings("exportSDFURL");


		// Create the request data object
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode requestData = mapper.createObjectNode();

		// Create sdfs arraynode and mol node
		ArrayNode sdfsNode = mapper.createArrayNode();
		ObjectNode molNode = mapper.createObjectNode();


		// Add the properties to the mol node
		ArrayNode propertiesNode = mapper.createArrayNode();
		for (Map.Entry<String,String> entry : bbChemStructure.getProperties().entrySet()) {
			ObjectNode propertyNode = mapper.createObjectNode();
			propertyNode.put("name", entry.getKey());
			propertyNode.put("value", entry.getValue());
			propertiesNode.add(propertyNode);

		}
		molNode.put("properties", propertiesNode);

		// Add the structure to the mol node
		molNode.put("sdf", bbChemStructure.getMol());

		// Add the mol node to the sdfs array node
		sdfsNode.add(molNode);

		// Add the sdfs to the request data
		requestData.put("sdfs", sdfsNode);

		// Post to the service and parse the response
		String requestString = requestData.toString();
		logger.debug("requestString: " + requestString);
		String postResponse = SimpleUtil.postRequestToExternalServer(url, requestString, logger);
		logger.debug("Got response: "+ postResponse);

		// Parse the response json
		ObjectMapper responseMapper = new ObjectMapper();
		JsonNode responseNode = responseMapper.readTree(postResponse);
		return responseNode.asText();
	}

	@Override
	public List<BBChemParentStructure> parseSDF(String molfile) throws CmpdRegMolFormatException {
		List<BBChemParentStructure> bbChemStructures = new ArrayList<BBChemParentStructure>();

		String url = null;
		try {
			url = getUrlFromPreprocessorSettings("parseURL");
		} catch (IOException e) {
			throw new CmpdRegMolFormatException(e);
		}

		// Create the request data object
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode requestData = mapper.createObjectNode();

		// Add the structures to the request
		Base64.Encoder encoder = Base64.getEncoder();
		String encodedString = encoder.encodeToString(molfile.getBytes(StandardCharsets.UTF_8) );
		requestData.put("molv3", encodedString);

		// Post to the service and parse the response
		try {
			String requestString = requestData.toString();
			logger.debug("requestString: " + requestString);
			String postResponse = SimpleUtil.postRequestToExternalServer(url, requestString, logger);
			logger.debug("Got response: "+ postResponse);

			// Parse the response json to get the standardized mol
			ObjectMapper responseMapper = new ObjectMapper();
			JsonNode responseNode = responseMapper.readTree(postResponse);
			for (JsonNode responseJsonNode : responseNode)  {
				BBChemParentStructure bbChemStructure = new BBChemParentStructure();
				JsonNode molNode = responseJsonNode.get("mol");
				bbChemStructure.setMol(molNode.asText());

				bbChemStructure.setProperties(new HashMap<String, String>());
				JsonNode propertiesJsonNode = responseJsonNode.get("properties");
				for (JsonNode propertyNode : propertiesJsonNode) {
					String name = propertyNode.get("name").asText();
					String value = propertyNode.get("value").asText();
					bbChemStructure.getProperties().put(name, value);
				}
				bbChemStructures.add(bbChemStructure);
			}


		} catch (Exception e) {
			logger.error("Error posting to parse service: " + e);
			throw new CmpdRegMolFormatException("Error posting to parse service: " + e);
		}

		return bbChemStructures;

	}

	@Override
	public List<String> getMolFragments(String molfile) throws CmpdRegMolFormatException {

		String url = null;
		try {
			url = getUrlFromPreprocessorSettings("splitURL");
		} catch (IOException e) {
			throw new CmpdRegMolFormatException(e);
		}

		// Create the request data object
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode requestData = mapper.createObjectNode();

		// Add the structures to the request
		ArrayNode arrayNode = mapper.createArrayNode();
		arrayNode.add(molfile);
		requestData.put("sdfs", arrayNode);

		List<String> molStrings = new ArrayList<>();
		// Post to the service and parse the response
		try {
			String requestString = requestData.toString();
			logger.debug("requestString: " + requestString);
			HttpURLConnection connection = SimpleUtil.postRequest(url, requestString, logger);
			String postResponse = null;
			if(connection.getResponseCode() != 200) {
				logger.error("Error posting to split service: " + connection.getResponseMessage());
				logger.error("Response Body: " + SimpleUtil.getStringBody(connection));
				logger.error("URL was: " + url);
				logger.error("Request was : " + requestString);
				throw new CmpdRegMolFormatException("Error posting to split service: " + connection.getResponseMessage());
			} else {
				postResponse = SimpleUtil.getStringBody(connection);
			}
			logger.debug("Got response: "+ postResponse);

			// Parse the response json to get the standardized mol
			ObjectMapper responseMapper = new ObjectMapper();
			JsonNode responseNode = responseMapper.readTree(postResponse);
			JsonNode resultsNode = responseNode.get("results");
			for (JsonNode resultNode : resultsNode)  {
				JsonNode splitSDFS = resultNode.get("split_sdfs");
				for (JsonNode sdfNode : splitSDFS)  {
					molStrings.add(sdfNode.asText());
				}
			}
		} catch (Exception e) {
			logger.error("Error posting to split service: " + e.getMessage());
			throw new CmpdRegMolFormatException("Error posting to split service: " + e.getMessage());
		}

		return molStrings;
	}

	@Override
	public HashMap<? extends AbstractBBChemStructure, Boolean> substructureMatch(String queryMol, List<? extends AbstractBBChemStructure> needsMatchStructures)
			throws CmpdRegMolFormatException {
		// Fetch the fingerprint from the BBChem finerprint service

		String url = null;
		try {
			url = getUrlFromPreprocessorSettings("substructureMatchURL");
		} catch (IOException e) {
			throw new CmpdRegMolFormatException(e);
		}
		
		// Create the request data object
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode requestData = mapper.createObjectNode();

		// Add the structures to the request
		ArrayNode arrayNode = mapper.createArrayNode();
		for(AbstractBBChemStructure needsMatch : needsMatchStructures) {
			arrayNode.add(needsMatch.getMol());
		}
		requestData.put("needs_match_molv3s", arrayNode);
		requestData.put("query_molv3", queryMol);
		requestData.put("boolean_results", true);
		// Post to the service and parse the response
		try {
			String requestString = requestData.toString();
			logger.debug("requestString: " + requestString);
			HttpURLConnection connection = SimpleUtil.postRequest(url, requestString, logger);
			String postResponse = null;
			if(connection.getResponseCode() != 200) {
				logger.error("Error posting to substructure match service: " + connection.getResponseMessage());
				logger.error("Response Body: " + SimpleUtil.getStringBody(connection));
				logger.error("URL was: " + url);
				logger.error("Request was : " + requestString);
				throw new CmpdRegMolFormatException("Error posting to substructure match service: " + connection.getResponseMessage());
			} else {
				postResponse = SimpleUtil.getStringBody(connection);
			}
			logger.debug("Got response: "+ postResponse);

			// Parse the response json to get the standardized mol
			ObjectMapper responseMapper = new ObjectMapper();
			JsonNode responseNode = responseMapper.readTree(postResponse);
			JsonNode resultsNode = responseNode.get("results");

			HashMap<AbstractBBChemStructure, Boolean> matchMap = new HashMap<>();
			// Loop through length of the results
			for (int i = 0; i < resultsNode.size(); i++) {
				matchMap.put(needsMatchStructures.get(i), resultsNode.get(i).get("has_hits").asBoolean());
			}
			return matchMap;
		} catch (Exception e) {
			logger.error("Error posting to fingerprint service: " + e.getMessage());
			throw new CmpdRegMolFormatException("Error posting to fingerprint service: " + e.getMessage());
		}
	}

}
