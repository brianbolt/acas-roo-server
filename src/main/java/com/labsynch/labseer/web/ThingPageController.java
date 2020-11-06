package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.AbstractThing;
import com.labsynch.labseer.domain.LsTransaction;
import com.labsynch.labseer.domain.ThingPage;
import com.labsynch.labseer.utils.PropertiesUtilService;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RooWebJson(jsonObject = ThingPage.class)
@Controller
@RequestMapping("/thingpages")
@RooWebScaffold(path = "thingpages", formBackingObject = ThingPage.class)
public class ThingPageController {

    @Autowired
    private PropertiesUtilService propertiesUtilService;

    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<java.lang.String> showJson(@PathVariable("id") Long id) {
        ThingPage thingPage = ThingPage.findThingPage(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (thingPage == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(thingPage.toJson(), headers, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<java.lang.String> listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ThingPage> result = ThingPage.findAllThingPages();
        return new ResponseEntity<String>(ThingPage.toJsonArray(result), headers, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> createFromJson(@RequestBody String json) {
        ThingPage thingPage = ThingPage.fromJsonToThingPage(json);
        thingPage.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> createFromJsonArray(@RequestBody String json) {
        int batchSize = propertiesUtilService.getBatchSize();
        int i = 0;
        for (ThingPage thingPage : ThingPage.fromJsonArrayToThingPages(json)) {
            thingPage.persist();
            if (i % batchSize == 0) {
                thingPage.flush();
                thingPage.clear();
            }
            i++;
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = { "/", "/{id}" }, method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ThingPage thingPage = ThingPage.fromJsonToThingPage(json);
        if (thingPage.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ThingPage thingPage : ThingPage.fromJsonArrayToThingPages(json)) {
            if (thingPage.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<java.lang.String> deleteFromJson(@PathVariable("id") Long id) {
        ThingPage thingPage = ThingPage.findThingPage(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (thingPage == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        thingPage.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ThingPage thingPage, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, thingPage);
            return "thingpages/create";
        }
        uiModel.asMap().clear();
        thingPage.persist();
        return "redirect:/thingpages/" + encodeUrlPathSegment(thingPage.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ThingPage());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (AbstractThing.countAbstractThings() == 0) {
            dependencies.add(new String[] { "lsTransaction", "abstractthings" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "thingpages/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("thingpage", ThingPage.findThingPage(id));
        uiModel.addAttribute("itemId", id);
        return "thingpages/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("thingpages", ThingPage.findThingPageEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ThingPage.countThingPages() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("thingpages", ThingPage.findAllThingPages(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "thingpages/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ThingPage thingPage, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, thingPage);
            return "thingpages/update";
        }
        uiModel.asMap().clear();
        thingPage.merge();
        return "redirect:/thingpages/" + encodeUrlPathSegment(thingPage.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ThingPage.findThingPage(id));
        return "thingpages/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ThingPage thingPage = ThingPage.findThingPage(id);
        thingPage.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/thingpages";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("thingPage_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("thingPage_modifieddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, ThingPage thingPage) {
        uiModel.addAttribute("thingPage", thingPage);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("abstractthings", AbstractThing.findAllAbstractThings());
        uiModel.addAttribute("lstransactions", LsTransaction.findAllLsTransactions());
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
