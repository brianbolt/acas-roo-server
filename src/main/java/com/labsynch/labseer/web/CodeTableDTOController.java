package com.labsynch.labseer.web;

import com.labsynch.labseer.dto.CodeTableDTO;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = CodeTableDTO.class)
@Controller
@RequestMapping("/coes")
public class CodeTableDTOController {
}
