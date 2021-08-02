package jcappy.orderinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jcappy.members.MembersService;
import jcappy.product.ProductService;

@Controller
public class AdminOrderinfoController {
	
	@Autowired
	OrderinfoService orderinfoService;
	@Autowired
	ProductService productService;
	@Autowired
	MembersService membersService;
	
	@RequestMapping("/admin/order/list")
	public String index(Model model, OrderinfoVo vo) {
		return "admin/order/list";
	}
}
