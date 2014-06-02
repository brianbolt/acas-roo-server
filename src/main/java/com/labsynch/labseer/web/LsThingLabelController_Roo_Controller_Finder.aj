// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsThing;
import com.labsynch.labseer.domain.LsThingLabel;
import com.labsynch.labseer.web.LsThingLabelController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LsThingLabelController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByLabelTextEquals", "form" }, method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLabelTextEqualsForm(Model uiModel) {
        return "lsthinglabels/findLsThingLabelsByLabelTextEquals";
    }
    
    @RequestMapping(params = "find=ByLabelTextEquals", method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLabelTextEquals(@RequestParam("labelText") String labelText, Model uiModel) {
        uiModel.addAttribute("lsthinglabels", LsThingLabel.findLsThingLabelsByLabelTextEquals(labelText).getResultList());
        return "lsthinglabels/list";
    }
    
    @RequestMapping(params = { "find=ByLabelTextEqualsAndIgnoredNot", "form" }, method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLabelTextEqualsAndIgnoredNotForm(Model uiModel) {
        return "lsthinglabels/findLsThingLabelsByLabelTextEqualsAndIgnoredNot";
    }
    
    @RequestMapping(params = "find=ByLabelTextEqualsAndIgnoredNot", method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLabelTextEqualsAndIgnoredNot(@RequestParam("labelText") String labelText, @RequestParam(value = "ignored", required = false) boolean ignored, Model uiModel) {
        uiModel.addAttribute("lsthinglabels", LsThingLabel.findLsThingLabelsByLabelTextEqualsAndIgnoredNot(labelText, ignored).getResultList());
        return "lsthinglabels/list";
    }
    
    @RequestMapping(params = { "find=ByLabelTextLike", "form" }, method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLabelTextLikeForm(Model uiModel) {
        return "lsthinglabels/findLsThingLabelsByLabelTextLike";
    }
    
    @RequestMapping(params = "find=ByLabelTextLike", method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLabelTextLike(@RequestParam("labelText") String labelText, Model uiModel) {
        uiModel.addAttribute("lsthinglabels", LsThingLabel.findLsThingLabelsByLabelTextLike(labelText).getResultList());
        return "lsthinglabels/list";
    }
    
    @RequestMapping(params = { "find=ByLsThing", "form" }, method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLsThingForm(Model uiModel) {
        uiModel.addAttribute("lsthings", LsThing.findAllLsThings());
        return "lsthinglabels/findLsThingLabelsByLsThing";
    }
    
    @RequestMapping(params = "find=ByLsThing", method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLsThing(@RequestParam("lsThing") LsThing lsThing, Model uiModel) {
        uiModel.addAttribute("lsthinglabels", LsThingLabel.findLsThingLabelsByLsThing(lsThing).getResultList());
        return "lsthinglabels/list";
    }
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLsTransactionEqualsForm(Model uiModel) {
        return "lsthinglabels/findLsThingLabelsByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String LsThingLabelController.findLsThingLabelsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, Model uiModel) {
        uiModel.addAttribute("lsthinglabels", LsThingLabel.findLsThingLabelsByLsTransactionEquals(lsTransaction).getResultList());
        return "lsthinglabels/list";
    }
    
}
