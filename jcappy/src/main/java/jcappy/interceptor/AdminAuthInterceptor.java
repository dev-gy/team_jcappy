package jcappy.interceptor;

import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import jcappy.admin.AdminVo;

public class AdminAuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {

		HttpSession session = req.getSession();
		AdminVo vo = (AdminVo) session.getAttribute("adminInfo");
		vo.setAuthList(vo.getAuth().split(":"));

		String[] URI = { "/admin/account/", "/admin/add/", "/admin/order/", "/admin/auth/", "/admin/members/",
				"/admin/product/", "/admin/board/", "/admin/comment/" };
		
		String reqURI = req.getServletPath();

		Boolean result = false;

		Method[] methods = this.getClass().getDeclaredMethods();
		
		OUTTER : for (int i = 0; i < URI.length; i++) {
			if (reqURI.startsWith(URI[i])) {
				for (int j = 0; j < methods.length; j++) {
					if (methods[j].getName().toLowerCase().equals(URI[i].replace("/", ""))) {
						result = (Boolean) methods[j].invoke(this.getClass().newInstance(), vo);
						break OUTTER;
					}
				}
			}
		}

		if (result) {
			return result;
		} else {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print("<script>");
			out.print("alert('접근 권한이 없습니다.');");
			out.print("location.href='/jcappy/admin/main';");
			out.print("</script>");
			return result;
		}
	}

	private boolean adminProduct(AdminVo vo) throws Exception {if (vo.getAuthList()[0].equals("1")) {return true;} else {return false;}}
	
	private boolean adminOrder(AdminVo vo) throws Exception {if (vo.getAuthList()[1].equals("1")) {return true;} else {return false;}}
	
	private boolean adminMembers(AdminVo vo) throws Exception {if (vo.getAuthList()[2].equals("1")) {return true;} else {return false;}}
	
	private boolean adminBoard(AdminVo vo) throws Exception {if (vo.getAuthList()[3].equals("1")) {return true;} else {return false;}}
	
	private boolean adminAdd(AdminVo vo) throws Exception {if (vo.getAuthList()[4].equals("1")) {return true;} else {return false;}}
	
	private boolean adminAccount(AdminVo vo) throws Exception {if (vo.getAuthList()[5].equals("1")) {return true;} else {return false;}}

	private boolean adminAuth(AdminVo vo) throws Exception {if (vo.getAuthList()[6].equals("1")) {return true;} else {return false;}}
}
