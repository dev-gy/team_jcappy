package jcappy.orderinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminOrderinfoController {
	
	@Autowired
	AdminOrderinfoService service;
	
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
}
