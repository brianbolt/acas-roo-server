// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.dto.ExperimentErrorMessageDTO;

privileged aspect ExperimentErrorMessageDTO_Roo_JavaBean {
    
    public String ExperimentErrorMessageDTO.getExperimentCodeName() {
        return this.experimentCodeName;
    }
    
    public void ExperimentErrorMessageDTO.setExperimentCodeName(String experimentCodeName) {
        this.experimentCodeName = experimentCodeName;
    }
    
    public String ExperimentErrorMessageDTO.getLevel() {
        return this.level;
    }
    
    public void ExperimentErrorMessageDTO.setLevel(String level) {
        this.level = level;
    }
    
    public String ExperimentErrorMessageDTO.getMessage() {
        return this.message;
    }
    
    public void ExperimentErrorMessageDTO.setMessage(String message) {
        this.message = message;
    }
    
    public Experiment ExperimentErrorMessageDTO.getExperiment() {
        return this.experiment;
    }
    
    public void ExperimentErrorMessageDTO.setExperiment(Experiment experiment) {
        this.experiment = experiment;
    }
    
}
