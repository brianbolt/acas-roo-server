// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.LsInteraction;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect LsInteraction_Roo_Json {
    
    public String LsInteraction.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String LsInteraction.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static LsInteraction LsInteraction.fromJsonToLsInteraction(String json) {
        return new JSONDeserializer<LsInteraction>()
        .use(null, LsInteraction.class).deserialize(json);
    }
    
    public static String LsInteraction.toJsonArray(Collection<LsInteraction> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String LsInteraction.toJsonArray(Collection<LsInteraction> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<LsInteraction> LsInteraction.fromJsonArrayToLsInteractions(String json) {
        return new JSONDeserializer<List<LsInteraction>>()
        .use("values", LsInteraction.class).deserialize(json);
    }
    
}
