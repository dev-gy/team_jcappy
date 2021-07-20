package jcappy.item;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ItemController {

	@Autowired
	ItemService service;
	  
	@RequestMapping("/admin/item/list")
	public String index(Model model, ItemVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/item/list";
	}
	
	@RequestMapping("/admin/item/detail")
	public String detail(Model model, ItemVo vo) {
		model.addAttribute("vo", service.detail(vo));
		return "admin/item/detail";
	}
	
	@RequestMapping("/admin/item/write")
	public String write(Model model, ItemVo vo) {
		return "admin/item/write";
	}
	
	@RequestMapping("/board/insert.do")
	public String insert(Model model, ItemVo vo, 
						@RequestParam MultipartFile file, HttpServletRequest req) {

		int r = service.insert(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "list");
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "write");
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/item/edit")
	public String edit(Model model, ItemVo vo) {
		model.addAttribute("vo", service.edit(vo));
		return "/admin/item/edit";
	}
	
	@RequestMapping("/board/update.do")
	public String update(Model model, ItemVo vo, 
						@RequestParam MultipartFile file, HttpServletRequest req) {
	
		int r = service.update(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("msg", "수정실패");
			model.addAttribute("url", "edit.do?no="+vo.getIno());
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/item/delete")
	public String delete(Model model, ItemVo vo, HttpServletRequest req) {
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}
}
