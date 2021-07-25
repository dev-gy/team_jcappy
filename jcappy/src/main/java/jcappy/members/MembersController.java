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
	
	// 회원가입 insert
	@RequestMapping("/insert")
	public String insert(Model model, MembersVo vo, HttpServletRequest req) {
		int r = service.insert(vo);
		// r > 0 : 정상 -> alert -> 목록으로 이동
		// r == 0: 비정상 -> alert -> 이전 페이지로 이동
		if (r>0) {
			model.addAttribute("msg", "정상적으로 가입되었습니다");
			model.addAttribute("url", "/jcappy/index");
		} else {
			model.addAttribute("msg", "가입 실패");
			model.addAttribute("url", "/join");
		}
		return "include/alert";
	}
	
	@GetMapping("/login")
	public String loginForm(MembersVo vo, @CookieValue(value="cookieId", required = false) Cookie cookie) {
		if (cookie != null) {
			vo.setMemail(cookie.getValue());
		}
		return "members/login";
	}
	
	@PostMapping("/login")
	   public String login(Model model, MembersVo vo, HttpServletRequest req,HttpServletResponse res, HttpSession sess) {
	      MembersVo mv = service.login(vo);
	      if (mv == null) {
	         model.addAttribute("msg", "이메일 또는 비밀번호가 올바르지 않습니다");
	         model.addAttribute("url", "login.do");
	         return "include/alert";
	      } else {
	         sess.setAttribute("membersInfo", mv);
	         // 쿠키에 저장
	         Cookie cookie = new Cookie("cookieId", vo.getMemail());
	         cookie.setPath("/");
	         if ("check".equals(vo.getCheckMemail())) {
	            cookie.setMaxAge(60*60*5);
	         } else {
	            cookie.setMaxAge(0);
	         }
	         res.addCookie(cookie);
	          String url = "/jcappy/index.do";
	          if (req.getParameter("url") != null && !"".equals( req.getParameter("url"))) url = req.getParameter("url");
	            return "redirect: "+url;
	      }
	   }
	
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
	

}
