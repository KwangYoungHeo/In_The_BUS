<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛩region🛩</title>
    <link rel="stylesheet" href="../CSS/ReGion.css">
</head>
<body>
    <div id="head">
        <h2 class="accordion">서울</h2>
        <div class="panel">
        </div>
    
        <h2 class="accordion">인천</h2>
        <div class="panel">
        </div>
    
        <h2 class="accordion">경기</h2>
        <div class="panel">
        </div>

        <h2 class="accordion">청주</h2>
        <div class="panel">
        </div>
        <h2 class="accordion"> 전주</h2>
        <div class="panel">
        </div>

        <h2 class="accordion">대구</h2>
        <div class="panel">
        </div>

        <h2 class="accordion">대전</h2>
        <div class="panel">
        </div>

        <h2 class="accordion">광주</h2>
        <div class="panel"></div>

        <h2 class="accordion">부산</h2>
        <div class="panel">
        </div>

        <h2 class="accordion">울산</h2>
        <div class="panel">
        </div>

        <h2 class="accordion">창원</h2>
        <div class="panel">
        </div>

        <h2 class="accordion">제주</h2>
        <div class="panel">
        </div>
        <script>
            // JavaScript로 어코디언 동작 구현
            const accordions = document.querySelectorAll(".accordion");
    
            for (const accordion of accordions) {
                accordion.addEventListener("click", function () {
                    this.classList.toggle("active");
                    const panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
        </script>
    
</body>
</html>