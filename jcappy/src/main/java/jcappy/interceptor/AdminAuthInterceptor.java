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
		vo.setAuthList(vo.getAuth().split(":")); // 등급의 정보가 담겨있는 문자열 데이터를 split으로 쪼개어 배열로 만들어서 담아준다.

		String[] URI = { "/admin/sales/", "/admin/add/", "/admin/order/", "/admin/auth/", "/admin/members/",
				"/admin/product/", "/admin/board/", "/admin/comment/" }; // 메뉴의 대분류가되는 주소를 배열로
		
		String reqURI = req.getServletPath(); // 현재 요청 받은 servletPath

		Boolean result = false;

		Method[] methods = this.getClass().getDeclaredMethods(); // 선언된 메서드들의 배열
		
		OUTTER : for (int i = 0; i < URI.length; i++) {
			if (reqURI.startsWith(URI[i])) { // 요청받은 servletPath가 해당 메뉴의 분류가되는 문자열로 시작하면,
				for (int j = 0; j < methods.length; j++) {
					if (methods[j].getName().toLowerCase().equals(URI[i].replace("/", ""))) { // 선언되어있는 메서드 중에 '/'를 제외한 것과 같은 이름의 메서드를 찾고,
						result = (Boolean) methods[j].invoke(this.getClass().newInstance(), vo); // 있으면 실행해서 권한 여부를 확인
						break OUTTER;
					}
				}
			}
		}

		if (result) { // 권한이 있으면 true를 리턴해서 가려던 컨트롤러로 가게되고, 없으면 false 리턴
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
	
	private boolean adminSales(AdminVo vo) throws Exception {if (vo.getAuthList()[5].equals("1")) {return true;} else {return false;}}

	private boolean adminAuth(AdminVo vo) throws Exception {if (vo.getAuthList()[6].equals("1")) {return true;} else {return false;}}
}
