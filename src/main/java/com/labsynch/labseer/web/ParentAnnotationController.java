package com.labsynch.labseer.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import com.labsynch.labseer.domain.ParentAnnotation;
import java.io.UnsupportedEncodingException;

@RooWebScaffold(path = "parentAnnotations", formBackingObject = ParentAnnotation.class)
@RequestMapping("/parentAnnotations")
@Transactional
@Controller

@RooWebFinder
public class ParentAnnotationController {

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showJson(@PathVariable("id") Long id) {
        ParentAnnotation parentAnnotation = ParentAnnotation.findParentAnnotation(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        headers.add("Access-Control-Allow-Headers", "Content-Type");
        headers.add("Access-Control-Allow-Origin", "*");
        headers.add("Cache-Control", "no-store, no-cache, must-revalidate"); //HTTP 1.1
        headers.add("Pragma", "no-cache"); //HTTP 1.0
        headers.setExpires(0); // Expire the cache
        if (parentAnnotation == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(parentAnnotation.toJson(), headers, HttpStatus.OK);
    }

    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        headers.add("Access-Control-Allow-Headers", "Content-Type");
        headers.add("Access-Control-Allow-Origin", "*");
        headers.add("Cache-Control", "no-store, no-cache, must-revalidate"); //HTTP 1.1
        headers.add("Pragma", "no-cache"); //HTTP 1.0
        headers.setExpires(0); // Expire the cache
        return new ResponseEntity<String>(ParentAnnotation.toJsonArray(ParentAnnotation.findAllParentAnnotations("displayOrder", "ASC")), headers, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
        ParentAnnotation.fromJsonToParentAnnotation(json).persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        headers.add("Access-Control-Allow-Headers", "Content-Type");
        headers.add("Access-Control-Allow-Origin", "*");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJsonArray(@RequestBody String json) {
        for (ParentAnnotation parentAnnotation : ParentAnnotation.fromJsonArrayToParentAnnotations(json)) {
            parentAnnotation.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        headers.add("Access-Control-Allow-Headers", "Content-Type");
        headers.add("Access-Control-Allow-Origin", "*");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        headers.add("Access-Control-Allow-Headers", "Content-Type");
        headers.add("Access-Control-Allow-Origin", "*");
        if (ParentAnnotation.fromJsonToParentAnnotation(json).merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        headers.add("Access-Control-Allow-Headers", "Content-Type");
        headers.add("Access-Control-Allow-Origin", "*");
        for (ParentAnnotation parentAnnotation : ParentAnnotation.fromJsonArrayToParentAnnotations(json)) {
            if (parentAnnotation.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> deleteFromJson(@PathVariable("id") Long id) {
        ParentAnnotation parentAnnotation = ParentAnnotation.findParentAnnotation(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        headers.add("Access-Control-Allow-Headers", "Content-Type");
        headers.add("Access-Control-Allow-Origin", "*");
        if (parentAnnotation == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        parentAnnotation.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }


	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ParentAnnotation parentAnnotation, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, parentAnnotation);
            return "parentAnnotations/create";
        }
        uiModel.asMap().clear();
        parentAnnotation.persist();
        return "redirect:/parentAnnotations/" + encodeUrlPathSegment(parentAnnotation.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ParentAnnotation());
        return "parentAnnotations/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("parentannotation", ParentAnnotation.findParentAnnotation(id));
        uiModel.addAttribute("itemId", id);
        return "parentAnnotations/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("parentannotations", ParentAnnotation.findParentAnnotationEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ParentAnnotation.countParentAnnotations() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("parentannotations", ParentAnnotation.findAllParentAnnotations(sortFieldName, sortOrder));
        }
        return "parentAnnotations/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ParentAnnotation parentAnnotation, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, parentAnnotation);
            return "parentAnnotations/update";
        }
        uiModel.asMap().clear();
        parentAnnotation.merge();
        return "redirect:/parentAnnotations/" + encodeUrlPathSegment(parentAnnotation.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ParentAnnotation.findParentAnnotation(id));
        return "parentAnnotations/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ParentAnnotation parentAnnotation = ParentAnnotation.findParentAnnotation(id);
        parentAnnotation.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/parentAnnotations";
    }

	void populateEditForm(Model uiModel, ParentAnnotation parentAnnotation) {
        uiModel.addAttribute("parentAnnotation", parentAnnotation);
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

	@RequestMapping(params = { "find=ByCodeEquals", "form" }, method = RequestMethod.GET)
    public String findParentAnnotationsByCodeEqualsForm(Model uiModel) {
        return "parentAnnotations/findParentAnnotationsByCodeEquals";
    }

	@RequestMapping(params = "find=ByCodeEquals", method = RequestMethod.GET)
    public String findParentAnnotationsByCodeEquals(@RequestParam("code") String code, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("parentannotations", ParentAnnotation.findParentAnnotationsByCodeEquals(code, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ParentAnnotation.countFindParentAnnotationsByCodeEquals(code) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("parentannotations", ParentAnnotation.findParentAnnotationsByCodeEquals(code, sortFieldName, sortOrder).getResultList());
        }
        return "parentAnnotations/list";
    }
}
