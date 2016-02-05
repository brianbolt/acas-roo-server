package com.labsynch.labseer.api;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import junit.framework.Assert;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.labsynch.labseer.domain.Container;
import com.labsynch.labseer.domain.LabelSequence;
import com.labsynch.labseer.domain.LsThing;
import com.labsynch.labseer.domain.ProtocolValue;
import com.labsynch.labseer.dto.CmpdRegBatchCodeDTO;
import com.labsynch.labseer.dto.CodeTableDTO;
import com.labsynch.labseer.dto.CodeLabelDTO;
import com.labsynch.labseer.dto.ErrorMessageDTO;
import com.labsynch.labseer.dto.PlateWellDTO;
import com.labsynch.labseer.dto.PreferredNameDTO;
import com.labsynch.labseer.dto.PreferredNameRequestDTO;
import com.labsynch.labseer.dto.PreferredNameResultsDTO;
import com.labsynch.labseer.dto.WellContentDTO;
import com.labsynch.labseer.exceptions.ErrorMessage;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"classpath:/META-INF/spring/applicationContext.xml",
		"classpath:/META-INF/spring/applicationContext-security.xml",
		"file:src/main/webapp/WEB-INF/spring/webmvc-config-test.xml"})
public class ApiContainerControllerTest {

	private static final Logger logger = LoggerFactory.getLogger(ApiContainerControllerTest.class);
	
    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }
    
    @Test
    @Transactional
    public void getContainerByLsTypeAndLsKind() throws Exception{
    	MockHttpServletResponse response;
    	String responseJson;
    	Collection<Container> foundContainers;
    	//no type and kind
    	response = this.mockMvc.perform(get("/api/v1/containers")
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	foundContainers = Container.fromJsonArrayToContainers(responseJson);
    	Assert.assertFalse(foundContainers.isEmpty());
    	//only type
    	response = this.mockMvc.perform(get("/api/v1/containers?lsType=subject")
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	foundContainers = Container.fromJsonArrayToContainers(responseJson);
    	Assert.assertFalse(foundContainers.isEmpty());
    	//only kind
    	response = this.mockMvc.perform(get("/api/v1/containers?lsKind=nhp test subject")
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	foundContainers = Container.fromJsonArrayToContainers(responseJson);
    	Assert.assertFalse(foundContainers.isEmpty());
    	//type and kind
    	response = this.mockMvc.perform(get("/api/v1/containers?lsType=subject&lsKind=nhp test subject")
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	foundContainers = Container.fromJsonArrayToContainers(responseJson);
    	Assert.assertFalse(foundContainers.isEmpty());
    	//find no results
    	response = this.mockMvc.perform(get("/api/v1/containers?lsType=nope&lsKind=")
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	foundContainers = Container.fromJsonArrayToContainers(responseJson);
    	Assert.assertTrue(foundContainers.isEmpty());
    }
    
    
    @Test
    @Transactional
    public void getWellCodesByPlateBarcodes() throws Exception{
    	List<String> plateBarcodes = new ArrayList<String>();
		plateBarcodes.add("\""+Container.findContainersByLsTypeEqualsAndLsKindEquals("container","plate").getResultList().get(0).getLsLabels().iterator().next().getLabelText()+"\"");	
		String json = plateBarcodes.toString();
		logger.info(json);
		Assert.assertFalse(json.equals("{}"));
    	MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/containers/getWellCodesByPlateBarcodes")
    			.contentType(MediaType.APPLICATION_JSON)
    			.accept(MediaType.APPLICATION_JSON)
    			.content(json))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	Collection<PlateWellDTO> results = PlateWellDTO.fromJsonArrayToPlateWellDTO(responseJson);
    	for (PlateWellDTO result : results){
    		Assert.assertNotNull(result.getPlateBarcode());
    		if (result.getPlateCodeName() != null){
    			Assert.assertNotNull(result.getWellCodeName());
    			Assert.assertNotNull(result.getWellLabel());
    		}
    	}
    }
    
    @Test
    @Transactional
    public void getContainerCodesByLabels() throws Exception{
    	List<String> plateBarcodes = new ArrayList<String>();
		plateBarcodes.add("\""+Container.findContainersByLsTypeEqualsAndLsKindEquals("container","plate").getResultList().get(0).getLsLabels().iterator().next().getLabelText()+"\"");	
		String json = plateBarcodes.toString();
		logger.info(json);
		Assert.assertFalse(json.equals("{}"));
    	MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/containers/getContainerCodesByLabels")
    			.contentType(MediaType.APPLICATION_JSON)
    			.accept(MediaType.APPLICATION_JSON)
    			.content(json))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	Collection<CodeLabelDTO> results = CodeLabelDTO.fromJsonArrayToCoes(responseJson);
    	for (CodeLabelDTO result : results){
    		Assert.assertNotNull(result.getCodeName());
    		Assert.assertNotNull(result.getLabel());
    	}
    }
    
    @Test
    @Transactional
    public void getContainerCodesByLabelsWithTypeKinds() throws Exception{
    	List<String> plateBarcodes = new ArrayList<String>();
		plateBarcodes.add("\""+Container.findContainersByLsTypeEqualsAndLsKindEquals("container","plate").getResultList().get(0).getLsLabels().iterator().next().getLabelText()+"\"");	
		String json = plateBarcodes.toString();
		logger.info(json);
		Assert.assertFalse(json.equals("{}"));
    	MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/containers/getContainerCodesByLabels"
    			+ "?containerType=container&containerKind=plate&labelType=barcode&labelKind=barcode")
    			.contentType(MediaType.APPLICATION_JSON)
    			.accept(MediaType.APPLICATION_JSON)
    			.content(json))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	Collection<CodeLabelDTO> results = CodeLabelDTO.fromJsonArrayToCoes(responseJson);
    	for (CodeLabelDTO result : results){
    		Assert.assertNotNull(result.getCodeName());
    		Assert.assertNotNull(result.getLabel());
    	}
    }
    
    @Test
    @Transactional
    public void getWellContent() throws Exception{
    	List<String> wellCodes = new ArrayList<String>();
		wellCodes.add("\""+Container.findContainersByLsTypeEqualsAndLsKindEquals("physical","well").getResultList().get(0).getCodeName()+"\"");
		String json = wellCodes.toString();
		logger.info(json);
		Assert.assertFalse(json.equals("{}"));
    	MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/containers/getWellContent")
    			.contentType(MediaType.APPLICATION_JSON)
    			.accept(MediaType.APPLICATION_JSON)
    			.content(json))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	Collection<WellContentDTO> results = WellContentDTO.fromJsonArrayToWellCoes(responseJson);
    	for (WellContentDTO result : results){
    		Assert.assertNotNull(result.getWellCodeName());
    	}
    }
    
    @Test
    @Transactional
    public void validateContainerUniqueName() throws Exception{
		String json = "{\"lsType\":\"subject\",\"lsKind\":\"nhp test subject\",\"recordedBy\":\"bob\",\"recordedDate\":1452795015412,\"shortDescription\":\" \",\"lsLabels\":[{\"lsType\":\"name\",\"lsKind\":\"subject name\",\"labelText\":\"Test Cont 8\",\"ignored\":false,\"preferred\":true,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"physicallyLabled\":false,\"imageFile\":null},{\"lsType\":\"corpName\",\"lsKind\":\"ACAS LsContainer\",\"labelText\":\"NHP-00014\",\"ignored\":false,\"preferred\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"physicallyLabled\":false,\"imageFile\":null},{\"lsType\":\"barcode\",\"lsKind\":\"subject barcode\",\"labelText\":\"\",\"ignored\":false,\"preferred\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"physicallyLabled\":false,\"imageFile\":null}],\"lsStates\":[{\"lsType\":\"metadata\",\"lsKind\":\"subject attributes\",\"lsValues\":[{\"lsType\":\"codeValue\",\"lsKind\":\"sex\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"codeKind\":\"sex\",\"codeType\":\"subject attributes\",\"codeOrigin\":\"ACAS DDICT\",\"codeValue\":\"male\",\"value\":\"male\"},{\"lsType\":\"codeValue\",\"lsKind\":\"species\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"codeKind\":\"species\",\"codeType\":\"subject attributes\",\"codeOrigin\":\"ACAS DDICT\",\"codeValue\":\"homo sapiens\",\"value\":\"homo sapiens\"}],\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\"},{\"lsType\":\"status\",\"lsKind\":\"current subject status\",\"lsValues\":[{\"lsType\":\"dateValue\",\"lsKind\":\"weight measured date\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"value\":1452643200000,\"dateValue\":1452643200000},{\"lsType\":\"codeValue\",\"lsKind\":\"weight measured by\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"value\":\"bob\",\"codeValue\":\"bob\"},{\"lsType\":\"numericValue\",\"lsKind\":\"current weight\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"value\":123,\"numericValue\":123}],\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\"}],\"cid\":\"c162\",\"_changing\":false,\"_previousAttributes\":{\"lsType\":\"container\",\"lsKind\":\"container\",\"corpName\":\"\",\"recordedBy\":\"bob\",\"recordedDate\":1452795007545,\"shortDescription\":\" \",\"lsLabels\":[{\"lsType\":\"name\",\"lsKind\":\"subject name\",\"labelText\":\"Test Cont 8\",\"ignored\":false,\"preferred\":true,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"physicallyLabled\":false,\"imageFile\":null},{\"lsType\":\"corpName\",\"lsKind\":\"ACAS LsContainer\",\"labelText\":\"NHP-00014\",\"ignored\":false,\"preferred\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"physicallyLabled\":false,\"imageFile\":null},{\"lsType\":\"barcode\",\"lsKind\":\"subject barcode\",\"labelText\":\"\",\"ignored\":false,\"preferred\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"physicallyLabled\":false,\"imageFile\":null}]},\"changed\":{\"lsStates\":[{\"lsType\":\"metadata\",\"lsKind\":\"subject attributes\",\"lsValues\":[{\"lsType\":\"codeValue\",\"lsKind\":\"sex\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"codeKind\":\"sex\",\"codeType\":\"subject attributes\",\"codeOrigin\":\"ACAS DDICT\",\"codeValue\":\"male\",\"value\":\"male\"},{\"lsType\":\"codeValue\",\"lsKind\":\"species\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"codeKind\":\"species\",\"codeType\":\"subject attributes\",\"codeOrigin\":\"ACAS DDICT\",\"codeValue\":\"homo sapiens\",\"value\":\"homo sapiens\"}],\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\"},{\"lsType\":\"status\",\"lsKind\":\"current subject status\",\"lsValues\":[{\"lsType\":\"dateValue\",\"lsKind\":\"weight measured date\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"value\":1452643200000,\"dateValue\":1452643200000},{\"lsType\":\"codeValue\",\"lsKind\":\"weight measured by\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"value\":\"bob\",\"codeValue\":\"bob\"},{\"lsType\":\"numericValue\",\"lsKind\":\"current weight\",\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\",\"value\":123,\"numericValue\":123}],\"ignored\":false,\"recordedDate\":1452795015412,\"recordedBy\":\"bob\"}]},\"_pending\":false,\"urlRoot\":\"/api/containers/subject/nhp test subject\",\"lsProperties\":{\"defaultLabels\":[{\"key\":\"subject name\",\"type\":\"name\",\"kind\":\"subject name\",\"preferred\":true},{\"key\":\"corpName\",\"type\":\"corpName\",\"kind\":\"ACAS LsContainer\",\"preferred\":false},{\"key\":\"subject barcode\",\"type\":\"barcode\",\"kind\":\"subject barcode\",\"preferred\":false}],\"defaultValues\":[{\"key\":\"sex\",\"stateType\":\"metadata\",\"stateKind\":\"subject attributes\",\"type\":\"codeValue\",\"kind\":\"sex\",\"codeType\":\"subject attributes\",\"codeKind\":\"sex\",\"codeOrigin\":\"ACAS DDICT\",\"value\":\"\"},{\"key\":\"species\",\"stateType\":\"metadata\",\"stateKind\":\"subject attributes\",\"type\":\"codeValue\",\"kind\":\"species\",\"codeType\":\"subject attributes\",\"codeKind\":\"species\",\"codeOrigin\":\"ACAS DDICT\",\"value\":\"\"},{\"key\":\"weight measured date\",\"stateType\":\"status\",\"stateKind\":\"current subject status\",\"type\":\"dateValue\",\"kind\":\"weight measured date\"},{\"key\":\"weight measured by\",\"stateType\":\"status\",\"stateKind\":\"current subject status\",\"type\":\"codeValue\",\"kind\":\"weight measured by\"},{\"key\":\"current weight\",\"stateType\":\"status\",\"stateKind\":\"current subject status\",\"type\":\"numericValue\",\"kind\":\"current weight\"}]},\"className\":\"Container\",\"validationError\":null,\"idAttribute\":\"id\"}";
		Container jsonContainer = Container.fromJsonToContainer(json);
		MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/containers/validate")
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON)
				.content(jsonContainer.toJson()))
				.andExpect(status().isConflict())
				.andExpect(content().contentType("application/json;charset=utf-8"))
				.andReturn().getResponse();
		String responseJson = response.getContentAsString();
		logger.info(responseJson);
		Collection<ErrorMessage> errors = ErrorMessage.fromJsonArrayToErrorMessages(responseJson);
		Assert.assertFalse(errors.isEmpty());
    }
    
    @Test
    @Transactional
    public void getContainerById() throws Exception{
    	Container container = Container.findContainersByLsTypeEqualsAndLsKindEquals("container", "plate").getResultList().get(0);
    	String id = container.getId().toString();
    	MockHttpServletResponse response = this.mockMvc.perform(get("/api/v1/containers/"+id)
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	Container result = Container.fromJsonToContainer(responseJson);
    	Assert.assertNotNull(result.getCodeName());
    }
    
    @Test
    @Transactional
    public void getContainerByCodeName() throws Exception{
    	Container container = Container.findContainersByLsTypeEqualsAndLsKindEquals("container", "plate").getResultList().get(0);
    	String codeName = container.getCodeName();
    	MockHttpServletResponse response = this.mockMvc.perform(get("/api/v1/containers/"+codeName)
    			.accept(MediaType.APPLICATION_JSON))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	Container result = Container.fromJsonToContainer(responseJson);
    	Assert.assertNotNull(result.getCodeName());
    }
    
    @Test
    @Transactional
    public void getCodeNameFromNameRequest() throws Exception{
    	Container container = Container.findContainersByLsTypeEqualsAndLsKindEquals("container", "plate").getResultList().get(0);
    	String containerType = container.getLsType();
    	String containerKind = container.getLsKind();
		String label = container.getLsLabels().iterator().next().getLabelText();
		PreferredNameDTO request = new PreferredNameDTO(label, null, null);
		Collection<PreferredNameDTO> requests = new HashSet<PreferredNameDTO>();
		requests.add(request);
		PreferredNameRequestDTO requestDTO = new PreferredNameRequestDTO();
		requestDTO.setRequests(requests);
		String json = requestDTO.toJson();
		Assert.assertFalse(json.equals("{}"));
    	MockHttpServletResponse response = this.mockMvc.perform(post("/api/v1/containers/getCodeNameFromNameRequest"
    			+ "?containerType="+containerType+"&containerKind="+containerKind)
    			.contentType(MediaType.APPLICATION_JSON)
    			.accept(MediaType.APPLICATION_JSON)
    			.content(json))
    			.andExpect(status().isOk())
    			.andExpect(content().contentType("application/json;charset=utf-8"))
    			.andReturn().getResponse();
    	String responseJson = response.getContentAsString();
    	logger.info(responseJson);
    	PreferredNameResultsDTO results = PreferredNameResultsDTO.fromJsonToPreferredNameResultsDTO(responseJson);
    	for (PreferredNameDTO result : results.getResults()){
    		Assert.assertNotNull(result.getRequestName());
    		Assert.assertNotNull(result.getReferenceName());
    		Assert.assertNotNull(result.getPreferredName());
    	}
    }

}