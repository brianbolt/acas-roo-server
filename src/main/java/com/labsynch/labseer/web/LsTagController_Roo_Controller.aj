// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Experiment;
import com.labsynch.labseer.domain.LsTag;
import com.labsynch.labseer.domain.LsThing;
import com.labsynch.labseer.domain.Protocol;
import com.labsynch.labseer.web.LsTagController;
import java.io.UnsupportedEncodingException;
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

privileged aspect LsTagController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LsTagController.create(@Valid LsTag lsTag, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, lsTag);
            return "lstags/create";
        }
        uiModel.asMap().clear();
        lsTag.persist();
        return "redirect:/lstags/" + encodeUrlPathSegment(lsTag.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LsTagController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LsTag());
        return "lstags/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LsTagController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("lstag", LsTag.findLsTag(id));
        uiModel.addAttribute("itemId", id);
        return "lstags/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LsTagController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lstags", LsTag.findLsTagEntries(firstResult, sizeNo));
            float nrOfPages = (float) LsTag.countLsTags() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lstags", LsTag.findAllLsTags());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lstags/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LsTagController.update(@Valid LsTag lsTag, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, lsTag);
            return "lstags/update";
        }
        uiModel.asMap().clear();
        lsTag.merge();
        return "redirect:/lstags/" + encodeUrlPathSegment(lsTag.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LsTagController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, LsTag.findLsTag(id));
        return "lstags/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LsTagController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LsTag lsTag = LsTag.findLsTag(id);
        lsTag.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/lstags";
    }
    
    void LsTagController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("lsTag_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void LsTagController.populateEditForm(Model uiModel, LsTag lsTag) {
        uiModel.addAttribute("lsTag", lsTag);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("experiments", Experiment.findAllExperiments());
        uiModel.addAttribute("lsthings", LsThing.findAllLsThings());
        uiModel.addAttribute("protocols", Protocol.findAllProtocols());
    }
    
    String LsTagController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
