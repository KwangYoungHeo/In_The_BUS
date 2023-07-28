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
    setInterval(sliderEffect, 2500);