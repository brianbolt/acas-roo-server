// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Author;
import com.labsynch.labseer.domain.AuthorRole;
import com.labsynch.labseer.domain.LsRole;
import com.labsynch.labseer.web.AuthorRoleController;
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

privileged aspect AuthorRoleController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AuthorRoleController.create(@Valid AuthorRole authorRole, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, authorRole);
            return "authorroles/create";
        }
        uiModel.asMap().clear();
        authorRole.persist();
        return "redirect:/authorroles/" + encodeUrlPathSegment(authorRole.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AuthorRoleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AuthorRole());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Author.countAuthors() == 0) {
            dependencies.add(new String[] { "author", "authors" });
        }
        if (LsRole.countLsRoles() == 0) {
            dependencies.add(new String[] { "lsrole", "lsroles" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "authorroles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AuthorRoleController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("authorrole", AuthorRole.findAuthorRole(id));
        uiModel.addAttribute("itemId", id);
        return "authorroles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AuthorRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("authorroles", AuthorRole.findAuthorRoleEntries(firstResult, sizeNo));
            float nrOfPages = (float) AuthorRole.countAuthorRoles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("authorroles", AuthorRole.findAllAuthorRoles());
        }
        return "authorroles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AuthorRoleController.update(@Valid AuthorRole authorRole, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, authorRole);
            return "authorroles/update";
        }
        uiModel.asMap().clear();
        authorRole.merge();
        return "redirect:/authorroles/" + encodeUrlPathSegment(authorRole.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AuthorRoleController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AuthorRole.findAuthorRole(id));
        return "authorroles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AuthorRoleController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AuthorRole authorRole = AuthorRole.findAuthorRole(id);
        authorRole.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/authorroles";
    }
    
    void AuthorRoleController.populateEditForm(Model uiModel, AuthorRole authorRole) {
        uiModel.addAttribute("authorRole", authorRole);
        uiModel.addAttribute("authors", Author.findAllAuthors());
        uiModel.addAttribute("lsroles", LsRole.findAllLsRoles());
    }
    
    String AuthorRoleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
