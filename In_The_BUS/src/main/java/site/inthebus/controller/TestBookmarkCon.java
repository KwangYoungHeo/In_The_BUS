package site.inthebus.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.inthebus.model.TestBookmarkDAO;
import site.inthebus.model.TestBookmarkDTO;


@WebServlet("/TestBookmarkCon")
public class TestBookmarkCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[TestBookmarkCon]");
		
		String id = request.getParameter("id");
		String bus_id = request.getParameter("bus_id");
		String station_id = request.getParameter("station_id");
		String bus_name = request.getParameter("bus_name");
		
		TestBookmarkDTO dto = new TestBookmarkDTO(id, bus_id, station_id, bus_name);
		TestBookmarkDAO dao = new TestBookmarkDAO();
		int row = dao.insertBookmark(dto);
		
		if (row > 0) {
			System.out.println("즐겨찾기 추가 성공!!");
		}else {
			System.out.println("즐겨찾기 추가 실패..");
		}
	}

}
