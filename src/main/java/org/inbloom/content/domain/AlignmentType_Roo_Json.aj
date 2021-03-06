// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.inbloom.content.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.inbloom.content.domain.AlignmentType;

privileged aspect AlignmentType_Roo_Json {
    
    public String AlignmentType.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String AlignmentType.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static AlignmentType AlignmentType.fromJsonToAlignmentType(String json) {
        return new JSONDeserializer<AlignmentType>().use(null, AlignmentType.class).deserialize(json);
    }
    
    public static String AlignmentType.toJsonArray(Collection<AlignmentType> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String AlignmentType.toJsonArray(Collection<AlignmentType> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<AlignmentType> AlignmentType.fromJsonArrayToAlignmentTypes(String json) {
        return new JSONDeserializer<List<AlignmentType>>().use(null, ArrayList.class).use("values", AlignmentType.class).deserialize(json);
    }
    
}
