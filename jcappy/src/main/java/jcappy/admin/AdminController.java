package jcappy.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	private static final String AUTHCODE = "admin*";
	
	@Autowired
	AdminService service;
	
	// 관리자계정 목록
	@RequestMapping("/admin/auth/list")
	public String index(Model model, AdminVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/auth/list";
	}		

	// 관리자계정 생성 폼
	@RequestMapping("/admin/auth/create")
	public String create(Model model, AdminVo vo) {
		return "admin/auth/create";
	}

	// 관리자계정 등록
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

	// 관리자계정 아이디 중복 체크
	@RequestMapping("/admin/auth/isDuplicateId")
	public String isDuplicateId(Model model, @RequestParam String id) {
		if (service.isDuplicateId(id) == 0) {
			model.addAttribute("result", "false");
		} else {
			model.addAttribute("result", "true");
		}
		return "include/result";
	}
	
	// '관리자계정' 권한의 권한코드 체크
	@RequestMapping("/admin/auth/checkAuthority")
	public String checkAuthority(Model model, @RequestParam String code) {
		if (code.equals(AUTHCODE)) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}
	
	// 관리자계정 목록에서 일괄 삭제
	@RequestMapping("/admin/auth/groupDelete")
	public String groupDelete(Model model, AdminVo vo, HttpServletRequest req) {

		int result = service.groupDelete(vo);

		model.addAttribute("msg", "총 " + result + " 건이 삭제되었습니다.");
		model.addAttribute("url", "list");

		return "include/alert";
	}
	
	// 관리자계정 상세, 수정 폼
	@RequestMapping("/admin/auth/detail")
	public String detail(Model model, AdminVo vo) {
		
		AdminVo av = service.detail(vo);
		if (av.getAdmin_auth() == 1) {
			model.addAttribute("AUTHCODE", AUTHCODE);
		}
		model.addAttribute("vo", service.detail(vo));
		return "admin/auth/detail";
	}
	
	// 관리자계정 상세페이지에서 삭제
	@RequestMapping("/admin/auth/delete")
	public String delete(Model model, @RequestParam int ano) {
		
		int result = service.delete(ano);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}
	
	// 관리자계정 수정
	@RequestMapping("/admin/auth/update")
	public String update(Model model, AdminVo vo, HttpSession session) {
		
		int result = service.update(vo, session);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}
}
