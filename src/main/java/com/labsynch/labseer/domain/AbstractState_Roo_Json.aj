// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AbstractState;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect AbstractState_Roo_Json {
    
    public String AbstractState.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static AbstractState AbstractState.fromJsonToAbstractState(String json) {
        return new JSONDeserializer<AbstractState>().use(null, AbstractState.class).deserialize(json);
    }
    
    public static String AbstractState.toJsonArray(Collection<AbstractState> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<AbstractState> AbstractState.fromJsonArrayToAbstractStates(String json) {
        return new JSONDeserializer<List<AbstractState>>().use(null, ArrayList.class).use("values", AbstractState.class).deserialize(json);
    }
    
}
