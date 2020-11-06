package com.labsynch.labseer.web;
import com.labsynch.labseer.domain.SaltFormAliasKind;
import com.labsynch.labseer.domain.SaltFormAliasType;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/saltformaliaskinds")
@Controller
public class SaltFormAliasKindController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid SaltFormAliasKind saltFormAliasKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, saltFormAliasKind);
            return "saltformaliaskinds/create";
        }
        uiModel.asMap().clear();
        saltFormAliasKind.persist();
        return "redirect:/saltformaliaskinds/" + encodeUrlPathSegment(saltFormAliasKind.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new SaltFormAliasKind());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (SaltFormAliasType.countSaltFormAliasTypes() == 0) {
            dependencies.add(new String[] { "lsType", "saltformaliastypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "saltformaliaskinds/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("saltformaliaskind", SaltFormAliasKind.findSaltFormAliasKind(id));
        uiModel.addAttribute("itemId", id);
        return "saltformaliaskinds/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("saltformaliaskinds", SaltFormAliasKind.findSaltFormAliasKindEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) SaltFormAliasKind.countSaltFormAliasKinds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("saltformaliaskinds", SaltFormAliasKind.findAllSaltFormAliasKinds(sortFieldName, sortOrder));
        }
        return "saltformaliaskinds/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid SaltFormAliasKind saltFormAliasKind, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, saltFormAliasKind);
            return "saltformaliaskinds/update";
        }
        uiModel.asMap().clear();
        saltFormAliasKind.merge();
        return "redirect:/saltformaliaskinds/" + encodeUrlPathSegment(saltFormAliasKind.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, SaltFormAliasKind.findSaltFormAliasKind(id));
        return "saltformaliaskinds/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SaltFormAliasKind saltFormAliasKind = SaltFormAliasKind.findSaltFormAliasKind(id);
        saltFormAliasKind.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/saltformaliaskinds";
    }

	void populateEditForm(Model uiModel, SaltFormAliasKind saltFormAliasKind) {
        uiModel.addAttribute("saltFormAliasKind", saltFormAliasKind);
        uiModel.addAttribute("saltformaliastypes", SaltFormAliasType.findAllSaltFormAliasTypes());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
