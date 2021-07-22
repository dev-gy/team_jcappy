package jcappy.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
		vo.setOrderby("pno");
		vo.setFtype("ptype");
		vo.setPageRow(3);
		vo.setFval("냉장고");
		model.addAttribute("rList", service.selectAll(vo));
		vo.setFval("에어컨");
		model.addAttribute("aList", service.selectAll(vo));
		vo.setFval("TV");
		model.addAttribute("tList", service.selectAll(vo));
		vo.setFval("세탁기");
		model.addAttribute("wList", service.selectAll(vo));
		return "/index";
	}
	
	@RequestMapping("/product/{type}")
	public String productIndex(Model model, @PathVariable String type) {
		ProductVo vo = new ProductVo();
		vo.setDirect("DESC");
		vo.setOrderby("pno");
		vo.setFtype("ptype");
		vo.setPageRow(15);
		if ("refrigerator".equals(type)) {
			// 등록일 최신순으로 3개씩..냉장고, 에어컨, TV, 세탁기를 가져와 모델에 등록
			
			vo.setFval("냉장고");
			model.addAttribute("rList", service.selectAll(vo));
		} else if ("airconditioner".equals(type)) {
			
		} else if ("tv".equals(type)) {
			
		} else if ("washer".equals(type)) {
			
		} else {
			
		}
		return "/product/";
	}
	
}
