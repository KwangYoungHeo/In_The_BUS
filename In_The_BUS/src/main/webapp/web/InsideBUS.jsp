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
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	/* 세로 100% */
	font-size: 100%;
}

div#total {
	width: 430px;
	/* 가로 400px */
	height: 100%;
	/* 세로 100% */
	/* border: 1px solid #ccc; */
	/* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	/* background-color: black; */
}

div#head {
	width: 430px;
	height: 4%;
	background-color: rgb(170, 230, 230);
	display: flex;
	/* text-align: center; */
	justify-content: center;
	align-items: center;
}

div#title {
	width: 430px;
	height: 15%;
	background-color: whitesmoke;
}

div#title>#star {
	width: 20px;
	height: 20px;
}

div#title>h1 {
	display: inline;
}

div#info {
	width: 430px;
	height: 81%;
	background-color: rgb(228, 228, 228);
	font-size: 40px;
}
</style>
</head>
<body>

	<div id="total">

		<div id="head">
			<p id="headText">검색경로</p>
		</div>

		<div id="title">
			<br>
			<h1 id="busName">버스이름</h1>
			<img src="" id="star"> <br>
			<table>
				<tr>
					<td>1</td>
				</tr>
				<tr>
					<td>2</td>
				</tr>
				<tr>
					<td>3</td>
				</tr>
			</table>
		</div>

		<div id="info">
			<span id="payment">요금</span>
			<p id="time">소요시간</p>
			<p id="inside">현재혼잡도</p>
			<p id="arrive">도착정보</p>
			<button id="bookmark">즐겨찾기 저장</button>
		</div>

	</div>

	<script type="text/javascript">
		let headText = document.getElementById('headText');
		
		let busName = document.getElementById('busName');
		
		let payment = document.getElementById('payment');
		let time = document.getElementById('time');
		let inside = document.getElementById('inside');
		let arrive = document.getElementById('arrive');
		
		let bookmark = document.getElementById('bookmark');		
		
		function getQuery() {
			var url = document.location.href;
			var qs = url.substring(url.indexOf('?') + 1).split('&');
			for (var i = 0, result = {}; i < qs.length; i++) {
				qs[i] = qs[i].split('=');
				result[qs[i][0]] = decodeURIComponent(qs[i][1]);
			}
			console.log(result);
			if(result.start != null) {				
				// 길찾기를 통해 들어온 경우				
				busId = result.busId;
				stationId = result.StationId;			
				
				headText.textContent = result.start + "<->" + result.end;			
				busName.textContent = result.busNo;			
				payment.textContent = result.payment +"원";
				time.textContent = "소요시간 " + result.totalTime + "분";	
				
				arvInfo();
				
			}else if (result.arsID != null) {
				// 버스 정보 검색을 통해 들어온 경우				
				arsID = result.arsID;
				localStationID = result.localStationID;
				busSearchId = result.busID;
				
				headText.textContent = result.stationName;
				busName.textContent = result.busNo;				
				payment.setAttribute("hidden", true);
				time.setAttribute("hidden", true);
				
				arvInfo_busSearch();
			}
		}
		
	
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
		
		function arvInfo() {
			let stationInfo = "";
			var xhr = new XMLHttpRequest();
			var url = 'http://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=GJ2pksSJcZP6XjIAyya2svIBG72hRDlLknjfyt%2B5YtlHMb3OSTGcNw80%2BX3jDaQn0G7uFSnNtPCzRuwubgFy1g%3D%3D'; /*URL*/
			var queryParams = '&' + encodeURIComponent('pageNo') + '='
					+ encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '='
					+ encodeURIComponent('10'); /**/
			queryParams += '&' + encodeURIComponent('_type') + '='
					+ encodeURIComponent('json'); /**/
			queryParams += '&' + encodeURIComponent('cityCode') + '='
					+ encodeURIComponent('24'); /**/
			queryParams += '&' + encodeURIComponent('nodeId') + '='
					+ encodeURIComponent(stationId); /**/
			xhr.open('GET', url + queryParams);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					stationInfo = JSON.parse(this.responseText);
					console.log(stationInfo);
					console.log(stationInfo.response.body.items.item[0].arrtime);
					
					var arrTime = 0;
					console.log(busId);
					for(var x of stationInfo.response.body.items.item) {
						if(x.routeid == busId){
							arrTime = x.arrtime;
						}
					}
					arrive.textContent = "남은시간 " + arrTime + "초";
				}
			};

			xhr.send('');
			
		}
		
		function arvInfo_busSearch() {
			let stationInfo_busSearch = "";
			var xhr2 = new XMLHttpRequest();
			var url = 'http://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=GJ2pksSJcZP6XjIAyya2svIBG72hRDlLknjfyt%2B5YtlHMb3OSTGcNw80%2BX3jDaQn0G7uFSnNtPCzRuwubgFy1g%3D%3D'; /*URL*/
			var queryParams = '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
			queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json'); /**/
			queryParams += '&' + encodeURIComponent('cityCode') + '=' + encodeURIComponent('24'); /**/
			queryParams += '&' + encodeURIComponent('nodeId') + '=' + encodeURIComponent(localStationID); /**/
			queryParams += '&' + encodeURIComponent('routeId') + '=' + encodeURIComponent(busSearchId); /**/
			xhr2.open('GET', url + queryParams);
			xhr2.onreadystatechange = function () {
			    if (this.readyState == 4) {
			    	stationInfo_busSearch = JSON.parse(this.responseText);
			    	console.log(stationInfo_busSearch);
					
					var arrTime = 0;
					console.log(busSearchId);
					for(var x of stationInfo_busSearch.response.body.items.item) {
						if(x.routeid == busSearchId){
							arrTime = x.arrtime;
						}
					}

					arrive.textContent = "남은시간 " + arrTime + "초";
			    }
			};

			xhr2.send('');
		}
		
		getQuery();
		
		
	</script>


</body>
</html>