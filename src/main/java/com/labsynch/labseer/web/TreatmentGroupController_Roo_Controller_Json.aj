// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.web.TreatmentGroupController;
import java.util.Set;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect TreatmentGroupController_Roo_Controller_Json {
    
    @RequestMapping(params = "find=ByAnalysisGroups", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupController.jsonFindTreatmentGroupsByAnalysisGroups(@RequestParam("analysisGroups") Set<AnalysisGroup> analysisGroups) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(TreatmentGroup.toJsonArray(TreatmentGroup.findTreatmentGroupsByAnalysisGroups(analysisGroups).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByCodeNameEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupController.jsonFindTreatmentGroupsByCodeNameEquals(@RequestParam("codeName") String codeName) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(TreatmentGroup.toJsonArray(TreatmentGroup.findTreatmentGroupsByCodeNameEquals(codeName).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TreatmentGroupController.jsonFindTreatmentGroupsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(TreatmentGroup.toJsonArray(TreatmentGroup.findTreatmentGroupsByLsTransactionEquals(lsTransaction).getResultList()), headers, HttpStatus.OK);
    }
    
}
