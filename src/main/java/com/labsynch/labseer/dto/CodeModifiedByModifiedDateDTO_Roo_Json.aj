// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.CodeModifiedByModifiedDateDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CodeModifiedByModifiedDateDTO_Roo_Json {
    
    public String CodeModifiedByModifiedDateDTO.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static CodeModifiedByModifiedDateDTO CodeModifiedByModifiedDateDTO.fromJsonToCodeModifiedByModifiedDateDTO(String json) {
        return new JSONDeserializer<CodeModifiedByModifiedDateDTO>().use(null, CodeModifiedByModifiedDateDTO.class).deserialize(json);
    }
    
    public static String CodeModifiedByModifiedDateDTO.toJsonArray(Collection<CodeModifiedByModifiedDateDTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<CodeModifiedByModifiedDateDTO> CodeModifiedByModifiedDateDTO.fromJsonArrayToCodeModifiedByMoes(String json) {
        return new JSONDeserializer<List<CodeModifiedByModifiedDateDTO>>().use(null, ArrayList.class).use("values", CodeModifiedByModifiedDateDTO.class).deserialize(json);
    }
    
}
