// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.LsThing;
import com.labsynch.labseer.web.LsThingController;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LsThingController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByCodeNameEquals", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByCodeNameEqualsForm(Model uiModel) {
        return "lsthings/findLsThingsByCodeNameEquals";
    }
    
    @RequestMapping(params = "find=ByCodeNameEquals", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByCodeNameEquals(@RequestParam("codeName") String codeName, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByCodeNameEquals(codeName, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByCodeNameEquals(codeName) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByCodeNameEquals(codeName, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByCodeNameLike", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByCodeNameLikeForm(Model uiModel) {
        return "lsthings/findLsThingsByCodeNameLike";
    }
    
    @RequestMapping(params = "find=ByCodeNameLike", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByCodeNameLike(@RequestParam("codeName") String codeName, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByCodeNameLike(codeName, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByCodeNameLike(codeName) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByCodeNameLike(codeName, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindEquals", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsKindEqualsForm(Model uiModel) {
        return "lsthings/findLsThingsByLsKindEquals";
    }
    
    @RequestMapping(params = "find=ByLsKindEquals", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsKindEquals(@RequestParam("lsKind") String lsKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsKindEquals(lsKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByLsKindEquals(lsKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsKindEquals(lsKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByLsKindLike", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsKindLikeForm(Model uiModel) {
        return "lsthings/findLsThingsByLsKindLike";
    }
    
    @RequestMapping(params = "find=ByLsKindLike", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsKindLike(@RequestParam("lsKind") String lsKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsKindLike(lsKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByLsKindLike(lsKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsKindLike(lsKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTransactionEqualsForm(Model uiModel) {
        return "lsthings/findLsThingsByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByLsTransactionEquals(lsTransaction) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeAndKindEquals", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTypeAndKindEqualsForm(Model uiModel) {
        return "lsthings/findLsThingsByLsTypeAndKindEquals";
    }
    
    @RequestMapping(params = "find=ByLsTypeAndKindEquals", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTypeAndKindEquals(@RequestParam("lsTypeAndKind") String lsTypeAndKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTypeAndKindEquals(lsTypeAndKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByLsTypeAndKindEquals(lsTypeAndKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTypeAndKindEquals(lsTypeAndKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeEquals", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTypeEqualsForm(Model uiModel) {
        return "lsthings/findLsThingsByLsTypeEquals";
    }
    
    @RequestMapping(params = "find=ByLsTypeEquals", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTypeEquals(@RequestParam("lsType") String lsType, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTypeEquals(lsType, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByLsTypeEquals(lsType) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTypeEquals(lsType, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeEqualsAndLsKindEquals", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTypeEqualsAndLsKindEqualsForm(Model uiModel) {
        return "lsthings/findLsThingsByLsTypeEqualsAndLsKindEquals";
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndLsKindEquals", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByLsTypeEqualsAndLsKindEquals(@RequestParam("lsType") String lsType, @RequestParam("lsKind") String lsKind, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTypeEqualsAndLsKindEquals(lsType, lsKind, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByLsTypeEqualsAndLsKindEquals(lsType, lsKind) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByLsTypeEqualsAndLsKindEquals(lsType, lsKind, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByRecordedByLike", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByRecordedByLikeForm(Model uiModel) {
        return "lsthings/findLsThingsByRecordedByLike";
    }
    
    @RequestMapping(params = "find=ByRecordedByLike", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByRecordedByLike(@RequestParam("recordedBy") String recordedBy, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByRecordedByLike(recordedBy, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByRecordedByLike(recordedBy) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByRecordedByLike(recordedBy, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByRecordedDateGreaterThan", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByRecordedDateGreaterThanForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/findLsThingsByRecordedDateGreaterThan";
    }
    
    @RequestMapping(params = "find=ByRecordedDateGreaterThan", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByRecordedDateGreaterThan(@RequestParam("recordedDate") @DateTimeFormat(style = "MM") Date recordedDate, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByRecordedDateGreaterThan(recordedDate, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByRecordedDateGreaterThan(recordedDate) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByRecordedDateGreaterThan(recordedDate, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
    @RequestMapping(params = { "find=ByRecordedDateLessThan", "form" }, method = RequestMethod.GET)
    public String LsThingController.findLsThingsByRecordedDateLessThanForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/findLsThingsByRecordedDateLessThan";
    }
    
    @RequestMapping(params = "find=ByRecordedDateLessThan", method = RequestMethod.GET)
    public String LsThingController.findLsThingsByRecordedDateLessThan(@RequestParam("recordedDate") @DateTimeFormat(style = "MM") Date recordedDate, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByRecordedDateLessThan(recordedDate, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) LsThing.countFindLsThingsByRecordedDateLessThan(recordedDate) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("lsthings", LsThing.findLsThingsByRecordedDateLessThan(recordedDate, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "lsthings/list";
    }
    
}
