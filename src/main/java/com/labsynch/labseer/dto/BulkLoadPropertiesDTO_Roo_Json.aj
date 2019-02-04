// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.BulkLoadPropertiesDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect BulkLoadPropertiesDTO_Roo_Json {
    
    public static BulkLoadPropertiesDTO BulkLoadPropertiesDTO.fromJsonToBulkLoadPropertiesDTO(String json) {
        return new JSONDeserializer<BulkLoadPropertiesDTO>()
        .use(null, BulkLoadPropertiesDTO.class).deserialize(json);
    }
    
    public static String BulkLoadPropertiesDTO.toJsonArray(Collection<BulkLoadPropertiesDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String BulkLoadPropertiesDTO.toJsonArray(Collection<BulkLoadPropertiesDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<BulkLoadPropertiesDTO> BulkLoadPropertiesDTO.fromJsonArrayToBulkLoadProes(String json) {
        return new JSONDeserializer<List<BulkLoadPropertiesDTO>>()
        .use("values", BulkLoadPropertiesDTO.class).deserialize(json);
    }
    
}
