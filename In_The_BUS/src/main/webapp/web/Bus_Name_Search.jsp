<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 🚍Bus_Name_Search🚍 </title>
    <link rel="stylesheet" href="../CSS/Bus_Name_Search.css">
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
            <input type="text" value="버스 검색" id="Bus">
            <!-- <input type="button" value="검색" id="button"> -->
        </div>
        <div id="divClock"><!-- 현재시간을 표시해줌 --></div>
        <div id="Show" hidden>
            가려져랏    
        </div>
    </div>
</body>

</html>