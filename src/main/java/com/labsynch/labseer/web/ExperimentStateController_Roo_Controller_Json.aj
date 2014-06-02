// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ExperimentState;
import com.labsynch.labseer.web.ExperimentStateController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect ExperimentStateController_Roo_Controller_Json {
    
    @RequestMapping(params = "find=ByExperiment", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ExperimentStateController.jsonFindExperimentStatesByExperiment(@RequestParam("experiment") Experiment experiment) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ExperimentState.toJsonArray(ExperimentState.findExperimentStatesByExperiment(experiment).getResultList()), headers, HttpStatus.OK);
    }
    
}
