// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.ExperimentErrorMessageDTO;
import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ExperimentErrorMessageDTO_Roo_Json {
    
    public static ExperimentErrorMessageDTO ExperimentErrorMessageDTO.fromJsonToExperimentErrorMessageDTO(String json) {
        return new JSONDeserializer<ExperimentErrorMessageDTO>().use(null, ExperimentErrorMessageDTO.class).deserialize(json);
    }
    
    public static Collection<ExperimentErrorMessageDTO> ExperimentErrorMessageDTO.fromJsonArrayToExperimentErroes(String json) {
        return new JSONDeserializer<List<ExperimentErrorMessageDTO>>().use(null, ArrayList.class).use("values", ExperimentErrorMessageDTO.class).deserialize(json);
    }
    
}
