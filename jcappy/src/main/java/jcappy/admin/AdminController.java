package jcappy.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/admin/auth/create")
	public String create(Model model, AdminVo vo) {
		return "admin/auth/create";
	}

	@RequestMapping("/admin/auth/insert")
	public String insert(Model model, AdminVo vo) {
		service.insert(vo);
		return "admin/auth/create";
	}
}
     