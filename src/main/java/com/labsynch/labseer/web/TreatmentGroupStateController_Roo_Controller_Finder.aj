// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.domain.TreatmentGroupState;
import com.labsynch.labseer.web.TreatmentGroupStateController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect TreatmentGroupStateController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupStateController.findTreatmentGroupStatesByLsTransactionEqualsForm(Model uiModel) {
        return "treatmentgroupstates/findTreatmentGroupStatesByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String TreatmentGroupStateController.findTreatmentGroupStatesByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("treatmentgroupstates", TreatmentGroupState.findTreatmentGroupStatesByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) TreatmentGroupState.countFindTreatmentGroupStatesByLsTransactionEquals(lsTransaction) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("treatmentgroupstates", TreatmentGroupState.findTreatmentGroupStatesByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "treatmentgroupstates/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupStateController.findTreatmentGroupStatesByLsTypeAndKindEqualsForm(Model uiModel) {
        return "treatmentgroupstates/findTreatmentGroupStatesByLsTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByLsTypeAndKindEquals", method = RequestMethod.GET)
    public String TreatmentGroupStateController.findTreatmentGroupStatesByLsTypeAndKindEquals(@RequestParam("lsTypeAndKind") String lsTypeAndKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("treatmentgroupstates", TreatmentGroupState.findTreatmentGroupStatesByLsTypeAndKindEquals(lsTypeAndKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) TreatmentGroupState.countFindTreatmentGroupStatesByLsTypeAndKindEquals(lsTypeAndKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("treatmentgroupstates", TreatmentGroupState.findTreatmentGroupStatesByLsTypeAndKindEquals(lsTypeAndKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "treatmentgroupstates/list";
    }
    
    @RequestMapping(params = { "find=ByTreatmentGroup", "form" }, method = RequestMethod.GET)
    public String TreatmentGroupStateController.findTreatmentGroupStatesByTreatmentGroupForm(Model uiModel) {
        uiModel.addAttribute("treatmentgroups", TreatmentGroup.findAllTreatmentGroups());
        return "treatmentgroupstates/findTreatmentGroupStatesByTreatmentGroup";
    }
    
    @RequestMapping(params = "find=ByTreatmentGroup", method = RequestMethod.GET)
    public String TreatmentGroupStateController.findTreatmentGroupStatesByTreatmentGroup(@RequestParam("treatmentGroup") TreatmentGroup treatmentGroup, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("treatmentgroupstates", TreatmentGroupState.findTreatmentGroupStatesByTreatmentGroup(treatmentGroup, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) TreatmentGroupState.countFindTreatmentGroupStatesByTreatmentGroup(treatmentGroup) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("treatmentgroupstates", TreatmentGroupState.findTreatmentGroupStatesByTreatmentGroup(treatmentGroup, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "treatmentgroupstates/list";
    }
    
}
