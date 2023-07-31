<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>🛩region🛩</title>
<link rel="stylesheet" href="../CSS/ReGion.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="head">
		<h2 class="accordion">서울</h2>

		<h2 class="accordion">인천</h2>

		<h2 class="accordion">경기</h2>

		<h2 class="accordion">청주</h2>

		<h2 class="accordion">전주</h2>

		<h2 class="accordion">대구</h2>

		<h2 class="accordion">대전</h2>

		<h2 class="GwangJu">광주</h2>

		<h2 class="accordion">부산</h2>

		<h2 class="accordion">울산</h2>

		<h2 class="accordion">창원</h2>

		<h2 class="accordion">제주</h2>

		<script>
			$('.accordion').on('click', function () {
				alert("사용불가. 현재는 광주만 지원하고 있습니다.");
			});
			
			$('.GwangJu').on('click', function () {
				alert("설정되었습니다.");
			});
		</script>
</body>
</html>