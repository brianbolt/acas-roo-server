// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.StoichiometryPropertiesDTO;
import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect StoichiometryPropertiesDTO_Roo_Json {
    
    public static StoichiometryPropertiesDTO StoichiometryPropertiesDTO.fromJsonToStoichiometryPropertiesDTO(String json) {
        return new JSONDeserializer<StoichiometryPropertiesDTO>()
        .use(null, StoichiometryPropertiesDTO.class).deserialize(json);
    }
    
    public static Collection<StoichiometryPropertiesDTO> StoichiometryPropertiesDTO.fromJsonArrayToStoichiometryProes(String json) {
        return new JSONDeserializer<List<StoichiometryPropertiesDTO>>()
        .use("values", StoichiometryPropertiesDTO.class).deserialize(json);
    }
    
}
