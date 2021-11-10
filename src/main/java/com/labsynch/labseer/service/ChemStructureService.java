package com.labsynch.labseer.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.labsynch.labseer.chemclasses.CmpdRegMolecule;
import com.labsynch.labseer.dto.MolConvertOutputDTO;
import com.labsynch.labseer.dto.StrippedSaltDTO;
import com.labsynch.labseer.exceptions.CmpdRegMolFormatException;

@Service
public interface ChemStructureService {


	public CmpdRegMolecule[] searchMols(String molfile, StructureType structureType, int[] cdHitList, SearchType searchType, Float simlarityPercent) throws CmpdRegMolFormatException;

	public CmpdRegMolecule[] searchMols(String molfile, StructureType structureType, int[] inputCdIdHitList, SearchType searchType, Float simlarityPercent, int maxResults) throws CmpdRegMolFormatException;

	public int[] searchMolStructures(String molfile, StructureType structureType, SearchType searchType) throws CmpdRegMolFormatException;

	public int[] searchMolStructures(String molfile, StructureType structureType, SearchType searchType, Float simlarityPercent) throws CmpdRegMolFormatException;

	public int[] searchMolStructures(String molfile, StructureType structureType, SearchType searchType, Float simlarityPercent, int maxResults) throws CmpdRegMolFormatException;

	public int saveStructure(String molfile, StructureType structureType);

	public int saveStructure(String molfile, StructureType structureType, boolean checkForDupes);

	void closeConnection();

	public boolean truncateStructureTable(StructureType structureType);

	public double getMolWeight(String molStructure) throws CmpdRegMolFormatException;

	public CmpdRegMolecule toMolecule(String molStructure) throws CmpdRegMolFormatException;

	public String toMolfile(String molStructure) throws CmpdRegMolFormatException;

	public String toSmiles(String molStructure) throws CmpdRegMolFormatException;

	public int[] checkDupeMol(String molStructure, StructureType structureType) throws CmpdRegMolFormatException;

	public String toInchi(String molStructure);

	public boolean updateStructure(String molStructure, StructureType structureType, int cdId);

	public boolean updateStructure(CmpdRegMolecule mol, StructureType structureType, int cdId);

	public String getMolFormula(String molStructure) throws CmpdRegMolFormatException;

	boolean checkForSalt(String molfile) throws CmpdRegMolFormatException;

	double getExactMass(String molStructure) throws CmpdRegMolFormatException;

	boolean deleteStructure(StructureType structureType, int cdId);

	MolConvertOutputDTO toFormat(String structure, String inputFormat, String outputFormat) throws IOException, CmpdRegMolFormatException;

	MolConvertOutputDTO cleanStructure(String structure, int dim, String opts) throws IOException, CmpdRegMolFormatException;

	String hydrogenizeMol(String structure, String inputFormat, String method) throws IOException, CmpdRegMolFormatException;

	String getCipStereo(String structure) throws IOException, CmpdRegMolFormatException;

	StrippedSaltDTO stripSalts(CmpdRegMolecule inputStructure) throws CmpdRegMolFormatException;

	public String standardizeStructure(String molfile) throws CmpdRegMolFormatException, IOException;

	public boolean compareStructures(String preMolStruct, String postMolStruct, String string);

	public boolean standardizedMolCompare(String queryMol, String targetMol) throws CmpdRegMolFormatException;

	public boolean isEmpty(String molFile) throws CmpdRegMolFormatException;

	public enum SearchType {
		DUPLICATE, DUPLICATE_TAUTOMER, DUPLICATE_NO_TAUTOMER, STEREO_IGNORE, FULL_TAUTOMER,
		SUBSTRUCTURE, SIMILARITY, FULL, EXACT, DEFAULT;

		//IGNORES case on purpose
		public static Optional<SearchType> getIfPresent(String str) {
			return Arrays.stream(SearchType.values())
						 .filter(type -> str.trim().equalsIgnoreCase(type.name()))
						 .findFirst();
		}
	}

	public enum StructureType {
		PARENT("PARENT"), SALT("SALT"), SALT_FORM("SALT_FORM"), DRY_RUN("DRY_RUN_COMPOUND"), COMPOUND("COMPOUND"), QC_COMPOUND("QC_COMPOUND");

		public final String table;
		private StructureType(String table) {
        	this.table = table;
		}

		//IGNORES case on purpose
		public static Optional<StructureType> getIfPresent(String str) {
			return Arrays.stream(StructureType.values())
							.filter(type -> str.trim().equalsIgnoreCase(type.name()))
							.findFirst();
		}
	}
	
}
