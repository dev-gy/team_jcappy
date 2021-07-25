package jcappy.review;

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

import jcappy.comment.CommentService;
import jcappy.comment.CommentVo;
import jcappy.members.MembersVo;



@Controller
public class AdminReviewController {
	
	@Autowired
	AdminReviewService service;
	@Autowired
	CommentService cService;
	//tablename 변수 설정하여 comment insert, list 에서 사용
	static final String TABLENAME = "review";
	
	//공지사항 인덱스
	@RequestMapping("/admin/board/review/list")
	public String index(Model model, ReviewVo vo, HttpSession sess) {
		MembersVo fmv = new MembersVo();
		//임시 로그인 세션 이메일
		fmv.setMemail("aaa");
		//임시 로그인 세션 비밀번호
		fmv.setMpwd("aaa");
		//임시 로그인 세션 
		MembersVo mv = service.temporarySession(fmv);
		//임시 로그인 세션
		sess.setAttribute("membersInfo", mv);		
		model.addAttribute("list", service.selectAll(vo));
		return "admin/board/review/list";
	}
	//공지사항 상세페이지
	@RequestMapping("/admin/board/review/detail")
	public String detail(Model model, ReviewVo vo) {
		model.addAttribute("vo", service.detail(vo));
		
		return "admin/board/review/detail";
	}
	
	//공지사항 삭제
	@RequestMapping("/admin/board/review/delete")
	public String delete(Model model, ReviewVo vo, HttpServletRequest req) {
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
	//댓글 데이터 입력
	@RequestMapping("/admin/board/review/comment/insert")
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
	@RequestMapping("/admin/board/review/comment/list")
	public String commentList(Model model, CommentVo cv) {
		// tablename notice
		cv.setCm_tablename(TABLENAME); 
		model.addAttribute("list", cService.selectAll(cv));
		return "admin/include/comment";
	}
	// 댓글 삭제
	@RequestMapping("/admin/board/review/comment/delete")
	public String commentDelete(Model model, CommentVo vo) {
		int r = cService.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
}
