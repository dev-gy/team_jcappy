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
//		vo.setFtype("ptype");
//		vo.setPageRow(3);
//		
//		vo.setFval("냉장고");
//		model.addAttribute("rList", service.selectAll(vo));
//		vo.setFval("에어컨");
//		model.addAttribute("aList", service.selectAll(vo));
//		vo.setFval("TV");
//		model.addAttribute("tList", service.selectAll(vo));
//		vo.setFval("세탁기");
//		model.addAttribute("wList", service.selectAll(vo));
		
		return "/index";
	}
	
	@RequestMapping(value = {"/product/{type}", "/product/{type}/{cate}"})
	public String productIndex(Model model, ProductVo vo, @PathVariable String type, @PathVariable(required = false) String cate) {
		// 기본은 인기 많은순, 1페이지당 15개 상품씩, 필터 조건은 상품타입
		System.out.println(vo.getOrderby()); 
		if (null == vo.getOrderby() || "".equals(vo.getOrderby())) { 
			vo.setOrderby("popular");
			vo.setDirect("DESC");
		}
//		vo.setFtype("ptype");
//		vo.setPageRow(15);
//		
//		// type과 cate(a, b, c)에 해당하는 상품들의 데이터를 받아와 전달
//		if ("refrigerator".equals(type)) {
//			vo.setFval("냉장고");
//			if (cate != null) {
//				vo.setFtype("pcate");
//				if ("a".equals(cate)) {
//					vo.setFval("일반형냉장고");
//				} else if ("b".equals(cate)) {
//					vo.setFval("양문형냉장고");
//				} else if ("c".equals(cate)) {
//					vo.setFval("업소용냉장고");
//				} else {
//					return "error";
//				}
//			}
//			model.addAttribute("list", service.selectAll(vo));
//		} else if ("airconditioner".equals(type)) {
//			vo.setFval("에어컨");
//			if (cate != null) {
//				vo.setFtype("pcate");
//				if ("a".equals(cate)) {
//					vo.setFval("스탠드형에어컨");
//				} else if ("b".equals(cate)) {
//					vo.setFval("벽걸이형에어컨");
//				} else if ("c".equals(cate)) {
//					vo.setFval("창문형에어컨");
//				} else {
//					return "error";
//				}
//			}
//			model.addAttribute("list", service.selectAll(vo));
//		} else if ("tv".equals(type)) {
//			vo.setFval("TV");
//			if (cate != null) {
//				vo.setFtype("pcate");
//				if ("a".equals(cate)) {
//					vo.setFval("LED");
//				} else if ("b".equals(cate)) {
//					vo.setFval("QLED");
//				} else if ("c".equals(cate)) {
//					vo.setFval("OLED");
//				} else {
//					return "error";
//				}
//			}
//			model.addAttribute("list", service.selectAll(vo));
//		} else if ("washer".equals(type)) {
//			vo.setFval("세탁기");
//			if (cate != null) {
//				vo.setFtype("pcate");
//				if ("a".equals(cate)) {
//					vo.setFval("일반세탁기");
//				} else if ("b".equals(cate)) {
//					vo.setFval("드럼세탁기");
//				} else if ("c".equals(cate)) {
//					vo.setFval("미니세탁기");
//				} else {
//					return "error";
//				}
//			}
//			model.addAttribute("list", service.selectAll(vo));
//		} else {
//			return "error";
//		}
		
		// 파라미터 값 전달
		model.addAttribute("vo", vo);
		return "/product/index";
	}
}
