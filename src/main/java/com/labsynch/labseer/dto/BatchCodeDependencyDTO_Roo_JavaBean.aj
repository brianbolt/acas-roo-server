// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.dto;

import com.labsynch.labseer.dto.BatchCodeDependencyDTO;
import com.labsynch.labseer.dto.CodeTableDTO;
import com.labsynch.labseer.service.ErrorMessage;
import java.util.Collection;

privileged aspect BatchCodeDependencyDTO_Roo_JavaBean {
    
    public Collection<String> BatchCodeDependencyDTO.getBatchCodes() {
        return this.batchCodes;
    }
    
    public void BatchCodeDependencyDTO.setBatchCodes(Collection<String> batchCodes) {
        this.batchCodes = batchCodes;
    }
    
    public Boolean BatchCodeDependencyDTO.getLinkedDataExists() {
        return this.linkedDataExists;
    }
    
    public void BatchCodeDependencyDTO.setLinkedDataExists(Boolean linkedDataExists) {
        this.linkedDataExists = linkedDataExists;
    }
    
    public Collection<CodeTableDTO> BatchCodeDependencyDTO.getLinkedExperiments() {
        return this.linkedExperiments;
    }
    
    public void BatchCodeDependencyDTO.setLinkedExperiments(Collection<CodeTableDTO> linkedExperiments) {
        this.linkedExperiments = linkedExperiments;
    }
    
    public Collection<ErrorMessage> BatchCodeDependencyDTO.getErrors() {
        return this.errors;
    }
    
    public void BatchCodeDependencyDTO.setErrors(Collection<ErrorMessage> errors) {
        this.errors = errors;
    }
    
}
