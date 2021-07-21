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

@Controller
public class MembersController {
	
	@Autowired
	MembersService service;
	
	@GetMapping("/login.do")
	public String loginForm(MembersVo vo, @CookieValue(value="cookieId", required = false) Cookie cookie) {
		if (cookie != null) {
			vo.setMemail(cookie.getValue());
		}
		return "/login";
	}
	
	@PostMapping("/login.do")
	   public String login(Model model, MembersVo vo, HttpServletRequest req,HttpServletResponse res, HttpSession sess) {
	      MembersVo mv = service.login(vo);
	      if (mv == null) {
	         model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다");
	         model.addAttribute("url", "login.do");
	         return "include/alert";
	      } else {
	         sess.setAttribute("membersInfo", mv);
	         // 쿠키에 저장
	         Cookie cookie = new Cookie("cookieEmail", vo.getMemail());
	         cookie.setPath("/");
	         if ("check".equals(vo.getCheckEmail())) {
	            cookie.setMaxAge(60*60*3);
	         } else {
	            cookie.setMaxAge(0);
	         }
	         res.addCookie(cookie);
	          String url = "/index.do";
	          if (req.getParameter("url") != null && !"".equals( req.getParameter("url"))) url = req.getParameter("url");
	            return "redirect: "+url;
	      }
	   }
	

}
