<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>🦼Bus_Search_Result🦼</title>
<link rel="stylesheet" href="../CSS/Bus_Name_Search_Result.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
</head>


<body>
	<div id="title" style="width: 450px">
		<div id="top_side"></div>
		<div id="information">
			<ol>
				<li id="num"><strong> 매월 6 </strong></li>
				<li>첨단종점 ↔ 한국에너지공과대학</li>
				<li>첫차 05:40 막차 22:20</li>
				<li>배차간격 : 15분</li>
			</ol>
		</div>
	</div>
	<div id="stop_sign">
		<div class="station">정류장1</div>
	</div>
	</div>


	<script>
		$(document).ready(
				function() {
					var page = 2; // 다음으로 로드할 페이지 번호
					var isLoading = false; // 데이터를 로드 중인지 여부

					// 스크롤 이벤트 처리
					$(window).scroll(
							function() {
								// 만약 이미 데이터를 로드 중이라면 추가적으로 데이터를 로드하지 않도록 합니다.
								if (isLoading)
									return;

								// 현재 스크롤 위치와 전체 문서의 높이 계산
								var scrollHeight = $(window).scrollTop()
										+ $(window).height();
								var documentHeight = $(document).height();

								// 스크롤이 페이지 하단에 도달했을 경우 새로운 데이터를 로드합니다.
								if (scrollHeight >= documentHeight) {
									isLoading = true;
									loadMoreContent();
								}
							});

					function loadMoreContent() {
						// 데이터를 로드하는 비동기 처리 (예시로 setTimeout을 사용)
						// 실제로는 AJAX 또는 다른 비동기 요청을 사용하여 서버에서 데이터를 가져와야 합니다.
						setTimeout(function() {
							// 새로운 콘텐츠를 동적으로 생성하고 리스트에 추가합니다.
							const station = $(".station");
							for (var i = 1; i <= 50; i++) {
								const newItem = `<div class="station">`
										+ (page * 1 + i) + "</div>";
								station.after(newItem);
							}

							// 페이지 번호를 증가시키고 데이터 로딩 상태를 초기화합니다.
							page++;
							isLoading = false;
						}, 1000); // 적절한 시간 간격을 설정해야 합니다. AJAX 요청을 사용한다면 이 부분은 요청이 완료되었을 때 호출해야 합니다.
					}
				});
	</script>
</body>

</html>