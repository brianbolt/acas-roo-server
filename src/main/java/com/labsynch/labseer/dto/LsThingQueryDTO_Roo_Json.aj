// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.LsThingQueryDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect LsThingQueryDTO_Roo_Json {
    
    public String LsThingQueryDTO.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String LsThingQueryDTO.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static LsThingQueryDTO LsThingQueryDTO.fromJsonToLsThingQueryDTO(String json) {
        return new JSONDeserializer<LsThingQueryDTO>()
        .use(null, LsThingQueryDTO.class).deserialize(json);
    }
    
    public static String LsThingQueryDTO.toJsonArray(Collection<LsThingQueryDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String LsThingQueryDTO.toJsonArray(Collection<LsThingQueryDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<LsThingQueryDTO> LsThingQueryDTO.fromJsonArrayToLsThingQueryDTO(String json) {
        return new JSONDeserializer<List<LsThingQueryDTO>>()
        .use("values", LsThingQueryDTO.class).deserialize(json);
    }
    
}
