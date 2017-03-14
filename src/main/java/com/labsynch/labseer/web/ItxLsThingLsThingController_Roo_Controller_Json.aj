// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ItxLsThingLsThing;
import com.labsynch.labseer.web.ItxLsThingLsThingController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect ItxLsThingLsThingController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ItxLsThingLsThingController.showJson(@PathVariable("id") Long id) {
        ItxLsThingLsThing itxLsThingLsThing = ItxLsThingLsThing.findItxLsThingLsThing(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (itxLsThingLsThing == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(itxLsThingLsThing.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ItxLsThingLsThingController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ItxLsThingLsThing> result = ItxLsThingLsThing.findAllItxLsThingLsThings();
        return new ResponseEntity<String>(ItxLsThingLsThing.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ItxLsThingLsThingController.createFromJson(@RequestBody String json) {
        ItxLsThingLsThing itxLsThingLsThing = ItxLsThingLsThing.fromJsonToItxLsThingLsThing(json);
        itxLsThingLsThing.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ItxLsThingLsThingController.createFromJsonArray(@RequestBody String json) {
        for (ItxLsThingLsThing itxLsThingLsThing: ItxLsThingLsThing.fromJsonArrayToItxLsThingLsThings(json)) {
            itxLsThingLsThing.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ItxLsThingLsThingController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ItxLsThingLsThing itxLsThingLsThing = ItxLsThingLsThing.fromJsonToItxLsThingLsThing(json);
        if (itxLsThingLsThing.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ItxLsThingLsThingController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ItxLsThingLsThing itxLsThingLsThing: ItxLsThingLsThing.fromJsonArrayToItxLsThingLsThings(json)) {
            if (itxLsThingLsThing.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ItxLsThingLsThingController.deleteFromJson(@PathVariable("id") Long id) {
        ItxLsThingLsThing itxLsThingLsThing = ItxLsThingLsThing.findItxLsThingLsThing(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (itxLsThingLsThing == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        itxLsThingLsThing.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
