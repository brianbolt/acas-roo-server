// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LabelKind;
import com.labsynch.labseer.domain.LabelType;
import com.labsynch.labseer.web.LabelKindController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LabelKindController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByKindNameEquals", "form" }, method = RequestMethod.GET)
    public String LabelKindController.findLabelKindsByKindNameEqualsForm(Model uiModel) {
        return "labelkinds/findLabelKindsByKindNameEquals";
    }
    
    @RequestMapping(params = "find=ByKindNameEquals", method = RequestMethod.GET)
    public String LabelKindController.findLabelKindsByKindNameEquals(@RequestParam("kindName") String kindName, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelkinds", LabelKind.findLabelKindsByKindNameEquals(kindName, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LabelKind.countFindLabelKindsByKindNameEquals(kindName) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelkinds", LabelKind.findLabelKindsByKindNameEquals(kindName, sortFieldName, sortOrder).getResultList());
        }
        return "labelkinds/list";
    }
    
    @RequestMapping(params = { "find=ByKindNameEqualsAndLsType", "form" }, method = RequestMethod.GET)
    public String LabelKindController.findLabelKindsByKindNameEqualsAndLsTypeForm(Model uiModel) {
        uiModel.addAttribute("labeltypes", LabelType.findAllLabelTypes());
        return "labelkinds/findLabelKindsByKindNameEqualsAndLsType";
    }
    
    @RequestMapping(params = "find=ByKindNameEqualsAndLsType", method = RequestMethod.GET)
    public String LabelKindController.findLabelKindsByKindNameEqualsAndLsType(@RequestParam("kindName") String kindName, @RequestParam("lsType") LabelType lsType, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelkinds", LabelKind.findLabelKindsByKindNameEqualsAndLsType(kindName, lsType, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LabelKind.countFindLabelKindsByKindNameEqualsAndLsType(kindName, lsType) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelkinds", LabelKind.findLabelKindsByKindNameEqualsAndLsType(kindName, lsType, sortFieldName, sortOrder).getResultList());
        }
        return "labelkinds/list";
    }
    
    @RequestMapping(params = { "find=ByLsType", "form" }, method = RequestMethod.GET)
    public String LabelKindController.findLabelKindsByLsTypeForm(Model uiModel) {
        uiModel.addAttribute("labeltypes", LabelType.findAllLabelTypes());
        return "labelkinds/findLabelKindsByLsType";
    }
    
    @RequestMapping(params = "find=ByLsType", method = RequestMethod.GET)
    public String LabelKindController.findLabelKindsByLsType(@RequestParam("lsType") LabelType lsType, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelkinds", LabelKind.findLabelKindsByLsType(lsType, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LabelKind.countFindLabelKindsByLsType(lsType) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelkinds", LabelKind.findLabelKindsByLsType(lsType, sortFieldName, sortOrder).getResultList());
        }
        return "labelkinds/list";
    }
    
}
