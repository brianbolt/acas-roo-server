// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.AbstractThing;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect AbstractThing_Roo_Json {
    
    public String AbstractThing.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static AbstractThing AbstractThing.fromJsonToAbstractThing(String json) {
        return new JSONDeserializer<AbstractThing>().use(null, AbstractThing.class).deserialize(json);
    }
    
    public static String AbstractThing.toJsonArray(Collection<AbstractThing> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<AbstractThing> AbstractThing.fromJsonArrayToAbstractThings(String json) {
        return new JSONDeserializer<List<AbstractThing>>().use(null, ArrayList.class).use("values", AbstractThing.class).deserialize(json);
    }
    
}
