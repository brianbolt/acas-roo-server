package com.labsynch.labseer.web;

import com.labsynch.labseer.dto.StringCollectionDTO;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = StringCollectionDTO.class)
@Controller
@RequestMapping("/stringcollectioes")
public class StringCollectionDTOController {
}
