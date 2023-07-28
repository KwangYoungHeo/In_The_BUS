package site.inthebus.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import site.inthebus.model.BookmarkDAO;
import site.inthebus.model.BookmarkDTO;


@WebServlet("/BookmarkGetCon")
public class BookmarkGetCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[BookmarkGetCon]");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		
		BookmarkDAO dao = new BookmarkDAO();
		
		ArrayList<BookmarkDTO> bookmarkList = dao.selectBookmark(id);
		
		Gson gson = new Gson();
		
		if(bookmarkList != null) {
			String result = gson.toJson(bookmarkList);
			response.getWriter().print(result);
		}else {
			System.out.println("북마크가 없습니다.");
		}
		
		
		
	}

}
