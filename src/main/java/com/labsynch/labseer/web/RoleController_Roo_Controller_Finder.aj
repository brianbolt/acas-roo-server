// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsRole;
import com.labsynch.labseer.web.RoleController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RoleController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByRoleNameEquals", "form" }, method = RequestMethod.GET)
    public String RoleController.findLsRolesByRoleNameEqualsForm(Model uiModel) {
        return "roles/findLsRolesByRoleNameEquals";
    }
    
    @RequestMapping(params = "find=ByRoleNameEquals", method = RequestMethod.GET)
    public String RoleController.findLsRolesByRoleNameEquals(@RequestParam("roleName") String roleName, Model uiModel) {
        uiModel.addAttribute("lsroles", LsRole.findLsRolesByRoleNameEquals(roleName).getResultList());
        return "roles/list";
    }
    
}
