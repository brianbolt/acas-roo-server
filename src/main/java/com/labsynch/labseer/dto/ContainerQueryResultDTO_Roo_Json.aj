// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.ContainerQueryResultDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ContainerQueryResultDTO_Roo_Json {
    
    public static ContainerQueryResultDTO ContainerQueryResultDTO.fromJsonToContainerQueryResultDTO(String json) {
        return new JSONDeserializer<ContainerQueryResultDTO>()
        .use(null, ContainerQueryResultDTO.class).deserialize(json);
    }
    
    public static String ContainerQueryResultDTO.toJsonArray(Collection<ContainerQueryResultDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String ContainerQueryResultDTO.toJsonArray(Collection<ContainerQueryResultDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<ContainerQueryResultDTO> ContainerQueryResultDTO.fromJsonArrayToCoes(String json) {
        return new JSONDeserializer<List<ContainerQueryResultDTO>>()
        .use("values", ContainerQueryResultDTO.class).deserialize(json);
    }
    
}
