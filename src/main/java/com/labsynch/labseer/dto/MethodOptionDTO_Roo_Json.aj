// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.MethodOptionDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect MethodOptionDTO_Roo_Json {
    
    public String MethodOptionDTO.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String MethodOptionDTO.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static MethodOptionDTO MethodOptionDTO.fromJsonToMethodOptionDTO(String json) {
        return new JSONDeserializer<MethodOptionDTO>()
        .use(null, MethodOptionDTO.class).deserialize(json);
    }
    
    public static String MethodOptionDTO.toJsonArray(Collection<MethodOptionDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String MethodOptionDTO.toJsonArray(Collection<MethodOptionDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<MethodOptionDTO> MethodOptionDTO.fromJsonArrayToMethodOptioes(String json) {
        return new JSONDeserializer<List<MethodOptionDTO>>()
        .use("values", MethodOptionDTO.class).deserialize(json);
    }
    
}
