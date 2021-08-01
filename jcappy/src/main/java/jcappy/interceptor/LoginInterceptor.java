package jcappy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;


public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		if (request.getSession().getAttribute("membersInfo") != null) {
			return true;
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.sendRedirect("/jcappy/login");
			return false;
		}
	}
}
