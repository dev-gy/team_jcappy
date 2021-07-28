package jcappy.members;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMembersController {
	
	@RequestMapping("/admin/members/list")
	public String list(Model model, MembersVo vo) {
		return "admin/members/list";
	}
}
