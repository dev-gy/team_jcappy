package jcappy.members;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminMembersController {

	@Autowired
	AdminMembersService service;

	// 회원목록
	@RequestMapping("/admin/members/list")
	public String list(Model model, MembersVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/members/list";
	}

	// 회원일괄삭제
	@RequestMapping("/admin/members/groupDelete")
	public String groupDelete(Model model, MembersVo vo, HttpServletRequest req) {

		int result = service.groupDelete(vo);

		model.addAttribute("msg", "총 " + result + " 건이 삭제되었습니다.");
		model.addAttribute("url", "list");

		return "include/alert";
	}

	// 회원상세
	@RequestMapping("/admin/members/detail")
	public String detail(Model model, MembersVo vo) {

		model.addAttribute("vo", service.detail(vo));

		return "admin/members/detail";
	}

	// 회원관리 상세페이지에서 삭제
	@RequestMapping("/admin/members/delete")
	public String delete(Model model, @RequestParam int mno) {

		int result = service.delete(mno);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}

	// 회원수정
	@RequestMapping("/admin/members/update")
	public String update(Model model, MembersVo vo) {

		int result = service.adminUpdateMembers(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}

	// 회원 작성글 목록
	@RequestMapping("/admin/members/boardList")
	public String boardList(Model model, MembersVo vo) {

		model.addAttribute("list", service.boardList(vo));

		return "admin/members/boardList";
	}

	// 회원 주문 목록
	@RequestMapping("/admin/members/orderList")
	public String orderList(Model model, MembersVo vo) {
		
		model.addAttribute("list", service.orderList(vo));
		
		return "admin/members/orderList";
	}
}
