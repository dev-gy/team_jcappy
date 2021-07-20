package jcappy.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/admin/auth/create")
	public String create(Model model, AdminVo vo) {
		
		return "admin/auth/create";
	}
}
