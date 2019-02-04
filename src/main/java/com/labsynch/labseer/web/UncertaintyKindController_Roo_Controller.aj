// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.UncertaintyKind;
import com.labsynch.labseer.web.UncertaintyKindController;
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

privileged aspect UncertaintyKindController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UncertaintyKindController.create(@Valid UncertaintyKind uncertaintyKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, uncertaintyKind);
            return "uncertaintykinds/create";
        }
        uiModel.asMap().clear();
        uncertaintyKind.persist();
        return "redirect:/uncertaintykinds/" + encodeUrlPathSegment(uncertaintyKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UncertaintyKindController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UncertaintyKind());
        return "uncertaintykinds/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UncertaintyKindController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("uncertaintykind", UncertaintyKind.findUncertaintyKind(id));
        uiModel.addAttribute("itemId", id);
        return "uncertaintykinds/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UncertaintyKindController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("uncertaintykinds", UncertaintyKind.findUncertaintyKindEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) UncertaintyKind.countUncertaintyKinds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("uncertaintykinds", UncertaintyKind.findAllUncertaintyKinds(sortFieldName, sortOrder));
        }
        return "uncertaintykinds/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UncertaintyKindController.update(@Valid UncertaintyKind uncertaintyKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, uncertaintyKind);
            return "uncertaintykinds/update";
        }
        uiModel.asMap().clear();
        uncertaintyKind.merge();
        return "redirect:/uncertaintykinds/" + encodeUrlPathSegment(uncertaintyKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UncertaintyKindController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, UncertaintyKind.findUncertaintyKind(id));
        return "uncertaintykinds/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UncertaintyKindController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UncertaintyKind uncertaintyKind = UncertaintyKind.findUncertaintyKind(id);
        uncertaintyKind.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/uncertaintykinds";
    }
    
    void UncertaintyKindController.populateEditForm(Model uiModel, UncertaintyKind uncertaintyKind) {
        uiModel.addAttribute("uncertaintyKind", uncertaintyKind);
    }
    
    String UncertaintyKindController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
