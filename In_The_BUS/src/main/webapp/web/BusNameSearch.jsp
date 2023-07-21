<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<input type="text" id="busNo">
		<button onclick="searchBusLaneAJAX();">click</button>
	</div>
	<div id="resultDiv">
		<!-- 결과창 -->
	</div>


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
	</script>

</body>
</html>