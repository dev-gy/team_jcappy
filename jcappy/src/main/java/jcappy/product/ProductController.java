package jcappy.product;

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
public class ProductController {

	@Autowired
	ProductService service;
	  
	@RequestMapping("/admin/product/list")
	public String list(Model model, ProductVo vo) {
		model.addAttribute("list", service.selectAll(vo));
		return "admin/product/list";
	}
	
	@RequestMapping("/admin/product/detail")
	public String detail(Model model, ProductVo vo) {
		model.addAttribute("vo", service.detail(vo));
		return "admin/product/detail";
	}
	
	@RequestMapping("/admin/product/write")
	public String write(Model model, ProductVo vo) {
		return "admin/product/write";
	}
	
	@RequestMapping("/admin/product/insert")
	public String insert(Model model, ProductVo vo, 
						@RequestParam MultipartFile file, HttpServletRequest req) {
		if (!file.isEmpty()) { // 첨부파일이 있으면
			try {
				String org = file.getOriginalFilename(); // 원본파일명
				String ext = ""; //확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장할 파일명
				// 파일 저장
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로+파일명 저장
				// vo에 set
				vo.setPimg1(org);
				vo.setPimg2(org);
				vo.setPimg3(org);
				vo.setPimg1(real);
				vo.setPimg2(real);
				vo.setPimg3(real);
			} catch (Exception e) {
				
			}
		}
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
	
	
	@RequestMapping("/admin/product/update")
	public String update(Model model, ProductVo vo, 
						@RequestParam MultipartFile file, HttpServletRequest req) {
	
		int r = service.update(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "list");
		} else {
			model.addAttribute("msg", "수정실패");
			model.addAttribute("url", "detail?no="+vo.getPno());
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/product/delete")
	public String delete(Model model, ProductVo vo, HttpServletRequest req) {
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}
}
