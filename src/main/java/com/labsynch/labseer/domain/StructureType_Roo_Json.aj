// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.domain;

import com.labsynch.labseer.domain.StructureType;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect StructureType_Roo_Json {
    
    public String StructureType.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String StructureType.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static StructureType StructureType.fromJsonToStructureType(String json) {
        return new JSONDeserializer<StructureType>()
        .use(null, StructureType.class).deserialize(json);
    }
    
    public static String StructureType.toJsonArray(Collection<StructureType> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String StructureType.toJsonArray(Collection<StructureType> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<StructureType> StructureType.fromJsonArrayToStructureTypes(String json) {
        return new JSONDeserializer<List<StructureType>>()
        .use("values", StructureType.class).deserialize(json);
    }
    
}
