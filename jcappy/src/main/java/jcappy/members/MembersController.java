package jcappy.members;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MembersController {
	
	@Autowired
	MembersService service;
	// 회원가입 페이지
	@RequestMapping("/join")
	public String join(Model model, MembersVo vo) {
		return "members/join";
	}
	
	//이메일 중복 확인
	@RequestMapping("/members/isDuplicateEmail")
	public String isDuplicateEmail(Model model, @RequestParam String email) {
		if (service.isDuplicateEmail(email) == 0) {
			model.addAttribute("result", "false");
		} else {
			model.addAttribute("result", "true");
		}
		return "include/result";
	}
	
	//연락처 중복 확인
	@RequestMapping("/members/isDuplicatePhone")
	public String isDuplicatePhone(Model model, @RequestParam String phone) {
		if (service.isDuplicatePhone(phone) == 0) {
			model.addAttribute("result", "false");
		} else {
			model.addAttribute("result", "true");
		}
		return "include/result";
	}
	
	// 회원가입 insert
	@RequestMapping("/insert")
	public String insert(Model model, MembersVo vo, HttpServletRequest req) {
		int r = service.insert(vo);
		if (r>0) {
			model.addAttribute("msg", "정상적으로 가입되었습니다");
			model.addAttribute("url", "/jcappy/index.do");
		} else {
			model.addAttribute("msg", "가입 실패");
			model.addAttribute("url", "/join");
		}
		return "include/alert";
	}
	
	// 로그인
	@GetMapping("/login")
	public String loginForm(MembersVo vo, @CookieValue(value="cookieEmail", required = false) Cookie cookie) {
		if (cookie != null) {
			vo.setMemail(cookie.getValue());
		}
		return "members/login";
	}
	// 로그인 쿠키
	@PostMapping("/login")
	   public String login(Model model, MembersVo vo, HttpServletRequest req, HttpServletResponse res, HttpSession sess) {
	      MembersVo mv = service.login(vo);
	      if (mv == null) {
	         model.addAttribute("msg", "이메일 또는 비밀번호가 올바르지 않습니다");
	         model.addAttribute("url", "login");
	         return "include/alert";
	      } else {
	         sess.setAttribute("membersInfo", mv);
	         // 쿠키에 저장
	         Cookie cookie = new Cookie("cookieEmail", vo.getMemail());
	         cookie.setPath("/");
	         if ("check".equals(vo.getCheckMemail())) {
	            cookie.setMaxAge(60*60*5);
	         } else {
	            cookie.setMaxAge(0);
	         }
	         res.addCookie(cookie);
	         String url = "/jcappy";
	         if (req.getParameter("url") != null && !"".equals( req.getParameter("url"))) url = req.getParameter("url");
	         return "redirect: "+url;
	      }
	   }
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(Model model, HttpSession sess) {
		sess.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "/jcappy");
		return "include/alert";
	}
	
	//이메일 찾기
	@GetMapping("/findEmail")
	public String findEmail(Model model, MembersVo vo) {
		return "members/findEmail";
	}
	
	@PostMapping("/findEmail")
	public String findEmail2(Model model, MembersVo vo) {
		MembersVo mv = service.findEmail(vo); 
		String id ="";
		if (mv != null) { 
			id = mv.getMemail();
		}
		model.addAttribute("result", id);	
		return "include/result";
	}
	
	//비밀번호 찾기
	@GetMapping("/findPwd")
	public String findPwd(Model model, MembersVo vo) {
		return "members/findPwd";
	}
	
	@PostMapping("/findPwd")
	public String findPwd2(Model model, MembersVo vo) {
		MembersVo mv = service.findPwd(vo);
		if (mv != null) {
			model.addAttribute("result", "ok");
		} else {
			model.addAttribute("result", "no");
		}
		return "include/result";
	}
	
	// 회원 탈퇴
	@RequestMapping("/mypage/delete")
	public String delete(Model model, MembersVo vo, HttpSession sess) {
		MembersVo membersInfo = (MembersVo)sess.getAttribute("membersInfo");
		service.delete(vo);
		sess.invalidate();
		return "redirect: /jcappy/index.do";
	}
	
	// 회원 정보 수정
	@RequestMapping("mypage/update")
	public String update(Model model, MembersVo vo, HttpSession sess) {
		int r = service.update(vo, sess);
		if (r>0) {
		model.addAttribute("msg", "정상적으로 수정되었습니다");
		model.addAttribute("url", "/jcappy");
		} else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "/jcappy/mypage/memberedit");
		}
		return "include/alert";
	}
	
	@RequestMapping("mypage/memberedit")
	public String updateView() {
		return "mypage/memberedit";
	}
	

}
