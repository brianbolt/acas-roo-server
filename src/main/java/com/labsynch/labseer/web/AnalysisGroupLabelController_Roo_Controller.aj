// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AnalysisGroup;
import com.labsynch.labseer.domain.AnalysisGroupLabel;
import com.labsynch.labseer.web.AnalysisGroupLabelController;
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

privileged aspect AnalysisGroupLabelController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AnalysisGroupLabelController.create(@Valid AnalysisGroupLabel analysisGroupLabel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, analysisGroupLabel);
            return "analysisgrouplabels/create";
        }
        uiModel.asMap().clear();
        analysisGroupLabel.persist();
        return "redirect:/analysisgrouplabels/" + encodeUrlPathSegment(analysisGroupLabel.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AnalysisGroupLabelController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AnalysisGroupLabel());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (AnalysisGroup.countAnalysisGroups() == 0) {
            dependencies.add(new String[] { "analysisGroup", "analysisgroups" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "analysisgrouplabels/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AnalysisGroupLabelController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("analysisgrouplabel", AnalysisGroupLabel.findAnalysisGroupLabel(id));
        uiModel.addAttribute("itemId", id);
        return "analysisgrouplabels/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AnalysisGroupLabelController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("analysisgrouplabels", AnalysisGroupLabel.findAnalysisGroupLabelEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) AnalysisGroupLabel.countAnalysisGroupLabels() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("analysisgrouplabels", AnalysisGroupLabel.findAllAnalysisGroupLabels(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "analysisgrouplabels/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AnalysisGroupLabelController.update(@Valid AnalysisGroupLabel analysisGroupLabel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, analysisGroupLabel);
            return "analysisgrouplabels/update";
        }
        uiModel.asMap().clear();
        analysisGroupLabel.merge();
        return "redirect:/analysisgrouplabels/" + encodeUrlPathSegment(analysisGroupLabel.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AnalysisGroupLabelController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AnalysisGroupLabel.findAnalysisGroupLabel(id));
        return "analysisgrouplabels/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AnalysisGroupLabelController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AnalysisGroupLabel analysisGroupLabel = AnalysisGroupLabel.findAnalysisGroupLabel(id);
        analysisGroupLabel.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/analysisgrouplabels";
    }
    
    void AnalysisGroupLabelController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("analysisGroupLabel_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("analysisGroupLabel_modifieddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void AnalysisGroupLabelController.populateEditForm(Model uiModel, AnalysisGroupLabel analysisGroupLabel) {
        uiModel.addAttribute("analysisGroupLabel", analysisGroupLabel);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("analysisgroups", AnalysisGroup.findAllAnalysisGroups());
    }
    
    String AnalysisGroupLabelController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
