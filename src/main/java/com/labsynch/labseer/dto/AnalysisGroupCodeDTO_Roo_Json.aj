// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.AnalysisGroupCodeDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect AnalysisGroupCodeDTO_Roo_Json {
    
    public String AnalysisGroupCodeDTO.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String AnalysisGroupCodeDTO.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static AnalysisGroupCodeDTO AnalysisGroupCodeDTO.fromJsonToAnalysisGroupCodeDTO(String json) {
        return new JSONDeserializer<AnalysisGroupCodeDTO>()
        .use(null, AnalysisGroupCodeDTO.class).deserialize(json);
    }
    
    public static String AnalysisGroupCodeDTO.toJsonArray(Collection<AnalysisGroupCodeDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String AnalysisGroupCodeDTO.toJsonArray(Collection<AnalysisGroupCodeDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<AnalysisGroupCodeDTO> AnalysisGroupCodeDTO.fromJsonArrayToAnalysisGroupCoes(String json) {
        return new JSONDeserializer<List<AnalysisGroupCodeDTO>>()
        .use("values", AnalysisGroupCodeDTO.class).deserialize(json);
    }
    
}
