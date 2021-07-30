package jcappy.shopcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ShopcartController {
	
	@Autowired
	ShopcartService shopcartshopService;
	
	@RequestMapping("/cart")
	public String index(Model model) {
		model.addAttribute("list", shopcartshopService.selectAll());
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
