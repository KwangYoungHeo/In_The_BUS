<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>🚍Bus_Name_Search🚍</title>
<link rel="stylesheet" href="../CSS/Bus_Name_Search.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500;900&family=Jua&family=Nanum+Gothic&family=Noto+Sans+KR&family=Noto+Serif+KR:wght@200&family=Song+Myung&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
</head>
<body onload="showClock()">
	<div id="wrap">
		<div id="title">
			<!-- 검색후 보여질 부분 -->
			<!-- 검색후 숨겨질 부분 -->
			<div id="Search">
				<input type="text" Placeholder="버스명을 입력해주세요." id="Bus">
			</div>
			<!-- 검색후 보여질 부분 -->
			<div id="information" hidden>
				<ol>
					<li id="num"><strong>매월06</strong></li>
					<li>첨단종점 ↔ 한국에너지공과대학</li>
					<li>첫차 05:40 막차 22:20</li>
					<li>배차간격 : 15분</li>
				</ol>
			</div>
			<div id="divClock">
				<!-- 현재시간을 표시해줌 -->
			</div>
		</div>


		<div id="stationBox">
			<div id="firstShow" class='Ashow'>
				<a href=""><div id="Show" class="stationList" hidden>가려져랏</div></a>
			</div>
		</div>

	</div>

	<script src="../JS/Bus_Name_Search.js"></script>
</body>

</html>