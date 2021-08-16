package jcappy.coupon;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jcappy.members.MembersVo;

@Controller
public class CouponController {

	@Autowired
	CouponService couponService;
	
	@RequestMapping("/mypage/coupon")
	public String index(Model model, CouponVo vo, HttpServletRequest request) {
		vo.setMno(((MembersVo)request.getSession().getAttribute("membersInfo")).getMno());
		model.addAttribute("list", couponService.selectAllByMno(vo));
		return "/mypage/coupon";
	}
}
