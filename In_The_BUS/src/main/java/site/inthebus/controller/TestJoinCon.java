package site.inthebus.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import site.inthebus.model.DTO;
import site.inthebus.model.TestMemberDAO;
import site.inthebus.model.TestMemberDTO;


@WebServlet("/TestJoinCon")
public class TestJoinCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[TestJoinCon]");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String profile_img = request.getParameter("profile_img");
		
		TestMemberDAO dao = new TestMemberDAO();
		TestMemberDTO dto = new TestMemberDTO(id, nickname, profile_img);
		Gson gson = new Gson();
		
		String json = gson.toJson(dto);
		
		int row = dao.testJoin(dto);
		
		if (row > 0) {
			System.out.println("회원가입 성공!!");
			response.getWriter().print(json);
		}else {
			System.out.println("회원가입 실패..");
			
		}
		

	}

}
