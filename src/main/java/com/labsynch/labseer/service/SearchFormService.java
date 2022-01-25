package com.labsynch.labseer.service;

import java.io.IOException;
import java.util.List;

import com.labsynch.labseer.dto.SearchFormDTO;
import com.labsynch.labseer.dto.SearchFormReturnDTO;
import com.labsynch.labseer.exceptions.CmpdRegMolFormatException;

public interface SearchFormService {


	public SearchFormReturnDTO  findQuerySaltForms(SearchFormDTO searchParams) throws CmpdRegMolFormatException;


	public String findParentIds(String molStructure,
			int maxResults, Float similarity, String searchType,
			String outputFormat) throws IOException, CmpdRegMolFormatException;


	public List<Integer> findParentIds(String molStructure,
			Integer maxResults, Float similarity, String searchType,
			List<String> projects) throws IOException, CmpdRegMolFormatException;

}
