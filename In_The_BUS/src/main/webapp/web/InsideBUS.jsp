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

	<h1 id="busName"></h1>
	<div>
		<span id="start">출발지</span> <span id="end">도착지</span> <span id="busNo">노선</span>
		<span id="payment">요금</span> <span id="time">소요시간</span>
	</div>

	<button id="bookmark">즐겨찾기 저장</button>

	<script type="text/javascript">
		let start = document.getElementById('start');
		let end = document.getElementById('end');
		let busNo = document.getElementById('busNo');
		let payment = document.getElementById('payment');
		let time = document.getElementById('time');
		let bookmark = document.getElementById('bookmark');
	
		function getQuery() {
			var url = document.location.href;
			var qs = url.substring(url.indexOf('?') + 1).split('&');
			for (var i = 0, result = {}; i < qs.length; i++) {
				qs[i] = qs[i].split('=');
				result[qs[i][0]] = decodeURIComponent(qs[i][1]);
			}
			start.textContent = result.start;
			end.textContent = result.end;
			busNo.textContent = result.busNo;
			payment.textContent = result.payment;
			time.textContent = result.totalTime;
			return result;
		}
		
		getQuery();
		
		const info = sessionStorage.getItem("info");
		console.log(info);
		
		let bus_bookmark = () => {
			$.ajax({
    	 		/* 어디로 보낼건지? */
    	 		url : "../TestBookmarkCon",
    			/* 어떤 데이터를 보낼 것인지? */
    			data : {
    				id : 'sslgo15@naver.com',
    				bus_id : 'KJB3',
    				station_id : 'KJB886',
    				bus_name : '매월06'
    			}
    		}) 			
		}
		
		bookmark.addEventListener("click", bus_bookmark);
	</script>
</body>
</html>