package site.inthebus.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import site.inthebus.function.BusNoCheck;
import site.inthebus.model.BusDataDAO;
import site.inthebus.model.BusDataDTO;

@WebServlet("/BusInCountCon")
public class BusInCountCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int arsID = Integer.parseInt(request.getParameter("arsID"));
		int day = Integer.parseInt(request.getParameter("day"));
		String busNo = request.getParameter("busNo");
		int time = Integer.parseInt(request.getParameter("time"));
		
		BusDataDAO dao = new BusDataDAO();
		ArrayList<List<Integer>> listCarrier = new BusNoCheck().makeStationList(busNo, arsID);
		
		int sum = 0;
		
		if (listCarrier != null) {
			List<Integer> inList = listCarrier.get(0);
			for (int i = 0, count = 0; i < inList.indexOf(arsID); i++) {
				count = dao.inCount(new BusDataDTO(day, busNo, inList.get(i), time));
				sum += count;
			}
		}else {
			System.out.println("리스트 생성 실패");
		}
	}

}
