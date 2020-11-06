package com.labsynch.labseer.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
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
import com.labsynch.labseer.domain.CmpdRegAppSetting;
import java.io.UnsupportedEncodingException;

@RequestMapping("/cmpdregappsettings")
@Controller
@RooWebScaffold(path = "cmpdregappsettings", formBackingObject = CmpdRegAppSetting.class)
@RooWebFinder

public class CmpdRegAppSettingController {
	


	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid CmpdRegAppSetting cmpdRegAppSetting, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmpdRegAppSetting);
            return "cmpdregappsettings/create";
        }
        uiModel.asMap().clear();
        cmpdRegAppSetting.persist();
        return "redirect:/cmpdregappsettings/" + encodeUrlPathSegment(cmpdRegAppSetting.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new CmpdRegAppSetting());
        return "cmpdregappsettings/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("cmpdregappsetting", CmpdRegAppSetting.findCmpdRegAppSetting(id));
        uiModel.addAttribute("itemId", id);
        return "cmpdregappsettings/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("cmpdregappsettings", CmpdRegAppSetting.findCmpdRegAppSettingEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) CmpdRegAppSetting.countCmpdRegAppSettings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cmpdregappsettings", CmpdRegAppSetting.findAllCmpdRegAppSettings(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "cmpdregappsettings/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid CmpdRegAppSetting cmpdRegAppSetting, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmpdRegAppSetting);
            return "cmpdregappsettings/update";
        }
        uiModel.asMap().clear();
        cmpdRegAppSetting.merge();
        return "redirect:/cmpdregappsettings/" + encodeUrlPathSegment(cmpdRegAppSetting.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, CmpdRegAppSetting.findCmpdRegAppSetting(id));
        return "cmpdregappsettings/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CmpdRegAppSetting cmpdRegAppSetting = CmpdRegAppSetting.findCmpdRegAppSetting(id);
        cmpdRegAppSetting.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/cmpdregappsettings";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("cmpdRegAppSetting_recordeddate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, CmpdRegAppSetting cmpdRegAppSetting) {
        uiModel.addAttribute("cmpdRegAppSetting", cmpdRegAppSetting);
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
