// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.CodeLabelDTO;
import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CodeLabelDTO_Roo_Json {
    
    public static CodeLabelDTO CodeLabelDTO.fromJsonToCodeLabelDTO(String json) {
        return new JSONDeserializer<CodeLabelDTO>().use(null, CodeLabelDTO.class).deserialize(json);
    }
    
    public static Collection<CodeLabelDTO> CodeLabelDTO.fromJsonArrayToCoes(String json) {
        return new JSONDeserializer<List<CodeLabelDTO>>().use(null, ArrayList.class).use("values", CodeLabelDTO.class).deserialize(json);
    }
    
}
