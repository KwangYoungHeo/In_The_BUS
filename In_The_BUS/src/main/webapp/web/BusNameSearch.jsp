<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
</head>
<body>

	<div>
		<input type="text" id="busNo">
		<button onclick="searchBusLaneAJAX();">click</button>
	</div>

	<button onclick="showRouteList()">click</button>
	<table id="showRouteList" border=1>
		<tr>
			<td>번호</td>
			<td>arsID</td>
			<td>StationID</td>
			<td>정류장명</td>
		</tr>
	</table>


	<script>
		var busInfo = "";
		function searchBusLaneAJAX() {
			var busNo = document.getElementById('busNo').value;
			var xhr = new XMLHttpRequest();
			var url = "https://api.odsay.com/v1/api/searchBusLane?apiKey=bl1n7aNENQxrtjDL46c0hg&CID=5000&busNo="
					+ busNo;
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultObj = JSON.parse(xhr.responseText);
					var busID = resultObj.result.lane[0].busID;
					// ["lane"] 일반 조회 시 사용
					var xhr2 = new XMLHttpRequest();
					var url2 = "https://api.odsay.com/v1/api/busLaneDetail?apiKey=bl1n7aNENQxrtjDL46c0hg&lang=0&busID="
							+ busID
					xhr2.open("GET", url2, true);
					xhr2.send();
					xhr2.onreadystatechange = function() {
						if (xhr2.readyState == 4 && xhr2.status == 200) {
							busInfo = JSON.parse(xhr2.responseText).result;
							// 버스 상세 정보
							console.log(busInfo);
						}
					};
				}
			};
		}

		function showRouteList() {
			for (var i = 0; i < busInfo.station.length; i++) {
				var busNo = busInfo.busNo;
				var busID = busInfo.busLocalBlID;
				var arsID = busInfo.station[i].arsID;
				var localStationID = busInfo.station[i].localStationID;
				var stationName = busInfo.station[i].stationName;

				$("#showRouteList").append("<tr> </tr>");
				$("tr").last().append(
						"<a href='./InsideBUS.jsp?arsID=" + arsID
								+ "&localStationID=" + localStationID
								+ "&stationName=" + stationName + "&busID="
								+ busID + "&busNo=" + busNo + "'><td>"
								+ (i + 1) + "</td></a>");
				$("tr").last().append("<td>" + arsID + "</td>");
				$("tr").last().append("<td>" + localStationID + "</td>");
				$("tr").last().append("<td>" + stationName + "</td>");
			}
		}
	</script>

</body>
</html>