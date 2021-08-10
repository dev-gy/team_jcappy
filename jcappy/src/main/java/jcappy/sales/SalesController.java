package jcappy.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesController {

	@Autowired
	SalesService service;
	//매출조회 목록
	@RequestMapping("/admin/sales/index")
	public String index(Model model, SalesVo vo) {
		if(vo.getDatepicker()== null || "".equals(vo.getDatepicker())) {
			model.addAttribute("list", service.selectAll(vo));
			model.addAttribute("total_sales", service.totalSales(vo));
		} else {
			model.addAttribute("daySelect",service.daySelect(vo));
		}
		
		return "admin/sales/index";
	}
}
