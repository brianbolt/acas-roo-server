// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.StateValueDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect StateValueDTO_Roo_Json {
    
    public String StateValueDTO.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String StateValueDTO.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static StateValueDTO StateValueDTO.fromJsonToStateValueDTO(String json) {
        return new JSONDeserializer<StateValueDTO>()
        .use(null, StateValueDTO.class).deserialize(json);
    }
    
    public static String StateValueDTO.toJsonArray(Collection<StateValueDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String StateValueDTO.toJsonArray(Collection<StateValueDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<StateValueDTO> StateValueDTO.fromJsonArrayToStateValueDTO(String json) {
        return new JSONDeserializer<List<StateValueDTO>>()
        .use("values", StateValueDTO.class).deserialize(json);
    }
    
}
