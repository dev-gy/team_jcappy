package jcappy.qna;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class QnaController {

	@Autowired
	QnaService service;
	
	// 문의 목록
	@RequestMapping("/mypage/qna/list")
	public String index(Model model, QnaVo vo, HttpSession sess) {
		model.addAttribute("list", service.selectAll(vo));
		return "mypage/qna/list";
	}
	
	// 문의 작성
	@RequestMapping("/mypage/qna/write")
	public String write(Model model, QnaVo vo) {
		return "mypage/qna/write";
	}
	
	@RequestMapping("/mypage/qna/insert")
	public String insert(Model model, QnaVo vo, 
			@RequestParam MultipartFile file, HttpServletRequest req) {
		if (!file.isEmpty()) { // 첨부파일이 있으면
			try {
				String org = file.getOriginalFilename(); // 원본파일명
				String ext = ""; //확장자
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장할 파일명
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로+파일명 저장
				vo.setQfile_org(org);
				vo.setQfile_real(real);
			} catch (Exception e) {
			}
		}
		int r = service.insert(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "/jcappy/mypage/qna/list");
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "reply");
		}
		return "include/alert";
	}
	
	// 문의 삭제
	@RequestMapping("/mypage/qna/delete")
	public String delete(Model model, QnaVo vo, HttpServletRequest req) {
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "include/result";
	}
	
	// 문의 상세
	@RequestMapping("/mypage/qna/detail")
	public String detail(Model model, QnaVo vo) {
		model.addAttribute("vo", service.detail(vo));
		return "mypage/qna/detail";
	}
	
	// 문의 수정
	@RequestMapping("/mypage/qna/update")
	public String update(Model model, QnaVo vo, 
						@RequestParam MultipartFile file, HttpServletRequest req) {
		//service.insert(vo, filename, req)
		if (!file.isEmpty()) { // 첨부파일이 있으면
			try {
				String org = file.getOriginalFilename(); // 원본파일명
				String ext = ""; //확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장할 파일명
	//			System.out.println("org:"+org);
	//			System.out.println("real:"+real);
				// 파일 저장
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로+파일명 저장
				// vo에 set
				vo.setQfile_org(org);
				vo.setQfile_real(real);
			} catch (Exception e) {
				
			}
		}
		int r = service.update(vo);
		// r > 0 : 정상 -> alert -> 목록으로 이동
		// r == 0 : 비정상 -> alert -> 이전페이지로 이동
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "list");
		} else {
			model.addAttribute("msg", "수정실패");
			model.addAttribute("url", "edit?no="+vo.getQno());
		}
		return "include/alert";
	}
	
	
	
	
}
