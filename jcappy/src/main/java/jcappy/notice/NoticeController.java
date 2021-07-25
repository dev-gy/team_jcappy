package jcappy.notice;

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
public class NoticeController {
	
	@Autowired
	NoticeService service;
	@Autowired
	CommentService cService;
	//tablename 변수 설정하여 comment insert, list 에서 사용
	static final String TABLENAME = "notice";
	
	//공지사항 인덱스
	@RequestMapping("/admin/board/notice/list")
	public String index(Model model, NoticeVo vo, HttpSession sess) {
		MembersVo fmv = new MembersVo();
		//임시 로그인 세션 이메일
		fmv.setMemail("bbb");
		//임시 로그인 세션 비밀번호
		fmv.setMpwd("bbb");
		//임시 로그인 세션 
		MembersVo mv = service.temporarySession(fmv);
		//임시 로그인 세션
		sess.setAttribute("membersInfo", mv);		
		model.addAttribute("list", service.selectAll(vo));
		return "admin/board/notice/list";
	}
	//공지사항 상세페이지
	@RequestMapping("/admin/board/notice/detail")
	public String detail(Model model, NoticeVo vo) {
		model.addAttribute("vo", service.detail(vo));
		
		return "admin/board/notice/detail";
	}
	//공지사항 쓰기페이지
	@RequestMapping("/admin/board/notice/write")
	public String write(Model model, NoticeVo vo) {
		return "admin/board/notice/create";
	}
	//공지사항 데이터 입력
	@RequestMapping("/admin/board/notice/insert")
	public String insert(Model model, NoticeVo vo, 
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
				vo.setNfile_org(org);
				vo.setNfile_real(real);
			} catch (Exception e) {
				
			}
		}
		int r = service.insert(vo);
		// r > 0 : 정상 -> alert -> 목록으로 이동
		// r == 0 : 비정상 -> alert -> 이전페이지로 이동
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "list");
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "write");
		}
		return "admin/include/alert";
	}
	//공지사항 수정페이지
	@RequestMapping("/admin/board/notice/edit")
	public String edit(Model model, NoticeVo vo) {
		model.addAttribute("vo", service.edit(vo));
		return "admin/board/notice/edit";
	}
	//공지사항 업데이트
	@RequestMapping("/admin/board/notice/update")
	public String update(Model model, NoticeVo vo, 
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
				vo.setNfile_org(org);
				vo.setNfile_real(real);
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
			model.addAttribute("url", "edit?no="+vo.getNno());
		}
		return "admin/include/alert";
	}
	//공지사항 삭제
	@RequestMapping("/admin/board/notice/delete")
	public String delete(Model model, NoticeVo vo, HttpServletRequest req) {
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("result", "true");
		} else {
			model.addAttribute("result", "false");
		}
		return "admin/include/result";
	}
	//댓글 데이터 입력
	@RequestMapping("/admin/board/notice/comment/insert")
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
	@RequestMapping("/admin/board/notice/comment/list")
	public String commentList(Model model, CommentVo cv) {
		// tablename notice
		cv.setCm_tablename(TABLENAME); 
		model.addAttribute("list", cService.selectAll(cv));
		return "admin/include/comment";
	}
	// 댓글 삭제
	@RequestMapping("/admin/board/notice/comment/delete")
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
