// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.RegSearchParamsDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect RegSearchParamsDTO_Roo_Json {
    
    public String RegSearchParamsDTO.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String RegSearchParamsDTO.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static RegSearchParamsDTO RegSearchParamsDTO.fromJsonToRegSearchParamsDTO(String json) {
        return new JSONDeserializer<RegSearchParamsDTO>()
        .use(null, RegSearchParamsDTO.class).deserialize(json);
    }
    
    public static String RegSearchParamsDTO.toJsonArray(Collection<RegSearchParamsDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String RegSearchParamsDTO.toJsonArray(Collection<RegSearchParamsDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<RegSearchParamsDTO> RegSearchParamsDTO.fromJsonArrayToRegSearchParamsDTO(String json) {
        return new JSONDeserializer<List<RegSearchParamsDTO>>()
        .use("values", RegSearchParamsDTO.class).deserialize(json);
    }
    
}
