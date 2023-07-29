<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🚍In The Bus🚍</title>

<link rel="stylesheet" href="../CSS/Main.css">

<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
	integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
	crossorigin="anonymous"></script>
<script>
	Kakao.init('cc74d2eaa158f56dc0ca061964ab3cdb');
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<div id="head">
		<div id="loghead">
			<a href="./In_The_Bus_Main.jsp"> <img src="../img/Logo.png" alt=""
				id="log"></a>
			<div id="title">
				<br>
				<h1 id="title" onclick="location.reload()">In The Bus</h1>
			</div>
			<div id="menu-trigger">
				<span class="menu"></span> <span class="menu"></span> <span class="menu"></span>
			</div>

		</div>

		<div id="trigger" hidden>
			<div id="user">
				<!-- 로그인 링크 , 카카오 로그인 버튼 클릭시 링크 연결 만들기 -->
				<button id="Login">로그인</button>
				
				<div id=modal>
					<div id=modal-content>
						<a id="kakao-login-btn" href="javascript:kakaoLogin()"> <img
							src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
							width="222" alt="카카오 로그인 버튼" />
						</a>
						<button id="close-button" hidden>닫기</button>
					</div>
				</div>
				<div id="blur-background"></div>
				<hr>
			</div>
			<div id="favorites">
				<h1 id="edit" onclick="">즐겨찾기 편집</h1>
			</div>
			<div id="regional">
				<h1 id="settings" onclick="">지역설정</h1>
			</div>
			<button id="LogOut" hidden>로그아웃</button>
			<img src="../img/Close.png" alt="" id="close">
		</div>

		<div class="slider__img">
			<div class="slider__inner">
				<div class="slider">
					<img
						src="../img/station_main.png"
						alt="이미지1">
				</div>
				<div class="slider">
					<img
						src="../img/bus_1.png"
						alt="이미지2">
				</div>
				<div class="slider">
					<img
						src="../img/inside.png"
						alt="이미지3">
				</div>
			</div>
		</div>

		<div id="routes" onclick="location.href='Route_Search.jsp'">
			<h1 id="routes">길찾기</h1>
		</div>

		<div id="station" onclick="location.href='Bus_Name_Search.jsp'">
			<h1 id="station">버스</h1>
		</div>

		<div class="firstBookmark bookmark">
			<img alt="닫는중" src="../img/Close.png" id="close1" hidden>
		</div>
	</div>

	<script src="../JS/Main_silder.js"></script>
	<script src="../JS/Main_hamburger.js"></script>
	<script src="../JS/Main.js"></script>

</body>
</html>