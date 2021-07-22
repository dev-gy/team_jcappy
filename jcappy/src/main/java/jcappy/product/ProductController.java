package jcappy.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ProductController {
	@Autowired
	ProductService service;
	
	@RequestMapping("/index")
	public String index(Model model) {
		// 등록일 최신순으로 3개씩..냉장고, 에어컨, TV, 세탁기를 가져와 모델에 등록
		ProductVo vo = new ProductVo();
		vo.setDirect("DESC");
		vo.setOrderby("pregdate");
		vo.setFtype("ptype");
		vo.setFval("냉장고");
		vo.setPageRow(3);
		model.addAttribute("rList", service.selectAll(vo));
		vo.setFval("에어컨");
		vo.setPageRow(3);
		model.addAttribute("aList", service.selectAll(vo));
		vo.setFval("TV");
		vo.setPageRow(3);
		model.addAttribute("tList", service.selectAll(vo));
		vo.setFval("세탁기");
		vo.setPageRow(3);
		model.addAttribute("wList", service.selectAll(vo));
		return "/index";
	}
	
}
