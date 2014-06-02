// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ExperimentKind;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ExperimentKind_Roo_Json {
    
    public String ExperimentKind.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static ExperimentKind ExperimentKind.fromJsonToExperimentKind(String json) {
        return new JSONDeserializer<ExperimentKind>().use(null, ExperimentKind.class).deserialize(json);
    }
    
    public static String ExperimentKind.toJsonArray(Collection<ExperimentKind> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<ExperimentKind> ExperimentKind.fromJsonArrayToExperimentKinds(String json) {
        return new JSONDeserializer<List<ExperimentKind>>().use(null, ArrayList.class).use("values", ExperimentKind.class).deserialize(json);
    }
    
}
