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
	<div>
		출발지 <input type="text" id="start">
		<button id="start_search">출발지 검색</button>
		<br> <br> 도착지 <input type="text" id="end">
		<button id="end_search">도착지 검색</button>
		<br> <br>
		<button id="route_search">경로 검색</button>

	</div>

	<div id="map" style="width: 100%; height: 350px;"></div>

	<table id="showRouteList" border=1>
		<tr>
			<td>번호</td>
			<td>출발지</td>
			<td>도착지</td>
			<td>이용노선</td>
			<td>요금</td>
			<td>소요시간</td>
		</tr>
	</table>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc74d2eaa158f56dc0ca061964ab3cdb&libraries=services"></script>
	<script>
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

        
        
        
        
        // 키워드 검색 시스템 테스트

        let start = document.getElementById('start');
        let end = document.getElementById('end');
        let btn_start = document.getElementById('start_search');
        let btn_end = document.getElementById('end_search');
        let btn_route = document.getElementById('route_search');

        let start_place_x = "";
        let start_place_y = "";
        let end_place_x = "";
        let end_place_y = "";

        let start_place = () => {
            let start_place = start.value;
            // 키워드로 장소를 검색합니다
            ps.keywordSearch(start_place, placesSearchCB);

            // 키워드 검색 완료 시 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    console.log(data); // 키워드 검색 결과가 담긴 변수
                    console.log(data[0].x); // 경도
                    console.log(data[0].y); // 위도

                    start_place_x = data[0].x;
                    start_place_y = data[0].y;

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    var bounds = new kakao.maps.LatLngBounds();

                    for (var i = 0; i < data.length; i++) {
                        displayMarker(data[i]);
                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                    }

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
                kakao.maps.event.addListener(marker, 'click', function () {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                    infowindow.open(map, marker);
                });
            }
        }

        let end_place = () => {
            let end_place = end.value;
            // 키워드로 장소를 검색합니다
            ps.keywordSearch(end_place, placesSearchCB);

            // 키워드 검색 완료 시 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    console.log(data); // 키워드 검색 결과가 담긴 변수
                    console.log(data[0].x); // 경도
                    console.log(data[0].y); // 위도


                    end_place_x = data[0].x;
                    end_place_y = data[0].y;

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    var bounds = new kakao.maps.LatLngBounds();

                    for (var i = 0; i < data.length; i++) {
                        displayMarker(data[i]);
                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                    }

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
                kakao.maps.event.addListener(marker, 'click', function () {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                    infowindow.open(map, marker);
                });
            }
        }
        
		let resultArr = null;
        let searchRoute = () => {
            let xhr = new XMLHttpRequest();
            let url = "https://api.odsay.com/v1/api/searchPubTransPathT?apiKey=bl1n7aNENQxrtjDL46c0hg&lang=0&SX=" + start_place_x + "&SY=" + start_place_y + "&EX=" + end_place_x + "&EY=" + end_place_y + "&OPT=0&SearchType=0&SearchPathType=0";
            xhr.open("GET", url, true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var resultObj = JSON.parse(xhr.responseText);
                    resultArr = resultObj["result"];
                    console.log(resultArr);
                    console.log(resultArr.path[0].info);
                    console.log("이용하는 버스는 "+resultArr.path[0].subPath[1].lane[0].busNo);
                    showRouteList(resultArr);
                }
            }
            
//            $.ajax({
//            	url : "",
//            	
//            	dataType : "json",
//           	
//            	/* 성공 시 */
//            	success : function(result){ 
//    				if(resultArr==null){
//    					alert("resultArr null")
//   				}else{
//    					alert("resultArr 값 존재")
//    					
//    				}
//    			},
 //   			
 //   			/* 실패 시 */
 //   			error : function(e){
  //  				alert('실패');
    //				console.log(e);
      //      	}
        //    
 //       })
		}

        btn_end.addEventListener("click", end_place);
        btn_start.addEventListener("click", start_place);
        btn_route.addEventListener("click", searchRoute);
		
        function showRouteList(resultArr){
        	for(var i=0; i<resultArr.path.length; i++){
        		var bus_start = resultArr.path[i].info.firstStartStation;
        		var bus_end = resultArr.path[i].info.lastEndStation;
        		var busNo = resultArr.path[i].subPath[1].lane[0].busNo;
        		var payment = resultArr.path[i].info.payment;
        		var totalTime = resultArr.path[i].info.totalTime;
        		var busId = resultArr.path[i].subPath[1].lane[0].busLocalBlID;
        		var startStationId = resultArr.path[i].subPath[1].startLocalStationID;        		
        		
        		$("#showRouteList").append("<tr> </tr>");
         	 	$("tr").last().append("<a href='./InsideBUS.jsp?start="+bus_start+"&end="+bus_end+"&busNo="+busNo+"&payment="+payment+"&totalTime="+totalTime+"&busId="+busId+"&StationId="+startStationId+"'><td>"+(i+1)+"</td></a>");
         	 	$("tr").last().append("<td>"+bus_start+"</td>");
         	 	$("tr").last().append("<td>"+bus_end+"</td>");
         	 	$("tr").last().append("<td>"+busNo+"</td>");
         	 	$("tr").last().append("<td>"+payment+"</td>");
         	 	$("tr").last().append("<td>"+totalTime+"</td>");
        	}
        }
    </script>
</body>
</html>