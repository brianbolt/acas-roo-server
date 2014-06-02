// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ThingType;
import com.labsynch.labseer.web.ThingTypeController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ThingTypeController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByTypeNameEquals", "form" }, method = RequestMethod.GET)
    public String ThingTypeController.findThingTypesByTypeNameEqualsForm(Model uiModel) {
        return "thingtypes/findThingTypesByTypeNameEquals";
    }
    
    @RequestMapping(params = "find=ByTypeNameEquals", method = RequestMethod.GET)
    public String ThingTypeController.findThingTypesByTypeNameEquals(@RequestParam("typeName") String typeName, Model uiModel) {
        uiModel.addAttribute("thingtypes", ThingType.findThingTypesByTypeNameEquals(typeName).getResultList());
        return "thingtypes/list";
    }
    
}
