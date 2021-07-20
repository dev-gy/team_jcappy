package jcappy.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {

	@Autowired
	ItemService service;
	  
	@RequestMapping("/admin/item/list")
	public String index(Model model, ItemVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/item/list";
	}
	
}
