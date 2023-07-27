<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>🚲Bus_Search🚲</title>
<link rel="stylesheet" href="../CSS/Route_Search.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
	function showClock() {
		var currentDate = new Date();
		var divClock = document.getElementById('divClock');
		var msg = `오늘 `
		if (currentDate.getHours() - 12 + "시 ") {
			msg += currentDate.getHours() + '시 ';
		} else {
			msg += currentDate.getHours() + '시 ';
		}

		msg += currentDate.getMinutes() + '분 ';

		divClock.innerText = msg;

		setTimeout(showClock, 1000); //1초마다 갱신
	}
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<body onload="showClock()">
	<div id="head">
		<div id="top">
			<input type="text" id="Starting" Placeholder="출발지를 입력해주세요" onclick="">
			<input type="text" id="Destingation" Placeholder="도착지를 입력해주세요"
				onclick=""> <img src="../img/Swap.png" alt="Swap"
				id="change" onclick="swap()"> <img src="../img/Reset.png"
				alt="Reset" id="reset" onclick="reset()">
		</div>
		<div id="divClock">
			<!-- 현재시간을 표시해줌 -->
		</div>
		<a href="" id="firstShow">
			<div id="searchShowPar" hidden>
				<div id="searchShow" class="searchShowChild">
					<ul>
						<li>
							<div class="titleclickArea">
								<span class="time time1">소요시간</span><br> <span
									class="payment1"> 요금 </span> <br>
							</div>
							<div class="firstVisible">
								<div class="subwaystation">
									<span class="name1" data-id="name">출발 정류장</span><br> <span
										class="busNo1">노선명</span> <span class="setmin setmin1">
										도착정보</span><br> <span class="stationName1">도착 정류장</span> <br>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</a>
		<p id="status"></p>
		<a id="map-link" target="_blank"></a>
		<div id="map" style="width: 100%; height: 83.5%;"></div>
	</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	9142efa60865fec179e97899ff351e55&libraries=services,clusterer,drawing"></script>
	<script src="../JS/Map.js"></script>
	<script>
		function geoFindMe() {
			const status = document.querySelector("#status");
			const mapLink = document.querySelector("#map-link");

			mapLink.href = "";
			mapLink.textContent = "";

			function success(position) {
				const latitude = position.coords.latitude; // 위도
				const longitude = position.coords.longitude; // 경도

				status.textContent = "";
				mapLink.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
			}

			function error() {
				alert("현재 위치를 가져올 수 없음");
			}

			if (!navigator.geolocation) {
				alert("브라우저가 위치 정보를 지원하지 않음");
			} else {
				alert("위치 파악 중…");
				navigator.geolocation.getCurrentPosition(success, error);
			}
		}

		// document.querySelector("#Starting").addEventListener("click", geoFindMe);
	</script>

</body>

</html>