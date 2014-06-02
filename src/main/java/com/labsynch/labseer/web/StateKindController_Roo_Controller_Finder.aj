// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.StateKind;
import com.labsynch.labseer.domain.StateType;
import com.labsynch.labseer.web.StateKindController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect StateKindController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByKindNameEquals", "form" }, method = RequestMethod.GET)
    public String StateKindController.findStateKindsByKindNameEqualsForm(Model uiModel) {
        return "statekinds/findStateKindsByKindNameEquals";
    }
    
    @RequestMapping(params = "find=ByKindNameEquals", method = RequestMethod.GET)
    public String StateKindController.findStateKindsByKindNameEquals(@RequestParam("kindName") String kindName, Model uiModel) {
        uiModel.addAttribute("statekinds", StateKind.findStateKindsByKindNameEquals(kindName).getResultList());
        return "statekinds/list";
    }
    
    @RequestMapping(params = { "find=ByKindNameEqualsAndLsType", "form" }, method = RequestMethod.GET)
    public String StateKindController.findStateKindsByKindNameEqualsAndLsTypeForm(Model uiModel) {
        uiModel.addAttribute("statetypes", StateType.findAllStateTypes());
        return "statekinds/findStateKindsByKindNameEqualsAndLsType";
    }
    
    @RequestMapping(params = "find=ByKindNameEqualsAndLsType", method = RequestMethod.GET)
    public String StateKindController.findStateKindsByKindNameEqualsAndLsType(@RequestParam("kindName") String kindName, @RequestParam("lsType") StateType lsType, Model uiModel) {
        uiModel.addAttribute("statekinds", StateKind.findStateKindsByKindNameEqualsAndLsType(kindName, lsType).getResultList());
        return "statekinds/list";
    }
    
    @RequestMapping(params = { "find=ByLsType", "form" }, method = RequestMethod.GET)
    public String StateKindController.findStateKindsByLsTypeForm(Model uiModel) {
        uiModel.addAttribute("statetypes", StateType.findAllStateTypes());
        return "statekinds/findStateKindsByLsType";
    }
    
    @RequestMapping(params = "find=ByLsType", method = RequestMethod.GET)
    public String StateKindController.findStateKindsByLsType(@RequestParam("lsType") StateType lsType, Model uiModel) {
        uiModel.addAttribute("statekinds", StateKind.findStateKindsByLsType(lsType).getResultList());
        return "statekinds/list";
    }
    
}
