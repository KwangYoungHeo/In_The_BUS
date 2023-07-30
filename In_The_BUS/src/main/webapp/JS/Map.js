// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 키워드 검색 시스템
let start = document.getElementById('Starting');
let end = document.getElementById('Destingation');
let searchShow = document.getElementById('searchShow')
let searchShowPar = document.getElementById('searchShowPar');
let mapShow = document.getElementById('map');


let btn_route = "";

let start_place_x = "";
let start_place_y = "";
let end_place_x = "";
let end_place_y = "";

let start_place = (e) => {
	if (e.key === "Enter") {
		searchShowPar.setAttribute('hidden', true);
		mapShow.removeAttribute('hidden');
		let start_place = start.value;
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(start_place, placesSearchCB);
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				// console.log(data); 키워드 검색 결과가 담긴 변수
				start_place_x = data[0].x;
				start_place_y = data[0].y;
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();
				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}
				bounds.ha = Number(start_place_x);
				bounds.oa = Number(start_place_x);
				bounds.pa = Number(start_place_y);
				bounds.qa = Number(start_place_y);
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;" id="start_info"> <h1>' + place.place_name +
					'</h1> <button id="info_startSearch"> 출발 </button></div>');
				infowindow.open(map, marker);
			});
		}
	}
}

let end_place = (e) => {
	if (e.key === "Enter") {
		
		searchShowPar.setAttribute('hidden', true);
		mapShow.removeAttribute('hidden');
		
		let end_place = end.value;
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(end_place, placesSearchCB);

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				end_place_x = data[0].x;
				end_place_y = data[0].y;

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				bounds.ha = Number(end_place_x);
				bounds.oa = Number(end_place_x);
				bounds.pa = Number(end_place_y);
				bounds.qa = Number(end_place_y);

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}


		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="font-size:12px;" id="start_info"> <div> <h1 id="NewName">' + place.place_name +
					'</h1>  <button type="button" id="info_endSearch"> 도착 </button> </div> </div>');
				infowindow.open(map, marker);
				btn_route = document.getElementById('info_endSearch');
				btn_route.addEventListener("click", searchRoute);
			});
		}
	}

}

let resultArr = null;

let searchRoute = () => {
	let xhr = new XMLHttpRequest();
	let url = "https://api.odsay.com/v1/api/searchPubTransPathT?apiKey=bl1n7aNENQxrtjDL46c0hg&lang=0&SX=" + start_place_x + "&SY=" + start_place_y + "&EX=" + end_place_x + "&EY=" + end_place_y + "&OPT=0&SearchType=0&SearchPathType=0";
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);
			resultArr = resultObj["result"];
			console.log(resultArr);
			showRouteList(resultArr);
		}
	}
}

function arvInfo_busSearch(busID, startStationId, count) {
	let stationInfo_busSearch = "";
	var xhr = new XMLHttpRequest();
	var arrTime = 0;
	var url = 'http://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=GJ2pksSJcZP6XjIAyya2svIBG72hRDlLknjfyt%2B5YtlHMb3OSTGcNw80%2BX3jDaQn0G7uFSnNtPCzRuwubgFy1g%3D%3D'; /*URL*/
	var queryParams = '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
	queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json'); /**/
	queryParams += '&' + encodeURIComponent('cityCode') + '=' + encodeURIComponent('24'); /**/
	queryParams += '&' + encodeURIComponent('nodeId') + '=' + encodeURIComponent(startStationId); /**/
	queryParams += '&' + encodeURIComponent('routeId') + '=' + encodeURIComponent(busID); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function() {
		if (this.readyState == 4) {
			stationInfo_busSearch = JSON.parse(this.responseText);
			for (var i = 0; i < stationInfo_busSearch.response.body.items.item.length; i++) {
				if (stationInfo_busSearch.response.body.items.item[i].routeid == busID) {
					arrTime = stationInfo_busSearch.response.body.items.item[i].arrtime;
				}
			}
			console.log(stationInfo_busSearch);
			$('.setmin' + (count + 1)).text(Math.floor(arrTime / 60) + '분 ' + (arrTime % 60) + '초 후 도착');
		}
	};
	xhr.send('');
}

start.addEventListener("keydown", start_place);
end.addEventListener("keydown", end_place);

var bus_start = "";
var bus_end = "";
var busNo = "";
var payment = "";
var totalTime = "";
var busID = "";
var startStationId = "";

function showRouteList(resultArr) {
	for (var i = 0, j = 1; i < resultArr.path.length; i++, j++) {
		bus_start = resultArr.path[i].info.firstStartStation;
		bus_end = resultArr.path[i].info.lastEndStation;
		busNo = resultArr.path[i].subPath[1].lane[0].busNo;
		payment = resultArr.path[i].info.payment;
		totalTime = resultArr.path[i].info.totalTime;
		busID = resultArr.path[i].subPath[1].lane[0].busLocalBlID;
		startStationId = resultArr.path[i].subPath[1].startLocalStationID;
		arsID = resultArr.path[i].subPath[1].startArsID;
		if(i == 0) {
			var url = "../web/BUS_Inside.jsp?start=" + bus_start + "&end=" + bus_end + "&busNo=" + busNo + "&payment=" + payment + "&totalTime=" + totalTime + "&busId=" + busID + "&StationId=" + startStationId + "&arsID=" + arsID
			$('#firstShow').attr("href", url);			
		}
		$('#searchShow').after("<a href='../web/BUS_Inside.jsp?start=" + bus_start + "&end=" + bus_end + "&busNo=" + busNo + "&payment=" + payment + "&totalTime=" + totalTime + "&busId=" + busID + "&StationId=" + startStationId+ "&arsID=" + arsID + "'><div class='searchShowChild'> <ul> <li>	<div class='titleclickArea'> <span class='time time" + j + "'>소요시간</span> <br> <span class='payment" + j + "'>요금 </span> <br> </div> <div class='firstVisible'> <div class='subwaystation'> <span class='name" + j + "' data-id='name'>출발 정류장</span><br> <span class='busNo" + j + "'>노선명</span> <span class='setmin setmin" + j + "'> 도착정보 </span><br> <span class='stationName" + j + "'>도착 정정류장</span> <br> </div> </div> </li> </ul> </div></a>");
		$('.time' + (i + 1)).text('소요시간 : ' + totalTime + '분');
		$('.payment' + (i + 1)).text('요금 : ' + payment + '원');
		$('.name' + (i + 1)).text('출발지 : ' + bus_start);
		$('.busNo' + (i + 1)).text('ㅣ  ' + busNo + '번');
		$('.stationName' + (i + 1)).text('도착지 : ' + bus_end);
		arvInfo_busSearch(busID, startStationId, i);
	}
	searchShowPar.removeAttribute('hidden');
	mapShow.setAttribute('hidden', true);
}

function reset() {
	$('#Starting').val("");
	$('#Destingation').val("");
	searchShowPar.setAttribute('hidden', true);
	mapShow.removeAttribute('hidden');
}

function swap() {
	var change = $('#Starting').val();
	$('#Starting').val($('#Destingation').val());
	$('#Destingation').val(change);
}


function moveInside() {
	window.location.assign("../web/BUS_Inside.jsp?start=" + bus_start + "&end=" + bus_end + "&busNo=" + busNo + "&payment=" + payment + "&totalTime=" + totalTime + "&busId=" + busID + "&StationId=" + startStationId);
}