package jcappy.coupon;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jcappy.comment.CommentVo;

@Controller
public class CouponController {
	
	@Autowired
	CouponService service;
	
	@RequestMapping("/admin/add/index")
	public String addIndex(Model model) {
		return "admin/add/index";
	}
	
	@RequestMapping("/admin/add/coupon/list")
	public String list(Model model,CouponVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/add/coupon/list";
	}
	
	@RequestMapping("/admin/add/coupon/detail")
	public String detail(Model model, CouponVo vo) {
		model.addAttribute("vo", service.detail(vo));
		return "admin/add/coupon/detail";
	}
	
	@RequestMapping("/admin/add/coupon/write")
	public String write(Model model, CouponVo vo) {
		return "admin/add/coupon/create";
	}
	
	@RequestMapping("/admin/add/coupon/insert")
	public String insert(Model model, CouponVo vo) {
		int mno = service.findMno(vo.getMemail()).getMno();
		vo.setMno(mno);
		int r = service.insert(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "list");
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "detail?no="+vo.getCno());
		}
		return "admin/include/alert";
	}
	
	@RequestMapping("/admin/add/coupon/countMemail")
	public String countMemail(Model model, CouponVo vo) {
		int r = service.countMemail(vo); 
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
	
	
	@RequestMapping("/admin/add/coupon/update")
	public String update(Model model, CouponVo vo) {
		int r = service.update(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "list");
		} else {
			model.addAttribute("msg", "수정실패");
			model.addAttribute("url", "detail?no="+vo.getCno());
		}
		return "admin/include/alert";
	}
	
	@RequestMapping("/admin/add/coupon/delete")
	public String delete(Model model, CouponVo vo) {
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
	
}
