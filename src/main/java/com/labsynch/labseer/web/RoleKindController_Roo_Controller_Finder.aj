// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.RoleKind;
import com.labsynch.labseer.domain.RoleType;
import com.labsynch.labseer.web.RoleKindController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RoleKindController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByKindNameEqualsAndLsType", "form" }, method = RequestMethod.GET)
    public String RoleKindController.findRoleKindsByKindNameEqualsAndLsTypeForm(Model uiModel) {
        uiModel.addAttribute("roletypes", RoleType.findAllRoleTypes());
        return "rolekinds/findRoleKindsByKindNameEqualsAndLsType";
    }
    
    @RequestMapping(params = "find=ByKindNameEqualsAndLsType", method = RequestMethod.GET)
    public String RoleKindController.findRoleKindsByKindNameEqualsAndLsType(@RequestParam("kindName") String kindName, @RequestParam("lsType") RoleType lsType, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("rolekinds", RoleKind.findRoleKindsByKindNameEqualsAndLsType(kindName, lsType, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) RoleKind.countFindRoleKindsByKindNameEqualsAndLsType(kindName, lsType) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("rolekinds", RoleKind.findRoleKindsByKindNameEqualsAndLsType(kindName, lsType, sortFieldName, sortOrder).getResultList());
        }
        return "rolekinds/list";
    }
    
    @RequestMapping(params = { "find=ByLsType", "form" }, method = RequestMethod.GET)
    public String RoleKindController.findRoleKindsByLsTypeForm(Model uiModel) {
        uiModel.addAttribute("roletypes", RoleType.findAllRoleTypes());
        return "rolekinds/findRoleKindsByLsType";
    }
    
    @RequestMapping(params = "find=ByLsType", method = RequestMethod.GET)
    public String RoleKindController.findRoleKindsByLsType(@RequestParam("lsType") RoleType lsType, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("rolekinds", RoleKind.findRoleKindsByLsType(lsType, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) RoleKind.countFindRoleKindsByLsType(lsType) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("rolekinds", RoleKind.findRoleKindsByLsType(lsType, sortFieldName, sortOrder).getResultList());
        }
        return "rolekinds/list";
    }
    
}
