package jcappy.orderinfo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jcappy.coupon.AdminCouponService;
import jcappy.coupon.CouponVo;
import jcappy.members.AdminMembersService;
import jcappy.members.MembersVo;
import jcappy.orderlist.OrderlistService;
import jcappy.orderlist.OrderlistVo;

@Controller
public class AdminOrderinfoController {

	@Autowired
	AdminOrderinfoService service;

	@Autowired
	AdminMembersService mService;

	@Autowired
	OrderlistService olService;

	@Autowired
	AdminCouponService cService;

	@RequestMapping("/admin/order/list")
	public String index(Model model, OrderinfoVo vo) {
		model.addAttribute("list", service.admin_selectList(vo));
		return "admin/order/list";
	}

	@RequestMapping("/admin/order/pay_check")
	public String pay_check(Model model, OrderinfoVo vo) {

		int result = service.pay_check(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/delivery_check")
	public String delivery_check(Model model, OrderinfoVo vo) {

		int result = service.delivery_check(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/detail")
	public String detail(Model model, OrderinfoVo vo, MembersVo mVo, OrderlistVo oVo, CouponVo cVo) {

		OrderinfoVo vo2 = service.detail(vo); // 주문 상세

		Map<String, String> preDelivery = service.admin_pre_del(vo2); // 종전 취소되지 않은 주문의 배송지 정보

		oVo.setOno(vo.getOno());
		List<OrderlistVo> pList = olService.selectAll(oVo); // 주문 상세에서 주문 상품 목록

		mVo.setMno(vo2.getMno());
		MembersVo mVo2 = mService.detail(mVo); // 주문자 정보를 가져가기 위한 Members 객체
		if (vo2.getCno() != 0) { // 주문에서 사용한 쿠폰이 있다면 쿠폰 가져감
			cVo.setCno(vo2.getCno());
			CouponVo cVo2 = cService.detail(cVo);
			model.addAttribute("coupon", cVo2);
		}

		model.addAttribute("vo", vo2);
		model.addAttribute("pList", pList);
		model.addAttribute("preDelivery", preDelivery);
		model.addAttribute("members", mVo2);

		return "admin/order/detail";
	}

	@RequestMapping("/admin/order/admin_order_update")
	public String admin_order_update(Model model, OrderinfoVo vo) {

		int result = service.admin_order_update(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/detail_pay_check")
	public String detail_pay_check(Model model, OrderinfoVo vo) {

		int result = service.detail_pay_check(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/detail_delivery_check")
	public String detail_delivery_check(Model model, OrderinfoVo vo) {

		int result = service.detail_delivery_check(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/request_cancel")
	public String request_cancel(Model model, OrderinfoVo vo) {

		int result = service.request_cancel(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/accept_cancel")
	public String accept_cancel(Model model, OrderinfoVo vo) {

		int result = service.accept_cancel(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/reject_cancel")
	public String reject_cancel(Model model, OrderinfoVo vo) {

		int result = service.reject_cancel(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/remake_coupon")
	public String remake_coupon(Model model, OrderinfoVo vo) {

		int result = service.remake_coupon(vo);

		if (result > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}

		return "include/result";
	}

	@RequestMapping("/admin/order/add")
	public String add(Model model, OrderinfoVo vo) {
		return "admin/order/add";
	}
}
