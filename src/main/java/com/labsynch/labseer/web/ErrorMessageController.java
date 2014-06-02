package com.labsynch.labseer.web;

import com.labsynch.labseer.exceptions.ErrorMessage;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = ErrorMessage.class)
@Controller
@RequestMapping("/errormessages")
public class ErrorMessageController {
}
