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
<link rel="stylesheet" href="../CSS/Main.css">
</head>
<body>
	<div id="head">
		<div id="loghead">
			<a href="./IntheBusMain.jsp"> <img src="../img/로고.png" alt="" id="log"></a>
			<div id="title">
				<h1 id="title" onclick="location.reload()">In The Bus</h1>
			</div>
			<div id="menu-trigger">
				<span class="menu"></span> <span class="menu"></span> 
				<span class="menu"></span>
			</div>

		</div>
		
		<div id="trigger" hidden>
			<div id="user">
				<h1 id="profile" onclick="">로그인 해주세요</h1>
				<hr>
			</div>
			<div id="favorites">
				<h1 id="edit" onclick="">즐겨찾기</h1>
			</div>
			<div id="regional">
				<h1 id="settings" onclick="">지역설정</h1>
			</div>
			<div id="setting">
				<h1 id="setting" onclick="">설정</h1>
			</div>
			<img src="../img/닫는버튼.png" alt="" id="close">
		</div>
		
		<div class="slider__img">
			<div class="slider__inner">
				<div class="slider">
					<img
						src="https://i0.wp.com/wpsites.net/wp-content/uploads/2013/09/500x150.png?w=500&ssl=1"
						alt="이미지1">
				</div>
				<div class="slider">
					<img
						src="https://i0.wp.com/wpsites.net/wp-content/uploads/2013/09/500x150.png?w=500&ssl=1"
						alt="이미지2">
				</div>
				<div class="slider">
					<img
						src="https://i0.wp.com/wpsites.net/wp-content/uploads/2013/09/500x150.png?w=500&ssl=1"
						alt="이미지3">
				</div>
			</div>
		</div>

		<div id="routes" onclick="location.href='KeywordSearch.jsp'">
			<h1 id="routes">길찾기</h1>
		</div>
		
		<div id="station" onclick="location.href='BusNameSearch.jsp'">
			<h1 id="station">버스</h1>
		</div>
		
		<div class="firstBookmark bookmark" onclick="addBookmark()"></div>
	</div>

	<script src="../JS/Main_silder.js"></script>
	<script src="../JS/Main_hamburger.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#routes").mouseenter(function() {
				$(this).css('background-color', '#E6E6E6');
			});

			$("#routes").mouseleave(function() {
				$(this).css('background-color', 'white');
			});
			
			$("#station").mouseenter(function() {
				$(this).css('background-color', '#E6E6E6');
			});
			
			$("#station").mouseleave(function() {
				$(this).css('background-color', 'white');
			});
		});
		
		let addBookmark = () => {
			$(".firstBookmark").after("<div class='bookmark'></div>")
		};
	</script>
</body>
</html>