// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.Subject;
import com.labsynch.labseer.domain.ThingPage;
import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.domain.TreatmentGroupLabel;
import com.labsynch.labseer.domain.TreatmentGroupState;
import com.labsynch.labseer.web.TreatmentGroupController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TreatmentGroupController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TreatmentGroupController.create(@Valid TreatmentGroup treatmentGroup, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, treatmentGroup);
            return "treatmentgroups/create";
        }
        uiModel.asMap().clear();
        treatmentGroup.persist();
        return "redirect:/treatmentgroups/" + encodeUrlPathSegment(treatmentGroup.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TreatmentGroupController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TreatmentGroup());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (AnalysisGroup.countAnalysisGroups() == 0) {
            dependencies.add(new String[] { "analysisgroup", "analysisgroups" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "treatmentgroups/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TreatmentGroupController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("treatmentgroup", TreatmentGroup.findTreatmentGroup(id));
        uiModel.addAttribute("itemId", id);
        return "treatmentgroups/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TreatmentGroupController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("treatmentgroups", TreatmentGroup.findTreatmentGroupEntries(firstResult, sizeNo));
            float nrOfPages = (float) TreatmentGroup.countTreatmentGroups() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("treatmentgroups", TreatmentGroup.findAllTreatmentGroups());
        }
        addDateTimeFormatPatterns(uiModel);
        return "treatmentgroups/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TreatmentGroupController.update(@Valid TreatmentGroup treatmentGroup, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, treatmentGroup);
            return "treatmentgroups/update";
        }
        uiModel.asMap().clear();
        treatmentGroup.merge();
        return "redirect:/treatmentgroups/" + encodeUrlPathSegment(treatmentGroup.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TreatmentGroupController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, TreatmentGroup.findTreatmentGroup(id));
        return "treatmentgroups/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TreatmentGroupController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TreatmentGroup treatmentGroup = TreatmentGroup.findTreatmentGroup(id);
        treatmentGroup.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/treatmentgroups";
    }
    
    void TreatmentGroupController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("treatmentGroup_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("treatmentGroup_modifieddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void TreatmentGroupController.populateEditForm(Model uiModel, TreatmentGroup treatmentGroup) {
        uiModel.addAttribute("treatmentGroup", treatmentGroup);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("analysisgroups", AnalysisGroup.findAllAnalysisGroups());
        uiModel.addAttribute("subjects", Subject.findAllSubjects());
        uiModel.addAttribute("thingpages", ThingPage.findAllThingPages());
        uiModel.addAttribute("treatmentgrouplabels", TreatmentGroupLabel.findAllTreatmentGroupLabels());
        uiModel.addAttribute("treatmentgroupstates", TreatmentGroupState.findAllTreatmentGroupStates());
    }
    
    String TreatmentGroupController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
