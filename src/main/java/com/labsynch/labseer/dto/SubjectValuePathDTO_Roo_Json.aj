// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.SubjectValuePathDTO;
import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect SubjectValuePathDTO_Roo_Json {
    
    public static SubjectValuePathDTO SubjectValuePathDTO.fromJsonToSubjectValuePathDTO(String json) {
        return new JSONDeserializer<SubjectValuePathDTO>()
        .use(null, SubjectValuePathDTO.class).deserialize(json);
    }
    
    public static Collection<SubjectValuePathDTO> SubjectValuePathDTO.fromJsonArrayToSubjectValuePathDTO(String json) {
        return new JSONDeserializer<List<SubjectValuePathDTO>>()
        .use("values", SubjectValuePathDTO.class).deserialize(json);
    }
    
}
