package com.labsynch.labseer.dto;

import java.util.Collection;
import java.util.List;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.labsynch.labseer.domain.SubjectState;
import com.labsynch.labseer.utils.ExcludeNulls;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

public class SubjectStatePathDTO {

	public SubjectStatePathDTO() {
	}

	private String idOrCodeName;

	private String stateType;
	
	private String stateKind;
	
	private Collection<SubjectState> states;
	
	public String toJson() {
        return new JSONSerializer().include("states.lsValues").exclude("*.class").transform(new ExcludeNulls(), void.class).serialize(this);
    }
	
	public static String toJsonArray(Collection<SubjectStatePathDTO> collection) {
        return new JSONSerializer().include("states.lsValues").exclude("*.class").transform(new ExcludeNulls(), void.class).serialize(collection);
    }

	public String getIdOrCodeName() {
        return this.idOrCodeName;
    }

	public void setIdOrCodeName(String idOrCodeName) {
        this.idOrCodeName = idOrCodeName;
    }

	public String getStateType() {
        return this.stateType;
    }

	public void setStateType(String stateType) {
        this.stateType = stateType;
    }

	public String getStateKind() {
        return this.stateKind;
    }

	public void setStateKind(String stateKind) {
        this.stateKind = stateKind;
    }

	public Collection<SubjectState> getStates() {
        return this.states;
    }

	public void setStates(Collection<SubjectState> states) {
        this.states = states;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public static SubjectStatePathDTO fromJsonToSubjectStatePathDTO(String json) {
        return new JSONDeserializer<SubjectStatePathDTO>()
        .use(null, SubjectStatePathDTO.class).deserialize(json);
    }

	public static Collection<SubjectStatePathDTO> fromJsonArrayToSubjectStatePathDTO(String json) {
        return new JSONDeserializer<List<SubjectStatePathDTO>>()
        .use("values", SubjectStatePathDTO.class).deserialize(json);
    }
}


