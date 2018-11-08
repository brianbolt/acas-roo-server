// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Container;
import com.labsynch.labseer.domain.ItxContainerContainer;
import com.labsynch.labseer.web.ItxContainerContainerController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ItxContainerContainerController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String ItxContainerContainerController.findItxContainerContainersByLsTransactionEqualsForm(Model uiModel) {
        return "itxcontainercontainers/findItxContainerContainersByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String ItxContainerContainerController.findItxContainerContainersByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("itxcontainercontainers", ItxContainerContainer.findItxContainerContainersByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ItxContainerContainer.countFindItxContainerContainersByLsTransactionEquals(lsTransaction) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("itxcontainercontainers", ItxContainerContainer.findItxContainerContainersByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "itxcontainercontainers/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeEqualsAndFirstContainerEquals", "form" }, method = RequestMethod.GET)
    public String ItxContainerContainerController.findItxContainerContainersByLsTypeEqualsAndFirstContainerEqualsForm(Model uiModel) {
        uiModel.addAttribute("containers", Container.findAllContainers());
        return "itxcontainercontainers/findItxContainerContainersByLsTypeEqualsAndFirstContainerEquals";
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndFirstContainerEquals", method = RequestMethod.GET)
    public String ItxContainerContainerController.findItxContainerContainersByLsTypeEqualsAndFirstContainerEquals(@RequestParam("lsType") String lsType, @RequestParam("firstContainer") Container firstContainer, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("itxcontainercontainers", ItxContainerContainer.findItxContainerContainersByLsTypeEqualsAndFirstContainerEquals(lsType, firstContainer, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ItxContainerContainer.countFindItxContainerContainersByLsTypeEqualsAndFirstContainerEquals(lsType, firstContainer) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("itxcontainercontainers", ItxContainerContainer.findItxContainerContainersByLsTypeEqualsAndFirstContainerEquals(lsType, firstContainer, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "itxcontainercontainers/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeEqualsAndSecondContainerEquals", "form" }, method = RequestMethod.GET)
    public String ItxContainerContainerController.findItxContainerContainersByLsTypeEqualsAndSecondContainerEqualsForm(Model uiModel) {
        uiModel.addAttribute("containers", Container.findAllContainers());
        return "itxcontainercontainers/findItxContainerContainersByLsTypeEqualsAndSecondContainerEquals";
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndSecondContainerEquals", method = RequestMethod.GET)
    public String ItxContainerContainerController.findItxContainerContainersByLsTypeEqualsAndSecondContainerEquals(@RequestParam("lsType") String lsType, @RequestParam("secondContainer") Container secondContainer, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("itxcontainercontainers", ItxContainerContainer.findItxContainerContainersByLsTypeEqualsAndSecondContainerEquals(lsType, secondContainer, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ItxContainerContainer.countFindItxContainerContainersByLsTypeEqualsAndSecondContainerEquals(lsType, secondContainer) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("itxcontainercontainers", ItxContainerContainer.findItxContainerContainersByLsTypeEqualsAndSecondContainerEquals(lsType, secondContainer, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "itxcontainercontainers/list";
    }
    
}
