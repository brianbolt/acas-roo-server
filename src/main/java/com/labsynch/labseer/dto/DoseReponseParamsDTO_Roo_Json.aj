// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.DoseReponseParamsDTO;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect DoseReponseParamsDTO_Roo_Json {
    
    public String DoseReponseParamsDTO.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static DoseReponseParamsDTO DoseReponseParamsDTO.fromJsonToDoseReponseParamsDTO(String json) {
        return new JSONDeserializer<DoseReponseParamsDTO>().use(null, DoseReponseParamsDTO.class).deserialize(json);
    }
    
    public static String DoseReponseParamsDTO.toJsonArray(Collection<DoseReponseParamsDTO> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<DoseReponseParamsDTO> DoseReponseParamsDTO.fromJsonArrayToDoseRepoes(String json) {
        return new JSONDeserializer<List<DoseReponseParamsDTO>>().use(null, ArrayList.class).use("values", DoseReponseParamsDTO.class).deserialize(json);
    }
    
}
