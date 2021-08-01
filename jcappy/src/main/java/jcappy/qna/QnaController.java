package jcappy.qna;

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
public class QnaController {

	@Autowired
	QnaService service;
	
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
			model.addAttribute("url", "list");
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "reply");
		}
		return "admin/include/alert";
	}
	
	
}
