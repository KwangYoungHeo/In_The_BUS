package site.inthebus.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import site.inthebus.model.DTO;
import site.inthebus.model.TestBookmarkDAO;
import site.inthebus.model.TestBookmarkDTO;

@WebServlet("/TestBookmarkDeleteCon")
public class TestBookmarkDeleteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[TestBookmarkDeleteCon]");
		
		String id = request.getParameter("id");
		String bus_id = request.getParameter("bus_id");
		String station_id = request.getParameter("station_id");

		
		TestBookmarkDTO dto = new TestBookmarkDTO(id, bus_id, station_id);
		TestBookmarkDAO dao = new TestBookmarkDAO();
		Gson gson = new Gson();
		
		int row = dao.deleteBookmark(dto);
		
		if(row>0) {
			System.out.println("즐겨찾기 삭제 성공!!");
			response.getWriter().print(gson.toJson(row));
		}else {
			System.out.println("즐겨찾기 삭제 실패..");
		}
		
	}

}
