// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsThingState;
import com.labsynch.labseer.domain.LsThingValue;
import com.labsynch.labseer.web.LsThingValueController;
import java.math.BigDecimal;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LsThingValueController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByCodeValueEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByCodeValueEqualsForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByCodeValueEquals";
    }
    
    @RequestMapping(params = "find=ByCodeValueEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByCodeValueEquals(@RequestParam("codeValue") String codeValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByCodeValueEquals(codeValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByCodeValueEquals(codeValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByCodeValueEquals(codeValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByIgnoredNotAndCodeValueEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByIgnoredNotAndCodeValueEqualsForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByIgnoredNotAndCodeValueEquals";
    }
    
    @RequestMapping(params = "find=ByIgnoredNotAndCodeValueEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByIgnoredNotAndCodeValueEquals(@RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam("codeValue") String codeValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByIgnoredNotAndCodeValueEquals(ignored, codeValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByIgnoredNotAndCodeValueEquals(ignored, codeValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByIgnoredNotAndCodeValueEquals(ignored, codeValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndCodeValueLike", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndCodeValueLikeForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndCodeValueLike";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndCodeValueLike", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndCodeValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("codeValue") String codeValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndCodeValueLike(lsKind, codeValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndCodeValueLike(lsKind, codeValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndCodeValueLike(lsKind, codeValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndDateValueGreaterThanEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndDateValueGreaterThanEqualsForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndDateValueGreaterThanEquals";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndDateValueGreaterThanEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndDateValueGreaterThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("dateValue") @DateTimeFormat(style = "MM") Date dateValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueGreaterThanEquals(lsKind, dateValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndDateValueGreaterThanEquals(lsKind, dateValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueGreaterThanEquals(lsKind, dateValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndDateValueLessThanEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndDateValueLessThanEqualsForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndDateValueLessThanEquals";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndDateValueLessThanEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndDateValueLessThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("dateValue") @DateTimeFormat(style = "MM") Date dateValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueLessThanEquals(lsKind, dateValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndDateValueLessThanEquals(lsKind, dateValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueLessThanEquals(lsKind, dateValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndDateValueLike", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndDateValueLikeForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndDateValueLike";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndDateValueLike", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndDateValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("dateValue") @DateTimeFormat(style = "MM") Date dateValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueLike(lsKind, dateValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndDateValueLike(lsKind, dateValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndDateValueLike(lsKind, dateValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndNumericValueEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndNumericValueEqualsForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndNumericValueEquals";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndNumericValueEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndNumericValueEquals(@RequestParam("lsKind") String lsKind, @RequestParam("numericValue") BigDecimal numericValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueEquals(lsKind, numericValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndNumericValueEquals(lsKind, numericValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueEquals(lsKind, numericValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndNumericValueGreaterThanEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEqualsForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEquals";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndNumericValueGreaterThanEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("numericValue") BigDecimal numericValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEquals(lsKind, numericValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEquals(lsKind, numericValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueGreaterThanEquals(lsKind, numericValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndNumericValueLessThanEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndNumericValueLessThanEqualsForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndNumericValueLessThanEquals";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndNumericValueLessThanEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndNumericValueLessThanEquals(@RequestParam("lsKind") String lsKind, @RequestParam("numericValue") BigDecimal numericValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueLessThanEquals(lsKind, numericValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndNumericValueLessThanEquals(lsKind, numericValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndNumericValueLessThanEquals(lsKind, numericValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndStringValueEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndStringValueEqualsForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndStringValueEquals";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndStringValueEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndStringValueEquals(@RequestParam("lsKind") String lsKind, @RequestParam("stringValue") String stringValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndStringValueEquals(lsKind, stringValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndStringValueEquals(lsKind, stringValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndStringValueEquals(lsKind, stringValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEqualsAndStringValueLike", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndStringValueLikeForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByLsKindEqualsAndStringValueLike";
    }
    
    @RequestMapping(params = "find=ByLsKindEqualsAndStringValueLike", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsKindEqualsAndStringValueLike(@RequestParam("lsKind") String lsKind, @RequestParam("stringValue") String stringValue, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndStringValueLike(lsKind, stringValue, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsKindEqualsAndStringValueLike(lsKind, stringValue) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsKindEqualsAndStringValueLike(lsKind, stringValue, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsState", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsStateForm(Model uiModel) {
        uiModel.addAttribute("lsthingstates", LsThingState.findAllLsThingStates());
        return "lsthingvalues/findLsThingValuesByLsState";
    }
    
    @RequestMapping(params = "find=ByLsState", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsState(@RequestParam("lsState") LsThingState lsState, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsState(lsState, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsState(lsState) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsState(lsState, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsTransactionEqualsForm(Model uiModel) {
        return "lsthingvalues/findLsThingValuesByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String LsThingValueController.findLsThingValuesByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThingValue.countFindLsThingValuesByLsTransactionEquals(lsTransaction) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthingvalues", LsThingValue.findLsThingValuesByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthingvalues/list";
    }
    
}
