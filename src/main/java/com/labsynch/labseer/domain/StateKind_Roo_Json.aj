// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StateKind;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect StateKind_Roo_Json {
    
    public String StateKind.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static StateKind StateKind.fromJsonToStateKind(String json) {
        return new JSONDeserializer<StateKind>().use(null, StateKind.class).deserialize(json);
    }
    
    public static String StateKind.toJsonArray(Collection<StateKind> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<StateKind> StateKind.fromJsonArrayToStateKinds(String json) {
        return new JSONDeserializer<List<StateKind>>().use(null, ArrayList.class).use("values", StateKind.class).deserialize(json);
    }
    
}
