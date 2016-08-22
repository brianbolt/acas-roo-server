package com.labsynch.labseer.dto;

import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
public class SubjectCsvDataDTO {
	
	private List<Long> treatmentGroupIds;

	private String subjectCsvFilePath;
	
}


