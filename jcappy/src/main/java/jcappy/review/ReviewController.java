package jcappy.review;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jcappy.members.MembersVo;
import jcappy.product.ProductService;
import jcappy.product.ProductVo;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewservice;
	@Autowired
	ProductService productService;
	
	@RequestMapping("/mypage/review/write/{ono}/{pno}")
	public String write(Model model, @PathVariable int ono, @PathVariable int pno) { 
		ProductVo pVo = new ProductVo();
		pVo.setPno(pno);
		model.addAttribute("pVo", productService.detail(pVo));
		model.addAttribute("ono", ono);
		return "mypage/review/write";
	}
	
	@RequestMapping("/mypage/review/insert")
	public String write(Model model, ReviewVo vo, @RequestParam MultipartFile file, HttpServletRequest request) { 
		if (!file.isEmpty()) { // 첨부파일이 있으면
			try {
				String org = file.getOriginalFilename(); // 원본파일명
				String ext = ""; //확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장할 파일명
				
				// 파일 저장
				String path = request.getServletContext().getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로+파일명 저장
				// vo에 set
				vo.setRfile_org(org);
				vo.setRfile_real(real);
				
			} catch (Exception e) {
				
			}
		}
		vo.setMno(((MembersVo)request.getSession().getAttribute("membersInfo")).getMno());
		int res = reviewservice.insert(vo);
		// r > 0 : 정상 -> alert -> 목록으로 이동
		// r == 0 : 비정상 -> alert -> 이전페이지로 이동
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "/jcappy/mypage/order/detail/"+vo.getOno());
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "/jcappy/mypage/review/write/"+vo.getOno()+"/"+vo.getPno());
		}
		return "include/alert";
	}
}
