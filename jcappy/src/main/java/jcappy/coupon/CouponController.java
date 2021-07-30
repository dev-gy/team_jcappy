package jcappy.coupon;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CouponController {
	
	@Autowired
	CouponService service;
	
	//부가기능 인덱스
	@RequestMapping("/admin/add/index")
	public String addIndex(Model model) {
		return "admin/add/index";
	}
	
	//쿠폰 리스트
	@RequestMapping("/admin/add/coupon/list")
	public String list(Model model,CouponVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/add/coupon/list";
	}
	
	//쿠폰 상세페이지
	@RequestMapping("/admin/add/coupon/detail")
	public String detail(Model model, CouponVo vo) {
		model.addAttribute("vo", service.detail(vo));
		return "admin/add/coupon/detail";
	}
	
	//쿠폰 생성페이지
	@RequestMapping("/admin/add/coupon/create")
	public String create(Model model, CouponVo vo) {
		return "admin/add/coupon/create";
	}
	
	//쿠폰 등록
	@RequestMapping("/admin/add/coupon/insert")
	public String insert(Model model, CouponVo vo) {
		//이메일을 이용해 멤버 mno를 가지고 옴
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
	
	//이메일존재 체크
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
	
	//쿠폰수정
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
	
	//쿠폰 삭제
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
	
	//쿠폰 그룹 삭제
	@RequestMapping("/admin/add/coupon/groupDelete")
	public String groupDelete(Model model, CouponVo vo) {
		int count=service.deleteGroup(vo);
		model.addAttribute("msg", "총 "+count+"건이 삭제되었습니다.");
		model.addAttribute("url", "list");
		return "include/alert";
	}
}
