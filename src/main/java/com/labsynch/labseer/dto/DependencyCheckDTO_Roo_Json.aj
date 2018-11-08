// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.DependencyCheckDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect DependencyCheckDTO_Roo_Json {
    
    public static DependencyCheckDTO DependencyCheckDTO.fromJsonToDependencyCheckDTO(String json) {
        return new JSONDeserializer<DependencyCheckDTO>()
        .use(null, DependencyCheckDTO.class).deserialize(json);
    }
    
    public static String DependencyCheckDTO.toJsonArray(Collection<DependencyCheckDTO> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String DependencyCheckDTO.toJsonArray(Collection<DependencyCheckDTO> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<DependencyCheckDTO> DependencyCheckDTO.fromJsonArrayToDependencyCheckDTO(String json) {
        return new JSONDeserializer<List<DependencyCheckDTO>>()
        .use("values", DependencyCheckDTO.class).deserialize(json);
    }
    
}
