// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.ParentAlias;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ParentAlias_Roo_Json {
    
    public String ParentAlias.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String ParentAlias.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static ParentAlias ParentAlias.fromJsonToParentAlias(String json) {
        return new JSONDeserializer<ParentAlias>()
        .use(null, ParentAlias.class).deserialize(json);
    }
    
    public static String ParentAlias.toJsonArray(Collection<ParentAlias> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String ParentAlias.toJsonArray(Collection<ParentAlias> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<ParentAlias> ParentAlias.fromJsonArrayToParentAliases(String json) {
        return new JSONDeserializer<List<ParentAlias>>()
        .use("values", ParentAlias.class).deserialize(json);
    }
    
}
