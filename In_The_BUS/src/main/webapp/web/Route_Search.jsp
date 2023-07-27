<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 🚲Bus_Search🚲 </title>
  <link rel="stylesheet" href="../CSS/Route_Search.css">
</head>
<script type="text/javascript">
  function showClock() {
    var currentDate = new Date();
    var divClock = document.getElementById('divClock');
    var msg = `오늘 `
    if (currentDate.getHours() - 12 + "시 ") {
      msg += '오전';
      msg += currentDate.getHours() + '시 ';
    } else {
      msg += '오후';
      msg += currentDate.getHours() + '시 ';
    }

    msg += currentDate.getMinutes() + '분 ';

    divClock.innerText = msg;

    setTimeout(showClock, 1000); //1초마다 갱신
  }
</script>

<body onload="showClock()">
  <div id="head">
    <div id="top">
      <input type="text" id="Starting" Placeholder="출발지를 입력해주세요" onclick="">
      <input type="text" id="Destingation" Placeholder="도착지를 입력해주세요" onclick="">
      <img src="../img/Swap.png" alt="Swap" id="change" onclick="">
      <img src="../img/Reset.png" alt="Reset" id="reset" onclick="">
    </div>
    <div id="divClock"><!-- 현재시간을 표시해줌 --></div>
    <div id="searchShow" hidden>
      <ul>
        <li>
          <div class="titleclickArea">
            <span class="time">21분</span>
            <span class="alltime"> 오후 4:43 ~ 5:36</span> <br>
            <span class="walkTime">
              도보 10분 ㅣ 카드1,250원
            </span> <br>
          </div>
          <div class="firstVisible">
            <div class="subwaystation">
              <span class="name" data-id="name"> 국립 아시아 문화 전당(구,도청)1123 </span> <br>
              매월 06 <span class="setmin"> 15분후 도착 </span> <br>
              흑석사거리(동)정류장 <br>
              </span>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <p id="status"></p>
    <a id="map-link" target="_blank"></a>
    <div id="map" style="width:100%;height:83.5%;"></div>

    <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c67ff1ce3f889417b8b27bdfee0a898&libraries=services,clusterer,drawing"></script>
    <script src="./JS/Map.js"></script>
    <script>
      function geoFindMe() {
        const status = document.querySelector("#status");
        const mapLink = document.querySelector("#map-link");

        mapLink.href = "";
        mapLink.textContent = "";

        function success(position) {
          const latitude = position.coords.latitude;
          const longitude = position.coords.longitude;

          status.textContent = "";
          mapLink.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
          mapLink.textContent = `위도: ${latitude} °, 경도: ${longitude} °`;
        }

        function error() {
          status.textContent = "현재 위치를 가져올 수 없음";
        }

        if (!navigator.geolocation) {
          status.textContent = "브라우저가 위치 정보를 지원하지 않음";
        } else {
          status.textContent = "위치 파악 중…";
          navigator.geolocation.getCurrentPosition(success, error);
        }
      }

      document.querySelector("#Starting").addEventListener("click", geoFindMe);
    </script>
  </div>
</body>

</html>