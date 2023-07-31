package site.inthebus.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogOutCon")
public class LogOutCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[LogOutCon]");

		String cookie_name = "jsonData";

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie_name.equals(cookie.getName())) {
					cookie.setMaxAge(0); // 쿠키의 유효기간을 0으로 설정하여 삭제
					cookie.setPath("/"); // 쿠키의 경로를 설정 (JSP와 동일한 경로로 설정)
					cookie.setDomain("./web/In_The_Bus_Main.jsp"); // 쿠키의 도메인을 설정 (JSP와 동일한 도메인으로 설정)
					response.addCookie(cookie);
					break; // 원하는 쿠키를 찾았으므로 더 이상 반복할 필요 없음
				}
			}
		}

		// 삭제된 쿠키를 확인하기 위해 다시 JSP 페이지로 리다이렉트
		response.sendRedirect("./web/In_The_Bus_Main.jsp");

	}

}
