package com.labsynch.labseer.web;

import java.util.List;

import com.labsynch.labseer.domain.DDictKind;
import com.labsynch.labseer.domain.DDictType;
import com.labsynch.labseer.domain.DDictValue;
import com.labsynch.labseer.domain.Protocol;
import com.labsynch.labseer.dto.CodeTableDTO;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/ddictvalues")
@Controller
@RooWebScaffold(path = "ddictvalues", formBackingObject = DDictValue.class)
@RooWebFinder
public class DDictValueController {

    void populateEditForm(Model uiModel, DDictValue DDictValue_) {
        uiModel.addAttribute("DDictValue_", DDictValue_);
        uiModel.addAttribute("ddicttypes", DDictType.findAllDDictTypes());
        uiModel.addAttribute("ddictkinds", DDictKind.findAllDDictKinds());
    }
}
