// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.DateValueComparisonRequest;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect DateValueComparisonRequest_Roo_Json {
    
    public String DateValueComparisonRequest.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String DateValueComparisonRequest.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static DateValueComparisonRequest DateValueComparisonRequest.fromJsonToDateValueComparisonRequest(String json) {
        return new JSONDeserializer<DateValueComparisonRequest>()
        .use(null, DateValueComparisonRequest.class).deserialize(json);
    }
    
    public static String DateValueComparisonRequest.toJsonArray(Collection<DateValueComparisonRequest> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String DateValueComparisonRequest.toJsonArray(Collection<DateValueComparisonRequest> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<DateValueComparisonRequest> DateValueComparisonRequest.fromJsonArrayToDateValueComparisonRequests(String json) {
        return new JSONDeserializer<List<DateValueComparisonRequest>>()
        .use("values", DateValueComparisonRequest.class).deserialize(json);
    }
    
}
