package jcappy.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ProductController {
	@Autowired
	ProductService service;
	
	@RequestMapping("/")
	public String index(Model model) {
		// 등록일 최신순으로 3개씩..냉장고, 에어컨, TV, 세탁기를 가져와 전달
		ProductVo vo = new ProductVo();
		vo.setDirect("DESC");
		vo.setOrderby("pno");
		vo.setPageRow(3);
		
		vo.setSptype("냉장고");
		model.addAttribute("rList", service.selectAll(vo));
		vo.setSptype("에어컨");
		model.addAttribute("aList", service.selectAll(vo));
		vo.setSptype("TV");
		model.addAttribute("tList", service.selectAll(vo));
		vo.setSptype("세탁기");
		model.addAttribute("wList", service.selectAll(vo));
		
		return "/index";
	}
	
	@RequestMapping(value = {"/product/{type}", "/product/{type}/{cate}"})
	public String productIndex(Model model, ProductVo vo, @PathVariable String type, @PathVariable(required = false) String cate) {
		String a, b, c = "";
		// type과 cate(a, b, c)에 해당하는 상품들의 데이터를 받아와 전달
		if ("refrigerator".equals(type)) {
			vo.setSptype("냉장고");
			a = "일반형냉장고";
			b = "양문형냉장고";
			c = "업소용냉장고";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setSpcate("일반형냉장고");
				} else if ("b".equals(cate)) {
					vo.setSpcate("양문형냉장고");
				} else if ("c".equals(cate)) {
					vo.setSpcate("업소용냉장고");
				} else {
					return "error";
				}
			}
		} else if ("airconditioner".equals(type)) {
			vo.setSptype("에어컨");
			a = "스탠드형에어컨";
			b = "벽걸이형에어컨";
			c = "창문형에어컨";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setSpcate("스탠드형에어컨");
				} else if ("b".equals(cate)) {
					vo.setSpcate("벽걸이형에어컨");
				} else if ("c".equals(cate)) {
					vo.setSpcate("창문형에어컨");
				} else {
					return "error";
				}
			}
		} else if ("tv".equals(type)) {
			vo.setSptype("TV");
			a = "LEDTV";
			b = "QLEDTV";
			c = "OLEDTV";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setSpcate("LEDTV");
				} else if ("b".equals(cate)) {
					vo.setSpcate("QLEDTV");
				} else if ("c".equals(cate)) {
					vo.setSpcate("OLEDTV");
				} else {
					return "error";
				}
			}
		} else if ("washer".equals(type)) {
			vo.setSptype("세탁기");
			a = "일반세탁기";
			b = "드럼세탁기";
			c = "미니세탁기";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setSpcate("일반세탁기");
				} else if ("b".equals(cate)) {
					vo.setSpcate("드럼세탁기");
				} else if ("c".equals(cate)) {
					vo.setSpcate("미니세탁기");
				} else {
					return "error";
				}
			}
		} else {
			return "error";
		}
		
		// 파라미터 값 전달
		model.addAttribute("list", service.selectAll(vo));
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		model.addAttribute("c", c);
		return "/product/index";
	}
}
