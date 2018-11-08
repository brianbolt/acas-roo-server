// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Container;
import com.labsynch.labseer.domain.ContainerLabel;
import com.labsynch.labseer.web.ContainerLabelController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ContainerLabelController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByContainerAndIgnoredNot", "form" }, method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByContainerAndIgnoredNotForm(Model uiModel) {
        uiModel.addAttribute("containers", Container.findAllContainers());
        return "containerlabels/findContainerLabelsByContainerAndIgnoredNot";
    }
    
    @RequestMapping(params = "find=ByContainerAndIgnoredNot", method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByContainerAndIgnoredNot(@RequestParam("container") Container container, @RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByContainerAndIgnoredNot(container, ignored, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ContainerLabel.countFindContainerLabelsByContainerAndIgnoredNot(container, ignored) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByContainerAndIgnoredNot(container, ignored, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "containerlabels/list";
    }
    
    @RequestMapping(params = { "find=ByLabelTextEqualsAndIgnoredNot", "form" }, method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByLabelTextEqualsAndIgnoredNotForm(Model uiModel) {
        return "containerlabels/findContainerLabelsByLabelTextEqualsAndIgnoredNot";
    }
    
    @RequestMapping(params = "find=ByLabelTextEqualsAndIgnoredNot", method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByLabelTextEqualsAndIgnoredNot(@RequestParam("labelText") String labelText, @RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByLabelTextEqualsAndIgnoredNot(labelText, ignored, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ContainerLabel.countFindContainerLabelsByLabelTextEqualsAndIgnoredNot(labelText, ignored) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByLabelTextEqualsAndIgnoredNot(labelText, ignored, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "containerlabels/list";
    }
    
    @RequestMapping(params = { "find=ByLsTransactionEquals", "form" }, method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByLsTransactionEqualsForm(Model uiModel) {
        return "containerlabels/findContainerLabelsByLsTransactionEquals";
    }
    
    @RequestMapping(params = "find=ByLsTransactionEquals", method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByLsTransactionEquals(@RequestParam("lsTransaction") Long lsTransaction, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ContainerLabel.countFindContainerLabelsByLsTransactionEquals(lsTransaction) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByLsTransactionEquals(lsTransaction, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "containerlabels/list";
    }
    
    @RequestMapping(params = { "find=ByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot", "form" }, method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNotForm(Model uiModel) {
        return "containerlabels/findContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot";
    }
    
    @RequestMapping(params = "find=ByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot", method = RequestMethod.GET)
    public String ContainerLabelController.findContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot(@RequestParam("lsType") String lsType, @RequestParam("labelText") String labelText, @RequestParam(value = "ignored", required = false) boolean ignored, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot(lsType, labelText, ignored, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) ContainerLabel.countFindContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot(lsType, labelText, ignored) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("containerlabels", ContainerLabel.findContainerLabelsByLsTypeEqualsAndLabelTextEqualsAndIgnoredNot(lsType, labelText, ignored, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "containerlabels/list";
    }
    
}
