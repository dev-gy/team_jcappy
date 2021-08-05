package jcappy.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jcappy.comment.CommentService;
import jcappy.comment.CommentVo;



@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	@Autowired
	CommentService cService;
	//tablename 변수 설정하여 comment insert, list 에서 사용
	static final String TABLENAME = "notice";
	
	//공지사항 목록
	@RequestMapping("/notice/list")
	public String index(Model model, NoticeVo vo, HttpSession sess) {
		model.addAttribute("list", service.selectAll(vo));
		return "notice/list";
	}
	
	//공지사항 상세페이지
	@RequestMapping("/notice/detail")
	public String detail(Model model, NoticeVo vo) {
		model.addAttribute("vo", service.detail(vo));
		return "notice/detail";
	}
	
	//댓글 데이터 입력
	@RequestMapping("/notice/comment/insert")
	public String commentInsert(Model model, CommentVo vo) {
		// tablename notice
		vo.setCm_tablename(TABLENAME); 
		int r = cService.insert(vo);
		
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		
		return "admin/include/result";
	}
	
	//댓글 리스트 불러오기
	@RequestMapping("/notice/comment/list")
	public String commentList(Model model, CommentVo cv) {
		// tablename notice
		cv.setCm_tablename(TABLENAME); 
		model.addAttribute("list", cService.selectAll(cv));
		return "admin/include/comment";
	}
	
	// 댓글 삭제
	@RequestMapping("/notice/comment/delete")
	public String commentDelete(Model model, CommentVo vo) {
		int r = cService.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
	
	//댓글 존재 여부 파악
	@RequestMapping("/notice/comment/ccount")
	public String ccount(Model model, CommentVo vo) {
		vo.setCm_tablename(TABLENAME); 
		int r = cService.ccount(vo);
		System.out.println("실험:" + r);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
}
