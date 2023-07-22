<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/IntheBusMain.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</head>
<body>
	<div id="head">
		<div id="loghead">
			<a href="#"> <img src="../img/로고.png" alt="" id="log"></a>
			<div id="title">
				<h1 id="title">In The Bus</h1>
			</div>
			<div id="menu-trigger">
				<span class="menu"></span> <span class="menu"></span> <span
					class="menu"></span>
			</div>

		</div>
		<div id="trigger" hidden>
			<div id="user">
				<h1 id="profile" onclick="">사용자 프로필</h1>
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
					<img src="https://i0.wp.com/wpsites.net/wp-content/uploads/2013/09/500x150.png?w=500&ssl=1" alt="이미지1">
				</div>
				<div class="slider">
					<img src="https://i0.wp.com/wpsites.net/wp-content/uploads/2013/09/500x150.png?w=500&ssl=1" alt="이미지2">
				</div>
				<div class="slider">
					<img src="https://i0.wp.com/wpsites.net/wp-content/uploads/2013/09/500x150.png?w=500&ssl=1" alt="이미지3">
				</div>
			</div>
		</div>


		<div id="routes">
			<h1 id="routes" onclick="">길찾기</h1>
		</div>
		<div id="station">				
			<h1 id="station" onclick="">정류장</h1>
		</div>
		<div class="bookmark" hidden></div>
	</div>

	<script>
    const sliderImg = document.querySelector(".slider__img");           // 보여지는 영역
    const sliderInner = document.querySelector(".slider__inner");       // 움직이는 영역
    const slider = document.querySelectorAll(".slider");                // 개별 이미지

    let currrentInedex = 0;                                             // 현재 이미지
    let sliderCount = slider.length;                                    // 이미지 갯수
    let sliderWidth = sliderImg.offsetWidth;                            // 이미지 넓이값 구하기
    let sliderClone = sliderInner.firstElementChild.cloneNode(true);    // 첫번째 이미지를 복사
    sliderInner.appendChild(sliderClone);                               // 첫번째 이미지를 마지막에 넣음    

    function sliderEffect() {
      currrentInedex++;
      sliderInner.style.transition = "all 0.6s";
      sliderInner.style.transform = "translateX(-" + sliderWidth * currrentInedex + "px)";

      // sliderInner.style.transform = "translateX(-800px)";   800*1
      // sliderInner.style.transform = "translateX(-1600px)"; 800*2
      // sliderInner.style.transform = "translateX(-2400px)"; 800*3
      // sliderInner.style.transform = "translateX(-3200px)"; 800*4
      // sliderInner.style.transform = "translateX(-4000px)"; 800*5
      // sliderInner.style.transform = "translateX(-4800px)"; 800*6

      // 마지막사진(6번째_1번이미지)에 위치했을 때
      if (currrentInedex == sliderCount) {
        setTimeout(() => {
          sliderInner.style.transition = "0s";                //애니메이션 안줌
          sliderInner.style.transform = "translateX(0px)";    //0px로 초기화
        }, 700);

        currrentInedex = 0;
      }
    }
    setInterval(sliderEffect, 2000);
  </script>

	<script>
    const trigger = document.getElementById('trigger')
    const menu_trigger = document.getElementById('menu-trigger')

    menu_trigger.addEventListener('click',function(){
      trigger.removeAttribute('hidden')
      trigger.classList.toggle('active');
    })
  </script>

	<script>
    const closed = document.getElementById('close')
    
    closed.addEventListener('click',function(){
      trigger.setAttribute('hidden', 'true')
      trigger.classList.toggle('active');
    })
  </script>
</body>
</html>