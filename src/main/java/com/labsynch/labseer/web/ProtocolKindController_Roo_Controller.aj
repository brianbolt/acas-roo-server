// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.ProtocolKind;
import com.labsynch.labseer.domain.ProtocolType;
import com.labsynch.labseer.web.ProtocolKindController;
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

privileged aspect ProtocolKindController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProtocolKindController.create(@Valid ProtocolKind protocolKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, protocolKind);
            return "protocolkinds/create";
        }
        uiModel.asMap().clear();
        protocolKind.persist();
        return "redirect:/protocolkinds/" + encodeUrlPathSegment(protocolKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProtocolKindController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProtocolKind());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (ProtocolType.countProtocolTypes() == 0) {
            dependencies.add(new String[] { "lsType", "protocoltypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "protocolkinds/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProtocolKindController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("protocolkind", ProtocolKind.findProtocolKind(id));
        uiModel.addAttribute("itemId", id);
        return "protocolkinds/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProtocolKindController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("protocolkinds", ProtocolKind.findProtocolKindEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ProtocolKind.countProtocolKinds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("protocolkinds", ProtocolKind.findAllProtocolKinds(sortFieldName, sortOrder));
        }
        return "protocolkinds/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProtocolKindController.update(@Valid ProtocolKind protocolKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, protocolKind);
            return "protocolkinds/update";
        }
        uiModel.asMap().clear();
        protocolKind.merge();
        return "redirect:/protocolkinds/" + encodeUrlPathSegment(protocolKind.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProtocolKindController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ProtocolKind.findProtocolKind(id));
        return "protocolkinds/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProtocolKindController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProtocolKind protocolKind = ProtocolKind.findProtocolKind(id);
        protocolKind.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/protocolkinds";
    }
    
    void ProtocolKindController.populateEditForm(Model uiModel, ProtocolKind protocolKind) {
        uiModel.addAttribute("protocolKind", protocolKind);
        uiModel.addAttribute("protocoltypes", ProtocolType.findAllProtocolTypes());
    }
    
    String ProtocolKindController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
