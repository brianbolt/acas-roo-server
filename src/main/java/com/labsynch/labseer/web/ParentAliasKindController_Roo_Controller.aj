// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ParentAliasKind;
import com.labsynch.labseer.domain.ParentAliasType;
import com.labsynch.labseer.web.ParentAliasKindController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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

privileged aspect ParentAliasKindController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ParentAliasKindController.create(@Valid ParentAliasKind parentAliasKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, parentAliasKind);
            return "parentaliaskinds/create";
        }
        uiModel.asMap().clear();
        parentAliasKind.persist();
        return "redirect:/parentaliaskinds/" + encodeUrlPathSegment(parentAliasKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ParentAliasKindController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ParentAliasKind());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (ParentAliasType.countParentAliasTypes() == 0) {
            dependencies.add(new String[] { "lsType", "parentaliastypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "parentaliaskinds/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ParentAliasKindController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("parentaliaskind", ParentAliasKind.findParentAliasKind(id));
        uiModel.addAttribute("itemId", id);
        return "parentaliaskinds/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ParentAliasKindController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("parentaliaskinds", ParentAliasKind.findParentAliasKindEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ParentAliasKind.countParentAliasKinds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("parentaliaskinds", ParentAliasKind.findAllParentAliasKinds(sortFieldName, sortOrder));
        }
        return "parentaliaskinds/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ParentAliasKindController.update(@Valid ParentAliasKind parentAliasKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, parentAliasKind);
            return "parentaliaskinds/update";
        }
        uiModel.asMap().clear();
        parentAliasKind.merge();
        return "redirect:/parentaliaskinds/" + encodeUrlPathSegment(parentAliasKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ParentAliasKindController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ParentAliasKind.findParentAliasKind(id));
        return "parentaliaskinds/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ParentAliasKindController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ParentAliasKind parentAliasKind = ParentAliasKind.findParentAliasKind(id);
        parentAliasKind.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/parentaliaskinds";
    }
    
    void ParentAliasKindController.populateEditForm(Model uiModel, ParentAliasKind parentAliasKind) {
        uiModel.addAttribute("parentAliasKind", parentAliasKind);
        uiModel.addAttribute("parentaliastypes", ParentAliasType.findAllParentAliasTypes());
    }
    
    String ParentAliasKindController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
