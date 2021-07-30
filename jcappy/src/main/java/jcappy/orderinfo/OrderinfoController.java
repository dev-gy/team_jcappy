package jcappy.orderinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jcappy.members.MembersService;
import jcappy.members.MembersVo;
import jcappy.product.ProductService;

@Controller
public class OrderinfoController {
	
	@Autowired
	OrderinfoService orderinfoService;
	@Autowired
	ProductService productService;
	@Autowired
	MembersService membersService;
	
	@RequestMapping("/pay")
	public String index(Model model, HttpServletRequest request,
			@RequestParam(value = "sno", required = false) List<Integer> snoList, 
			@RequestParam("pno") List<Integer> pnoList, 
			@RequestParam("count") List<Integer> countList,
			@RequestParam("name") List<String> nameList,
			@RequestParam("img") List<String> imgList,
			@RequestParam("total_price") List<Integer> total_priceList) {
		
		// 넘겨받은 상품정보들을 정리해서 전달.
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < pnoList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (snoList != null) {
				map.put("sno", snoList.get(i));
			}
			map.put("pno", pnoList.get(i));
			map.put("count", countList.get(i));
			map.put("name", nameList.get(i));
			map.put("img", imgList.get(i));
			map.put("total_price", total_priceList.get(i));
			list.add(map);
		}
		model.addAttribute("list", list);

		// 기본 배송지 정보 회원의 주소를 통해 전달.
		model.addAttribute("mVo", membersService.detail((MembersVo)request.getSession().getAttribute("membersInfo")));
		
		
		
		return "/pay/index";
	}
}
