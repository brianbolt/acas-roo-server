// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LabelKind;
import com.labsynch.labseer.domain.LabelType;
import com.labsynch.labseer.web.LabelKindController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect LabelKindController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LabelKindController.create(@Valid LabelKind labelKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, labelKind);
            return "labelkinds/create";
        }
        uiModel.asMap().clear();
        labelKind.persist();
        return "redirect:/labelkinds/" + encodeUrlPathSegment(labelKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LabelKindController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LabelKind());
        return "labelkinds/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LabelKindController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("labelkind", LabelKind.findLabelKind(id));
        uiModel.addAttribute("itemId", id);
        return "labelkinds/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LabelKindController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labelkinds", LabelKind.findLabelKindEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) LabelKind.countLabelKinds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labelkinds", LabelKind.findAllLabelKinds(sortFieldName, sortOrder));
        }
        return "labelkinds/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LabelKindController.update(@Valid LabelKind labelKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, labelKind);
            return "labelkinds/update";
        }
        uiModel.asMap().clear();
        labelKind.merge();
        return "redirect:/labelkinds/" + encodeUrlPathSegment(labelKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LabelKindController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, LabelKind.findLabelKind(id));
        return "labelkinds/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LabelKindController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LabelKind labelKind = LabelKind.findLabelKind(id);
        labelKind.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/labelkinds";
    }
    
    void LabelKindController.populateEditForm(Model uiModel, LabelKind labelKind) {
        uiModel.addAttribute("labelKind", labelKind);
        uiModel.addAttribute("labeltypes", LabelType.findAllLabelTypes());
    }
    
    String LabelKindController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
