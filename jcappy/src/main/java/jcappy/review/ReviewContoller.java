package jcappy.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewContoller {
	
	@Autowired
	ReviewService service;
	
	@RequestMapping 
	public String productReview(Model model, ReviewVo vo) { 
		model.addAttribute("result", service.selectAll(vo));
		return "/include/result";
	}
}
