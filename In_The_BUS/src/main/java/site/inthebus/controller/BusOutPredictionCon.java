package site.inthebus.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

@WebServlet("/BusOutPredictionCon")
public class BusOutPredictionCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 현재 날짜
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String Date = now.format(formatter);
		
		int day = Integer.parseInt(Date) - 10000;
		// int day = 20220716;
		
		// 현재 날짜로부터 15일
		int dateRange = 15;
		int day_range = 0;
		if ((day + dateRange) % 100 > 31) {
			day_range = (day + 100) - dateRange;
		} else if ((day - dateRange) % 100 > 31) {
			day_range = (day - 100) + dateRange;
		} else {
			day_range = day+15;
		}
		
		// 현재 시간
		DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("HH:mm:ss");		
		int time = Integer.parseInt(now.format(formatterTime).substring(0, 2));
		// int time = 8;
		
		// 현재 시간과 대응되는 시간
		int time_range = 0;
		if (time > 6 && time < 9) {
			time_range = 18;
		} else if (time > 17 && time < 21) {
			time_range = 8;
		} else {
			time_range = 17;
		}
		
		// 정류장 번호, 노선 명
		int arsID = Integer.parseInt(request.getParameter("arsID"));
		String busNo = request.getParameter("busNo"	);
		
		
		// 필드 생성
		int sum = 0;
		int outSum = 0;
		int outTotal = 0;
		ArrayList<List<Integer>> listCarrier = new BusNoCheck().makeStationList(busNo, arsID);
		ArrayList<Integer> outCountList = new ArrayList<>();
		
		BusDataDAO dao = new BusDataDAO();
		
		// 예측 로직
		if (listCarrier != null) {
			
			// 예측에 사용할 정류장 리스트
			List<Integer> inList = listCarrier.get(0);
			List<Integer> outList = listCarrier.get(1);
			
			// 총 탑승 인원
			for (int i = 0, count = 0; i < inList.indexOf(arsID); i++) {
				count = dao.inCount(new BusDataDTO(day, busNo, inList.get(i), time));
				sum += count;
			}
			
			// 하차 인원 예측
			if (outList.size() > inList.indexOf(arsID)) {
				for (int i = 0; i < inList.indexOf(arsID); i++) {
					outCountList.add(dao.outCount(new BusDataDTO(day_range, day, busNo, outList.get(i), time_range)) / dateRange);
					outSum += outCountList.get(i);
				}
				for (int i = 0; i < outList.size(); i++) {
					outTotal += dao.outCount(new BusDataDTO(day_range, day, busNo, outList.get(i), time_range)) / dateRange;
				}
			} else {
				for (int i = 0; i < outList.size(); i++) {
					outCountList.add(dao.outCount(new BusDataDTO(day_range, day, busNo, outList.get(i), time_range)) / dateRange);
					outSum += outCountList.get(i);
					outTotal = outSum;
				}
			}		
		} else {
			System.out.println("리스트가 비었습니다.");
		}
		
		int result = (int) (Math.abs(sum - outSum) * (1-((double) outSum / outTotal)));
		System.out.println(result);
		response.getWriter().print(result);
	}

}
