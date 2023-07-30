package site.inthebus.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import site.inthebus.model.MemberDAO;
import site.inthebus.model.MemberDTO;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[LoginCon]");
		
		String email = request.getParameter("id");
		System.out.println(email);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(email);
		MemberDTO info = dao.login(dto);
		
		Gson gson = new Gson();
		String result = gson.toJson(info);

		if(info != null) {
			response.getWriter().print(result);
		}else {
			response.getWriter().print(result);
		}
	}

}
