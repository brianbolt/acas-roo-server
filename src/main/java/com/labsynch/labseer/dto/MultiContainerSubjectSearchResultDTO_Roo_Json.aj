// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.MultiContainerSubjectSearchResultDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect MultiContainerSubjectSearchResultDTO_Roo_Json {
    
    public static MultiContainerSubjectSearchResultDTO MultiContainerSubjectSearchResultDTO.fromJsonToMultiContainerSubjectSearchResultDTO(String json) {
        return new JSONDeserializer<MultiContainerSubjectSearchResultDTO>()
        .use(null, MultiContainerSubjectSearchResultDTO.class).deserialize(json);
    }
    
    public static String MultiContainerSubjectSearchResultDTO.toJsonArray(Collection<MultiContainerSubjectSearchResultDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String MultiContainerSubjectSearchResultDTO.toJsonArray(Collection<MultiContainerSubjectSearchResultDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<MultiContainerSubjectSearchResultDTO> MultiContainerSubjectSearchResultDTO.fromJsonArrayToMultiCoes(String json) {
        return new JSONDeserializer<List<MultiContainerSubjectSearchResultDTO>>()
        .use("values", MultiContainerSubjectSearchResultDTO.class).deserialize(json);
    }
    
}
