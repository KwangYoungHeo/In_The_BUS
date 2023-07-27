<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../CSS/Bus_Inside.css">

<style type="text/css">
#star {
	color: whitesmoke;
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
			<svg width="25" height="25" version="1.0" id="Layer_1"
				xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 64 64"
				enable-background="new 0 0 64 64" xml:space="preserve"
				fill="#000000">
       			<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
        		<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
						stroke-linejoin="round"></g>
        		<g id="SVGRepo_iconCarrier">
            		<path fill="#c2c2c2ee"
							d="M62.799,23.737c-0.47-1.399-1.681-2.419-3.139-2.642l-16.969-2.593L35.069,2.265 C34.419,0.881,33.03,0,31.504,0c-1.527,0-2.915,0.881-3.565,2.265l-7.623,16.238L3.347,21.096c-1.458,0.223-2.669,1.242-3.138,2.642 c-0.469,1.4-0.115,2.942,0.916,4l12.392,12.707l-2.935,17.977c-0.242,1.488,0.389,2.984,1.62,3.854 c1.23,0.87,2.854,0.958,4.177,0.228l15.126-8.365l15.126,8.365c0.597,0.33,1.254,0.492,1.908,0.492c0.796,0,1.592-0.242,2.269-0.72 c1.231-0.869,1.861-2.365,1.619-3.854l-2.935-17.977l12.393-12.707C62.914,26.68,63.268,25.138,62.799,23.737z">
            		</path>
            	</g>
        		<mask id="star_mask">
           			<rect width="100%" height="100%" fill="black" />
            		<path fill="white"
						d="M62.799,23.737c-0.47-1.399-1.681-2.419-3.139-2.642l-16.969-2.593L35.069,2.265 C34.419,0.881,33.03,0,31.504,0c-1.527,0-2.915,0.881-3.565,2.265l-7.623,16.238L3.347,21.096c-1.458,0.223-2.669,1.242-3.138,2.642 c-0.469,1.4-0.115,2.942,0.916,4l12.392,12.707l-2.935,17.977c-0.242,1.488,0.389,2.984,1.62,3.854 c1.23,0.87,2.854,0.958,4.177,0.228l15.126-8.365l15.126,8.365c0.597,0.33,1.254,0.492,1.908,0.492c0.796,0,1.592-0.242,2.269-0.72 c1.231-0.869,1.861-2.365,1.619-3.854l-2.935-17.977l12.393-12.707C62.914,26.68,63.268,25.138,62.799,23.737z">
            		</path>
        		</mask>
        		<rect id="star" width="100%" height="0%" y="0%" fill="#f5cd00"
					mask="url(#star_mask)" />
    		</svg>
			<br>
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
		</div>
	</div>

	<script src="../JS/Bus_Inside.js"></script>
</body>
</html>