// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.ExperimentStatePathDTO;
import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ExperimentStatePathDTO_Roo_Json {
    
    public static ExperimentStatePathDTO ExperimentStatePathDTO.fromJsonToExperimentStatePathDTO(String json) {
        return new JSONDeserializer<ExperimentStatePathDTO>()
        .use(null, ExperimentStatePathDTO.class).deserialize(json);
    }
    
    public static Collection<ExperimentStatePathDTO> ExperimentStatePathDTO.fromJsonArrayToExperimentStatePathDTO(String json) {
        return new JSONDeserializer<List<ExperimentStatePathDTO>>()
        .use("values", ExperimentStatePathDTO.class).deserialize(json);
    }
    
}
