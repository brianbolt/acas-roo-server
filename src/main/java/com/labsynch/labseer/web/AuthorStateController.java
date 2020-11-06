package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Author;
import com.labsynch.labseer.domain.AuthorState;
import com.labsynch.labseer.domain.AuthorValue;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/authorstates")
@Controller
@RooWebScaffold(path = "authorstates", formBackingObject = AuthorState.class)
public class AuthorStateController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid AuthorState authorState, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, authorState);
            return "authorstates/create";
        }
        uiModel.asMap().clear();
        authorState.persist();
        return "redirect:/authorstates/" + encodeUrlPathSegment(authorState.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new AuthorState());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Author.countAuthors() == 0) {
            dependencies.add(new String[] { "author", "authors" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "authorstates/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("authorstate", AuthorState.findAuthorState(id));
        uiModel.addAttribute("itemId", id);
        return "authorstates/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("authorstates", AuthorState.findAuthorStateEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) AuthorState.countAuthorStates() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("authorstates", AuthorState.findAllAuthorStates(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "authorstates/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid AuthorState authorState, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, authorState);
            return "authorstates/update";
        }
        uiModel.asMap().clear();
        authorState.merge();
        return "redirect:/authorstates/" + encodeUrlPathSegment(authorState.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AuthorState.findAuthorState(id));
        return "authorstates/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AuthorState authorState = AuthorState.findAuthorState(id);
        authorState.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/authorstates";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("authorState_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("authorState_modifieddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, AuthorState authorState) {
        uiModel.addAttribute("authorState", authorState);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("authors", Author.findAllAuthors());
        uiModel.addAttribute("authorvalues", AuthorValue.findAllAuthorValues());
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
