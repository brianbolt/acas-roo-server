// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.exceptions;

import com.labsynch.labseer.exceptions.LsThingValidationErrorMessage;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect LsThingValidationErrorMessage_Roo_Json {
    
    public String LsThingValidationErrorMessage.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static LsThingValidationErrorMessage LsThingValidationErrorMessage.fromJsonToLsThingValidationErrorMessage(String json) {
        return new JSONDeserializer<LsThingValidationErrorMessage>().use(null, LsThingValidationErrorMessage.class).deserialize(json);
    }
    
    public static String LsThingValidationErrorMessage.toJsonArray(Collection<LsThingValidationErrorMessage> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<LsThingValidationErrorMessage> LsThingValidationErrorMessage.fromJsonArrayToLsThingValidationErrorMessages(String json) {
        return new JSONDeserializer<List<LsThingValidationErrorMessage>>().use(null, ArrayList.class).use("values", LsThingValidationErrorMessage.class).deserialize(json);
    }
    
}
