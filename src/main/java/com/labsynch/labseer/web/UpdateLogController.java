package com.labsynch.labseer.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.labsynch.labseer.domain.UpdateLog;

@RequestMapping("/updatelogs")
@Controller
@RooWebScaffold(path = "updatelogs", formBackingObject = UpdateLog.class)
public class UpdateLogController {
}
