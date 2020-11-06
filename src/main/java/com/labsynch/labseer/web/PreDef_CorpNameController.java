package com.labsynch.labseer.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import com.labsynch.labseer.domain.PreDef_CorpName;
import java.io.UnsupportedEncodingException;

@RequestMapping("/predef_corpnames")
@Controller
@RooWebScaffold(path = "predef_corpnames", formBackingObject = PreDef_CorpName.class)

public class PreDef_CorpNameController {


	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid PreDef_CorpName preDef_CorpName, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, preDef_CorpName);
            return "predef_corpnames/create";
        }
        uiModel.asMap().clear();
        preDef_CorpName.persist();
        return "redirect:/predef_corpnames/" + encodeUrlPathSegment(preDef_CorpName.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new PreDef_CorpName());
        return "predef_corpnames/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("predef_corpname", PreDef_CorpName.findPreDef_CorpName(id));
        uiModel.addAttribute("itemId", id);
        return "predef_corpnames/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("predef_corpnames", PreDef_CorpName.findPreDef_CorpNameEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) PreDef_CorpName.countPreDef_CorpNames() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("predef_corpnames", PreDef_CorpName.findAllPreDef_CorpNames(sortFieldName, sortOrder));
        }
        return "predef_corpnames/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PreDef_CorpName preDef_CorpName, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, preDef_CorpName);
            return "predef_corpnames/update";
        }
        uiModel.asMap().clear();
        preDef_CorpName.merge();
        return "redirect:/predef_corpnames/" + encodeUrlPathSegment(preDef_CorpName.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, PreDef_CorpName.findPreDef_CorpName(id));
        return "predef_corpnames/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PreDef_CorpName preDef_CorpName = PreDef_CorpName.findPreDef_CorpName(id);
        preDef_CorpName.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/predef_corpnames";
    }

	void populateEditForm(Model uiModel, PreDef_CorpName preDef_CorpName) {
        uiModel.addAttribute("preDef_CorpName", preDef_CorpName);
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
