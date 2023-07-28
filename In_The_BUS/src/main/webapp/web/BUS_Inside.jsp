<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
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
					<td>광주</td>
				</tr>
				<tr>
					<td>05:40 ~ 22:50</td>
				</tr>
				<tr>
					<td>배차간격 : 15분</td>
				</tr>
			</table>
		</div>

		<hr>

		<div id="info">
			<span id="payment">요금</span>
			<p id="time">소요시간</p>
			<span id="inside">현재 혼잡도</span>
			<svg version="1.1" id="svg2"
				xmlns:dc="http://purl.org/dc/elements/1.1/"
				xmlns:cc="http://creativecommons.org/ns#"
				xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
				xmlns:svg="http://www.w3.org/2000/svg"
				xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
				xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
				sodipodi:docname="person.svg" inkscape:version="0.48.4 r9939"
				xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1200 1200"
				enable-background="new 0 0 1200 1200" xml:space="preserve"
				fill="#000000" stroke="#000000" width="50" height="50"
				style="position: absolute;">
        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
        <g id="SVGRepo_tracerCarrier" stroke-linecap="round"
					stroke-linejoin="round"></g>
        <g id="SVGRepo_iconCarrier">
            <path fill="#231F20"
					d="M719.57,272.035c18.461,0,35.451,3.565,50.975,10.698 c46.078,23.193,73.285,67.272,73.631,116.424V737.73c-8.643,53.824-70.25,39.188-71.742,0V418.037 c-5.49-18.231-40.693-10.672-41.535,0v733.785c-8.951,74.928-105.773,52.934-108.242-1.258c0-149.778,0-299.558,0-449.334 c-6.191-28.982-46.936-15.813-47.829,1.259c1.728,149.353,1.259,298.715,1.259,448.075c-9.656,74.543-106.007,55.47-108.243,1.258 l-1.258-733.785c-5.643-17.838-38.263-10.996-39.019,0V737.73c-8.644,53.824-70.25,39.188-71.742,0V399.157 c0.871-47.056,18.117-94.197,59.156-116.424c13.426-7.133,29.788-10.699,49.087-10.699 C549.235,272.035,634.402,272.035,719.57,272.035L719.57,272.035z M718.301,118.277c0,65.323-52.955,118.278-118.278,118.278 c-65.322,0-118.277-52.955-118.277-118.278C481.745,52.955,534.7,0,600.021,0C665.346,0,718.301,52.955,718.301,118.277z">
            </path>
        </g>
        <mask id="human_mask">
            <rect width="100%" height="100%" fill="black" />
            <path fill="white"
					d="M719.57,272.035c18.461,0,35.451,3.565,50.975,10.698 c46.078,23.193,73.285,67.272,73.631,116.424V737.73c-8.643,53.824-70.25,39.188-71.742,0V418.037 c-5.49-18.231-40.693-10.672-41.535,0v733.785c-8.951,74.928-105.773,52.934-108.242-1.258c0-149.778,0-299.558,0-449.334 c-6.191-28.982-46.936-15.813-47.829,1.259c1.728,149.353,1.259,298.715,1.259,448.075c-9.656,74.543-106.007,55.47-108.243,1.258 l-1.258-733.785c-5.643-17.838-38.263-10.996-39.019,0V737.73c-8.644,53.824-70.25,39.188-71.742,0V399.157 c0.871-47.056,18.117-94.197,59.156-116.424c13.426-7.133,29.788-10.699,49.087-10.699 C549.235,272.035,634.402,272.035,719.57,272.035L719.57,272.035z M718.301,118.277c0,65.323-52.955,118.278-118.278,118.278 c-65.322,0-118.277-52.955-118.277-118.278C481.745,52.955,534.7,0,600.021,0C665.346,0,718.301,52.955,718.301,118.277z">
            </path>
        </mask>
        <rect id="human" width="100%" height="100%" y="0%" fill="#f5cd00"
					mask="url(#human_mask)" />
    </svg>
			<p id="arrive">도착정보</p>
		</div>
	</div>

	<script src="../JS/Bus_Inside.js"></script>
</body>
</html>