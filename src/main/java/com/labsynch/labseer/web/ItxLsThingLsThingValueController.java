package com.labsynch.labseer.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.labsynch.labseer.domain.ItxLsThingLsThingValue;

@RooWebJson(jsonObject = ItxLsThingLsThingValue.class)
@Controller
@RequestMapping("/itxlsthinglsthingvalues")
@RooWebScaffold(path = "itxlsthinglsthingvalues", formBackingObject = ItxLsThingLsThingValue.class)
public class ItxLsThingLsThingValueController {

}
