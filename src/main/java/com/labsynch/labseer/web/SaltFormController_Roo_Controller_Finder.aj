// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.BulkLoadFile;
import com.labsynch.labseer.domain.Parent;
import com.labsynch.labseer.domain.SaltForm;
import com.labsynch.labseer.web.SaltFormController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect SaltFormController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByBulkLoadFileEquals", "form" }, method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByBulkLoadFileEqualsForm(Model uiModel) {
        uiModel.addAttribute("bulkloadfiles", BulkLoadFile.findAllBulkLoadFiles());
        return "saltforms/findSaltFormsByBulkLoadFileEquals";
    }
    
    @RequestMapping(params = "find=ByBulkLoadFileEquals", method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByBulkLoadFileEquals(@RequestParam("bulkLoadFile") BulkLoadFile bulkLoadFile, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByBulkLoadFileEquals(bulkLoadFile, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) SaltForm.countFindSaltFormsByBulkLoadFileEquals(bulkLoadFile) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByBulkLoadFileEquals(bulkLoadFile, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "saltforms/list";
    }
    
    @RequestMapping(params = { "find=ByCdId", "form" }, method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByCdIdForm(Model uiModel) {
        return "saltforms/findSaltFormsByCdId";
    }
    
    @RequestMapping(params = "find=ByCdId", method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByCdId(@RequestParam("cdId") int CdId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByCdId(CdId, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) SaltForm.countFindSaltFormsByCdId(CdId) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByCdId(CdId, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "saltforms/list";
    }
    
    @RequestMapping(params = { "find=ByCorpNameEquals", "form" }, method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByCorpNameEqualsForm(Model uiModel) {
        return "saltforms/findSaltFormsByCorpNameEquals";
    }
    
    @RequestMapping(params = "find=ByCorpNameEquals", method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByCorpNameEquals(@RequestParam("corpName") String corpName, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByCorpNameEquals(corpName, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) SaltForm.countFindSaltFormsByCorpNameEquals(corpName) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByCorpNameEquals(corpName, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "saltforms/list";
    }
    
    @RequestMapping(params = { "find=ByCorpNameLike", "form" }, method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByCorpNameLikeForm(Model uiModel) {
        return "saltforms/findSaltFormsByCorpNameLike";
    }
    
    @RequestMapping(params = "find=ByCorpNameLike", method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByCorpNameLike(@RequestParam("corpName") String corpName, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByCorpNameLike(corpName, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) SaltForm.countFindSaltFormsByCorpNameLike(corpName) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByCorpNameLike(corpName, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "saltforms/list";
    }
    
    @RequestMapping(params = { "find=ByParent", "form" }, method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByParentForm(Model uiModel) {
        uiModel.addAttribute("parents", Parent.findAllParents());
        return "saltforms/findSaltFormsByParent";
    }
    
    @RequestMapping(params = "find=ByParent", method = RequestMethod.GET)
    public String SaltFormController.findSaltFormsByParent(@RequestParam("parent") Parent parent, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByParent(parent, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) SaltForm.countFindSaltFormsByParent(parent) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("saltforms", SaltForm.findSaltFormsByParent(parent, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "saltforms/list";
    }
    
}
