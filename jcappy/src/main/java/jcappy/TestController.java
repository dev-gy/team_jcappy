package jcappy;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping(value = {"/policy/servicepolicy/{type}"})
	public String Test(@PathVariable("type") String type, Model model) {
		if ("service".equals(type) || "policy".equals(type)) {
			return "/policy/servicepolicy";
		} else {
			return "";
		}
	}
}
