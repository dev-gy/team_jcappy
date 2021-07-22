package jcappy.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	private static final String AUTHCODE = "admin*";
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/admin/auth/list")
	public String index(Model model, AdminVo vo) {
		System.out.println("★★★★★★★★" + vo.getAno());
		model.addAttribute("list", service.selectAll(vo));
		return "admin/auth/list";
	}		

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
		return "admin/include/result";
	}

	@RequestMapping("/admin/auth/isDuplicateId")
	public String isDuplicateId(Model model, @RequestParam String id) {
		if (service.isDuplicateId(id) == 0) {
			model.addAttribute("result", "false");
		} else {
			model.addAttribute("result", "true");
		}
		return "admin/include/result";
	}
	
	@RequestMapping("/admin/auth/checkAuthority")
	public String checkAuthority(Model model, @RequestParam String code) {
		if (code.equals(AUTHCODE)) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
	
	@RequestMapping("/admin/auth/groupDelete")
	public String groupDelete(Model model, AdminVo vo, HttpServletRequest req) {

		int result = service.groupDelete(vo);

		model.addAttribute("msg", "총 " + result + " 건이 삭제되었습니다.");
		model.addAttribute("url", "list");

		return "include/alert";
	}
}
