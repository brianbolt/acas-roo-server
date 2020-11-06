package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.TempSelectTable;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/tempselecttables")
@Controller
public class TempSelectTableController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid TempSelectTable tempSelectTable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tempSelectTable);
            return "tempselecttables/create";
        }
        uiModel.asMap().clear();
        tempSelectTable.persist();
        return "redirect:/tempselecttables/" + encodeUrlPathSegment(tempSelectTable.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new TempSelectTable());
        return "tempselecttables/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tempselecttable", TempSelectTable.findTempSelectTable(id));
        uiModel.addAttribute("itemId", id);
        return "tempselecttables/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("tempselecttables", TempSelectTable.findTempSelectTableEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) TempSelectTable.countTempSelectTables() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tempselecttables", TempSelectTable.findAllTempSelectTables(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "tempselecttables/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid TempSelectTable tempSelectTable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tempSelectTable);
            return "tempselecttables/update";
        }
        uiModel.asMap().clear();
        tempSelectTable.merge();
        return "redirect:/tempselecttables/" + encodeUrlPathSegment(tempSelectTable.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, TempSelectTable.findTempSelectTable(id));
        return "tempselecttables/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TempSelectTable tempSelectTable = TempSelectTable.findTempSelectTable(id);
        tempSelectTable.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/tempselecttables";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("tempSelectTable_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, TempSelectTable tempSelectTable) {
        uiModel.addAttribute("tempSelectTable", tempSelectTable);
        addDateTimeFormatPatterns(uiModel);
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
