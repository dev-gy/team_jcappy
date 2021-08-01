package jcappy.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesController {

	@Autowired
	SalesService service;
	
	@RequestMapping("/admin/account/index")
	public String index(Model model, SalesVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/sales/index";
	}
}
