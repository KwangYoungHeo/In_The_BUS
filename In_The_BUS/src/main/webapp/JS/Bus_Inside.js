let headText = document.getElementById('headText');

let busName = document.getElementById('busName');

let payment = document.getElementById('payment');
let time = document.getElementById('time');
let inside = document.getElementById('inside');
let arrive = document.getElementById('arrive');

let result = {};

function getQuery() {
	var url = document.location.href;
	var qs = url.substring(url.indexOf('?') + 1).split('&');
	for (var i = 0; i < qs.length; i++) {
		qs[i] = qs[i].split('=');
		result[qs[i][0]] = decodeURIComponent(qs[i][1]);
	}
	console.log(result);

	if (result.start != null) {
		// 길찾기를 통해 들어온 경우				
		busID = result.busId;
		StationID = result.StationId;
		busNo = result.busNo;


		headText.textContent = result.start + "<->" + result.end;
		busName.textContent = result.busNo;
		payment.textContent = result.payment + "원";
		time.textContent = "소요시간 " + result.totalTime + "분";

		arvInfo();

	} else if (result.arsID != null) {
		// 버스 정보 검색을 통해 들어온 경우				
		arsID = result.arsID;
		StationID = result.localStationID;
		busID = result.busID;
		busNo = result.busNo;

		headText.textContent = result.stationName;
		busName.textContent = result.busNo;
		payment.setAttribute("hidden", true);
		time.setAttribute("hidden", true);

		arvInfo_busSearch();
	}
}

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
		+ encodeURIComponent(StationID); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			stationInfo = JSON.parse(this.responseText);

			var arrTime = 0;

			for (var x of stationInfo.response.body.items.item) {
				if (x.routeid == busID) {
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
	queryParams += '&' + encodeURIComponent('nodeId') + '=' + encodeURIComponent(StationID); /**/
	queryParams += '&' + encodeURIComponent('routeId') + '=' + encodeURIComponent(busID); /**/
	xhr2.open('GET', url + queryParams);
	xhr2.onreadystatechange = function() {
		if (this.readyState == 4) {
			stationInfo_busSearch = JSON.parse(this.responseText);
			console.log(stationInfo_busSearch);
			var arrTime = 0;
			for (var x of stationInfo_busSearch.response.body.items.item) {
				if (x.routeid == busID) {
					arrTime = x.arrtime;
				}
			}

			arrive.textContent = "남은시간 " + arrTime + "초";
		}
	};

	xhr2.send('');
}

getQuery();

$(document).ready(function() {
	$.ajax({
		url: "../TestBookmarkDuplicationCheckCon",
		data: {
			id: jsonData.id,
			bus_id: busID,
			station_id: StationID,
			bus_name: busNo
		},
		dataType: "json",
		success: function(result) {
			if (result) {
				$("#star").attr('height', '100%');
			}
		},
		error: function(e) {
			console.log(e);
		}
	});

	$("svg").click(function() {
		if ($('#star').attr('height') == '0%') {
			// 즐겨찾기 추가
			$.ajax({
				url: "../TestBookmarkCon",
				data: {
					id: jsonData.id,
					bus_id: busID,
					station_id: StationID,
					bus_name: busNo
				},
				dataType: "json",

				success: function(result) {
					if (result <= 0) {
						// alert("result null");
					} else {
						// alert("result 값 존재");
						$("#star").attr('height', '100%');
					}
				},
				/* 실패 시 */
				error: function(e) {
					alert('이미 추가된 버스입니다.');
					console.log(e);
				}
			});
		} else {
			// 즐겨찾기 삭제
			$.ajax({
				url: "../TestBookmarkDeleteCon",
				data: {
					id: jsonData.id,
					bus_id: busID,
					station_id: StationID
				},
				dataType: "json",
				success: function(result) {
					if (result <= 0) {
						// alert("result null");
					} else {
						// alert("result 존재");
						$("#star").attr('height', '0%');
					}
				},
				error: function(e) {
					alert('삭제에 실패했습니다.');
					console.log(e);
				}
			});
		}
	});
});

function getCookieValue(cookieName) {
	var name = cookieName + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var cookieArray = decodedCookie.split(';');
	for (var i = 0; i < cookieArray.length; i++) {
		var cookie = cookieArray[i].trim();
		if (cookie.indexOf(name) === 0) {
			return cookie.substring(name.length, cookie.length);
		}
	}
	return null; // 해당 쿠키가 없는 경우
}

var jsonData = getCookieValue("jsonData");
if (jsonData) {
	jsonData = JSON.parse(decodeURIComponent(jsonData));
	console.log(jsonData);
	// 여기에서 jsonData를 원하는 방식으로 사용합니다.
} else {
	console.log("쿠키에 JSON 데이터가 저장되어 있지 않습니다.");
}
