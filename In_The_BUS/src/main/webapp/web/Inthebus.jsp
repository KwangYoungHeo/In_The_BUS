<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link type="text/css" rel="stylesheet" href="https://download.blog.naver.com/open/8c199027380706b39677192a13fd8cf15001ff81/WpycHtBAhSbCn0X-cwjLPXW406kCN8yvNSNJxQZMm1Ih4PRjifNuBxVtFmHC3WIzartq2VKN6QZghZJbdmLc2A/Main.css"> -->
<style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* 세로 100% */
    }

    .container {
      width: 550px; /* 가로 400px */
      height: 100%; /* 세로 100% */
      border: 1px solid #ccc;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 16px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    input[type="text"] {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      box-sizing: border-box;
    }

    button {
      padding: 8px 16px;
    }
  </style>
</head>
<body>
  <div class="container">
    <input type="text" placeholder="검색어를 입력하세요...">
    <button>검색</button>
    <!-- 출력창 또는 검색 결과를 표시할 요소를 추가할 수 있습니다. -->
  </div>
</body>
</html>