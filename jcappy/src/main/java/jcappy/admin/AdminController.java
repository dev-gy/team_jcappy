package jcappy.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		int result = service.insert(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}

	@RequestMapping("/admin/auth/isDuplicateId")
	public String isDuplicateId(Model model, @RequestParam String id) {
		if (service.isDuplicateId(id) == 0) {
			model.addAttribute("result", "false");
		} else {
			model.addAttribute("result", "true");
		}
		return "include/result";
	}
}
