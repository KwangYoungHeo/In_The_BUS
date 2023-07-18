<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link ren="stylesheet" href="//Main.css">
</head>
<body>
	<div id="left">
		<div id="header">
			<form action="" id="search">
				<input type="text" name="depart" placeholder="출발지 입력" id="depart" />
				<br> <input type="text" name="arrive" placeholder="도착지 입력"
					id="arrive" />
				<button onclick="search()">검색</button>
			</form>
		</div>
		<div id="map" style="width: 900%; height: 600px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9142efa60865fec179e97899ff351e55&libraries=services"></script>
		<script src="./Main.js"></script>
		<script type="text/javascript"
			scr="https://api.odsay.com/v1/api/searchBusLane?apiKey=MXyujzIXytiQVm+RqcA+Mw&busNo=06&CID=5000"></script>
</body>
</html>