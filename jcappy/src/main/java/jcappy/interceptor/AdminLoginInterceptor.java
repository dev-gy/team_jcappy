package jcappy.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import jcappy.admin.AdminVo;

public class AdminLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {

		HttpSession session = req.getSession();
		AdminVo vo = (AdminVo) session.getAttribute("adminInfo");
		if (vo != null) {
			return true;
		} else {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print("<script>");
			out.print("alert('관리자 로그인 후 이용가능합니다.');");
			out.print("location.href='/jcappy/admin/login';");
			out.print("</script>");
			return false;
		}
	}
}
