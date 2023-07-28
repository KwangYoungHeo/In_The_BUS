package site.inthebus.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import site.inthebus.model.BookmarkDAO;
import site.inthebus.model.BookmarkDTO;

@WebServlet("/BookmarkDuplicationCheckCon")
public class BookmarkDuplicationCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[BookmarkDuplicationCheckCon]");
		
		String id = request.getParameter("id");
		String bus_id = request.getParameter("bus_id");
		String station_id = request.getParameter("station_id");
		String bus_name = request.getParameter("bus_name");
		
		BookmarkDTO dto = new BookmarkDTO(id, bus_id, station_id);
		BookmarkDAO dao = new BookmarkDAO();
		Gson gson = new Gson();
		
		BookmarkDTO result = dao.duplicationCheck(dto);
		
		if (result == null) {
			System.out.println("값이 존재하지 않습니다.");
		}else {
			System.out.println("중복된 값이 존재합니다.");
			response.getWriter().print(gson.toJson(result));
		}
	}

}
