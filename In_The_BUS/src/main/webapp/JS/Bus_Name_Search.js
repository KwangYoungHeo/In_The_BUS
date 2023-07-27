let input = document.getElementById('Bus');
let stationList = document.getElementsByClassName('stationList');

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

input.addEventListener('keydown', searchBusLaneAJAX);

function searchBusLaneAJAX(e) {
	if (e.key == 'Enter') {
		var bus = document.getElementById('Bus').value;
		var xhr = new XMLHttpRequest();
		var url = "https://api.odsay.com/v1/api/searchBusLane?apiKey=bl1n7aNENQxrtjDL46c0hg&CID=5000&busNo="
			+ bus;
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
						let busInfo = JSON.parse(xhr2.responseText).result;
						// 버스 상세 정보
						console.log(busInfo);
						showStation(busInfo);

					}
				};
			}
		};
	}
}

function showStation(busInfo) {
	$('#Show').text(busInfo.station[0].stationName);
	for (var i = 2; i < busInfo.station.length; i++) {
		var busNo = busInfo.busNo;
		var busID = busInfo.busLocalBlID;
		var arsID = busInfo.station[i].arsID;
		var localStationID = busInfo.station[i].localStationID;
		var stationName = busInfo.station[i].stationName;

		$('#Show').after("<div class='stationList'>" + stationName + " </div>");

	}
};