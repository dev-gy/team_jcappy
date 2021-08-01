package jcappy.shopcart;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jcappy.members.MembersVo;

@Controller
public class ShopcartController {
	
	@Autowired
	ShopcartService shopcartshopService;
	
	@RequestMapping("/cart")
	public String index(Model model, HttpServletRequest request) {
		// 세션정보의 회원번호를 통해 회원의 장바구니 내역을 받아와 전달
		ShopcartVo vo = new ShopcartVo();
		vo.setMno(((MembersVo)request.getSession().getAttribute("membersInfo")).getMno());
		model.addAttribute("list", shopcartshopService.selectAll(vo));
		return "/cart";
	}
	
	@RequestMapping("/cart/countupdate")
	public String countUpdate(Model model, ShopcartVo vo) throws JsonProcessingException {
		if (shopcartshopService.update(vo) > 0) {
			model.addAttribute("result", new ObjectMapper().writeValueAsString(vo));
		}
		return "/include/result";
	}
	
	@RequestMapping("/cart/delete")
	public String delete(Model model, ShopcartVo vo) {
		model.addAttribute("result", shopcartshopService.delete(vo));
		return "/include/result";
	}
}
