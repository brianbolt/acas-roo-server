// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LabelSequence;
import com.labsynch.labseer.web.LabelSequenceController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LabelSequenceController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByLabelTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByLabelTypeAndKindEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByLabelTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByLabelTypeAndKindEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByLabelTypeAndKindEquals(@RequestParam("labelTypeAndKind") String labelTypeAndKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByLabelTypeAndKindEquals(labelTypeAndKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LabelSequence.countFindLabelSequencesByLabelTypeAndKindEquals(labelTypeAndKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByLabelTypeAndKindEquals(labelTypeAndKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "labelsequences/list";
    }
    
    @RequestMapping(params = { "find=ByThingTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByThingTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByThingTypeAndKindEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEquals(@RequestParam("thingTypeAndKind") String thingTypeAndKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEquals(thingTypeAndKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LabelSequence.countFindLabelSequencesByThingTypeAndKindEquals(thingTypeAndKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEquals(thingTypeAndKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "labelsequences/list";
    }
    
    @RequestMapping(params = { "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals(@RequestParam("thingTypeAndKind") String thingTypeAndKind, @RequestParam("labelTypeAndKind") String labelTypeAndKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals(thingTypeAndKind, labelTypeAndKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LabelSequence.countFindLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals(thingTypeAndKind, labelTypeAndKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEquals(thingTypeAndKind, labelTypeAndKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "labelsequences/list";
    }
    
    @RequestMapping(params = { "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals", "form" }, method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEqualsForm(Model uiModel) {
        return "labelsequences/findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals";
    }
    
    @RequestMapping(params = "find=ByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals", method = RequestMethod.GET)
    public String LabelSequenceController.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals(@RequestParam("thingTypeAndKind") String thingTypeAndKind, @RequestParam("labelTypeAndKind") String labelTypeAndKind, @RequestParam("labelPrefix") String labelPrefix, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals(thingTypeAndKind, labelTypeAndKind, labelPrefix, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LabelSequence.countFindLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals(thingTypeAndKind, labelTypeAndKind, labelPrefix) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelsequences", LabelSequence.findLabelSequencesByThingTypeAndKindEqualsAndLabelTypeAndKindEqualsAndLabelPrefixEquals(thingTypeAndKind, labelTypeAndKind, labelPrefix, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "labelsequences/list";
    }
    
}
