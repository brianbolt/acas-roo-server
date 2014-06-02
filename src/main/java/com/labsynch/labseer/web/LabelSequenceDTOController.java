package com.labsynch.labseer.web;

import com.labsynch.labseer.dto.LabelSequenceDTO;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = LabelSequenceDTO.class)
@Controller
@RequestMapping("/labelsequencedto")
public class LabelSequenceDTOController {
}
