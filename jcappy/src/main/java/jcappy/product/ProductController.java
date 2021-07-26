package jcappy.product;

import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jcappy.review.ReviewService;
import jcappy.review.ReviewVo;


@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	ReviewService reviewService;
	
	
	@RequestMapping("/")
	public String index(Model model) {
		// 등록일 최신순으로 3개씩..냉장고, 에어컨, TV, 세탁기를 가져와 전달
		ProductVo vo = new ProductVo();
		vo.setDirect("DESC");
		vo.setOrderby("pno");
		vo.setPageRow(3);
		
		vo.setTval("냉장고");
		model.addAttribute("rList", productService.selectAll(vo));
		vo.setTval("에어컨");
		model.addAttribute("aList", productService.selectAll(vo));
		vo.setTval("TV");
		model.addAttribute("tList", productService.selectAll(vo));
		vo.setTval("세탁기");
		model.addAttribute("wList", productService.selectAll(vo));
		
		return "/index";
	}
	
	@RequestMapping(value = {"/product/{type}", "/product/{type}/{cate}"})
	public String productIndex(Model model, ProductVo vo, @PathVariable String type, @PathVariable(required = false) String cate, 
			@RequestParam(required = false) String orderby) {
		// 검색 타입 및 페이지 아이템 갯수 설정
		vo.setStype("pname");
		vo.setPageRow(15);
		
		// 기본은 인기 많은순, 1페이지당 15개 상품씩, 필터 조건은 상품타입
		if (null == orderby || "".equals(orderby) || "popular".equals(orderby)) { 
			vo.setOrderby("popular");
			vo.setDirect("DESC");
		} else if ("price_desc".equals(orderby)) {
			vo.setOrderby("pprice");
			vo.setDirect("DESC");
		} else if ("price_asc".equals(orderby)) {
			vo.setOrderby("pprice");
			vo.setDirect("ASC");
		}
		
		String a, b, c = "";	// a, b, c는 카테고리 좌측순서부터 카테고리의 이름
		// type과 cate(a, b, c)에 해당하는 상품들의 정보를 vo에 입력
		if ("refrigerator".equals(type)) {
			vo.setTval("냉장고");
			a = "일반형냉장고";
			b = "양문형냉장고";
			c = "업소용냉장고";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setCval("일반형냉장고");
				} else if ("b".equals(cate)) {
					vo.setCval("양문형냉장고");
				} else if ("c".equals(cate)) {
					vo.setCval("업소용냉장고");
				} else {
					return "error";
				}
			}
		} else if ("airconditioner".equals(type)) {
			vo.setTval("에어컨");
			a = "스탠드형에어컨";
			b = "벽걸이형에어컨";
			c = "창문형에어컨";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setCval("스탠드형에어컨");
				} else if ("b".equals(cate)) {
					vo.setCval("벽걸이형에어컨");
				} else if ("c".equals(cate)) {
					vo.setCval("창문형에어컨");
				} else {
					return "error";
				}
			}
		} else if ("tv".equals(type)) {
			vo.setTval("TV");
			a = "LEDTV";
			b = "QLEDTV";
			c = "OLEDTV";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setCval("LEDTV");
				} else if ("b".equals(cate)) {
					vo.setCval("QLEDTV");
				} else if ("c".equals(cate)) {
					vo.setCval("OLEDTV");
				} else {
					return "error";
				}
			}
		} else if ("washer".equals(type)) {
			vo.setTval("세탁기");
			a = "일반세탁기";
			b = "드럼세탁기";
			c = "미니세탁기";
			if (cate != null) {
				if ("a".equals(cate)) {
					vo.setCval("일반세탁기");
				} else if ("b".equals(cate)) {
					vo.setCval("드럼세탁기");
				} else if ("c".equals(cate)) {
					vo.setCval("미니세탁기");
				} else {
					return "error";
				}
			}
		} else {
			return "error";
		}
		// 세팅된 a, b, c 및 vo에 저장된 정보로 데이터를 구하여 전달 
		model.addAttribute("list", productService.selectAll(vo));
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		model.addAttribute("c", c);
		return "/product/index";
	}
	
	@RequestMapping("/product/detail/{no}")
	public String detail(Model model, ProductVo vo,  @PathVariable String no) {
		vo.setPno(Integer.parseInt(no));
		model.addAttribute("vo", productService.detail(vo));
		return "/product/detail";
	}
	
	@RequestMapping("/product/detail/calcPrice")
	public String calcPrice(Model model, @RequestParam Map<String, Object> params) {
		model.addAttribute("result", new JSONObject(params));
		return "/include/result";
	}
	
	@RequestMapping ("/product/detail/review")
	public String list(Model model, ReviewVo vo) { 
		model.addAttribute("list", reviewService.selectAll(vo));
		return "/include/review";
	}
}
