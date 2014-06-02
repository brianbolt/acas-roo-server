// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupLabel;
import com.labsynch.labseer.domain.AnalysisGroupState;
import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.ThingPage;
import com.labsynch.labseer.domain.TreatmentGroup;
import com.labsynch.labseer.web.ApiAnalysisGroupController;
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

privileged aspect ApiAnalysisGroupController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ApiAnalysisGroupController.create(@Valid AnalysisGroup analysisGroup, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, analysisGroup);
            return "analysisgroups/create";
        }
        uiModel.asMap().clear();
        analysisGroup.persist();
        return "redirect:/analysisgroups/" + encodeUrlPathSegment(analysisGroup.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ApiAnalysisGroupController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AnalysisGroup());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Experiment.countExperiments() == 0) {
            dependencies.add(new String[] { "experiment", "experiments" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "analysisgroups/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ApiAnalysisGroupController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("analysisgroup", AnalysisGroup.findAnalysisGroup(id));
        uiModel.addAttribute("itemId", id);
        return "analysisgroups/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ApiAnalysisGroupController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("analysisgroups", AnalysisGroup.findAnalysisGroupEntries(firstResult, sizeNo));
            float nrOfPages = (float) AnalysisGroup.countAnalysisGroups() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("analysisgroups", AnalysisGroup.findAllAnalysisGroups());
        }
        addDateTimeFormatPatterns(uiModel);
        return "analysisgroups/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ApiAnalysisGroupController.update(@Valid AnalysisGroup analysisGroup, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, analysisGroup);
            return "analysisgroups/update";
        }
        uiModel.asMap().clear();
        analysisGroup.merge();
        return "redirect:/analysisgroups/" + encodeUrlPathSegment(analysisGroup.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ApiAnalysisGroupController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AnalysisGroup.findAnalysisGroup(id));
        return "analysisgroups/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ApiAnalysisGroupController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AnalysisGroup analysisGroup = AnalysisGroup.findAnalysisGroup(id);
        analysisGroup.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/analysisgroups";
    }
    
    void ApiAnalysisGroupController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("analysisGroup_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("analysisGroup_modifieddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ApiAnalysisGroupController.populateEditForm(Model uiModel, AnalysisGroup analysisGroup) {
        uiModel.addAttribute("analysisGroup", analysisGroup);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("analysisgrouplabels", AnalysisGroupLabel.findAllAnalysisGroupLabels());
        uiModel.addAttribute("analysisgroupstates", AnalysisGroupState.findAllAnalysisGroupStates());
        uiModel.addAttribute("experiments", Experiment.findAllExperiments());
        uiModel.addAttribute("thingpages", ThingPage.findAllThingPages());
        uiModel.addAttribute("treatmentgroups", TreatmentGroup.findAllTreatmentGroups());
    }
    
    String ApiAnalysisGroupController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
