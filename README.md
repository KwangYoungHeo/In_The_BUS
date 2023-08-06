# RTM
# 📎 In The BUS(팀명: RTM)
![](https://velog.velcdn.com/images/sslgo15/post/6a373468-3247-409d-a054-bf4ed674239f/image.png)



## 👀 서비스 소개
* 서비스명:  In The BUS 버스 내부 정보 예측 서비스
* 서비스설명: 시내버스의 내부 혼잡도를 탑승 전에 알 수 있는 스마트 버스 서비스
<br>

## 📅 프로젝트 기간
2023.06.09 ~ 2023.08.01 (7주)
<br>

## ⭐ 주요 기능
* 버스 정보 : 검색된 노선ID와 정류장ID로 해당 정류장에 도착하는 노선의 정보를 출력하는 창
  
![](https://velog.velcdn.com/images/sslgo15/post/69b05773-d9cd-4aa0-8d5c-09bcf4d2e761/image.png)

* 길찾기 : 키워드나 주소 검색을 통해 출발지와 도착지를 설정하고 이동할 수 있는 대중교통 리스트를 출력하는 창
원하는 경로 선택시 버스 정보 페이지로 이동함

![](https://velog.velcdn.com/images/sslgo15/post/1d007601-95af-4604-9e20-a8f28d92651f/image.png)

* 노선 검색 : 노선명 검색을 통해 원하는 노선을 검색하고 해당 노선이 경유하는 정류장 리스트를 출력하는 창
원하는 정류장 선택시 버스 정보 페이지로 이동함

![](https://velog.velcdn.com/images/sslgo15/post/b787c273-2654-4fca-be97-5917d86a6fce/image.png)

* 즐겨찾기 : 버스 정보 페이지에서 별 아이콘을 클릭하면 즐겨찾기로 등록되고 메인 페이지에서 보여짐
 
![](https://velog.velcdn.com/images/sslgo15/post/d772b7e8-e002-427b-bd42-4d44fbdd0a05/image.png)

<br>

## ⛏ 기술스택
<table>
    <tr>
        <th>구분</th>
        <th>내용</th>
    </tr>
    <tr>
        <td>사용언어</td>
        <td>
            <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/>
            <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
            <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
	    <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/> 
        </td>
    </tr>
    <tr>
        <td>라이브러리</td>
        <td>
            <img src="https://img.shields.io/badge/KakaoMap-FFCD00?style=for-the-badge&logo=Kakao&logoColor=white"/>
          <img src="https://img.shields.io/badge/KAKAOLOGIN-FFCD00?style=for-the-badge&logo=Kakao&logoColor=white" >
          <img src="https://img.shields.io/badge/ODsayLAB-E34F26?style=for-the-badge&logo=ODsay&logoColor=white" >
          <img src="https://img.shields.io/badge/TAGO-F80000?style=for-the-badge&logo=TAGO&logoColor=white" >
        </td>
    </tr>
    <tr>
        <td>개발도구</td>
        <td>
            <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/>
            <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>서버환경</td>
        <td>
            <img src="https://img.shields.io/badge/Apache Tomcat-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>데이터베이스</td>
        <td>
            <img src="https://img.shields.io/badge/Oracle 11g-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>협업도구</td>
        <td>
            <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/>
            <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>
        </td>
    </tr>
</table>


<br>

## ⚙ 시스템 아키텍처
![](https://velog.velcdn.com/images/sslgo15/post/480bbe0d-5768-41da-a30a-c37c96857935/image.jpg)

<br>

## 📌 SW유스케이스
![](https://velog.velcdn.com/images/sslgo15/post/2be2e8eb-0299-4b88-ba0f-1c52d93b94e3/image.png)

<br>

## 📌 서비스 흐름도
![](https://velog.velcdn.com/images/sslgo15/post/c028b52b-b3de-40d3-be89-b89271f08d40/image.png)
<br>

## 📌 ER다이어그램
![](https://velog.velcdn.com/images/sslgo15/post/017699d5-ad4d-442b-99db-141566b1ea20/image.png)
<br>

## 🖥 화면 구성

### 메인화면 : 즐겨찾기/로그인/지역설정/길찾기버튼/버스검색버튼
![](https://velog.velcdn.com/images/sslgo15/post/ddae6309-2678-448f-bff1-7a3e4570f3b2/image.png)
<br>

### 길찾기 : 출발지,도착지 검색/이동 경로 선택
![](https://velog.velcdn.com/images/sslgo15/post/63facba9-526a-4aca-b015-24f324653f25/image.png)
<br>

### 버스 검색 : 버스명 검색/정류장 선택
![](https://velog.velcdn.com/images/sslgo15/post/14ec8511-7e97-44e3-8bff-593a9bfa502c/image.png)
<br>

### 버스 내부 : 즐겨찾기/요금/소요시간/혼잡도/도착정보
![](https://velog.velcdn.com/images/sslgo15/post/455d39cd-e5bf-40df-9eaa-1f6f8a1b7f83/image.png)
<br>

## 👨‍👩‍👦‍👦 팀원 역할
<table>
  <tr>
    <td align="center"><img src="https://item.kakaocdn.net/do/9fc764ca0704ce3ebaba47c50f8b7e8ff43ad912ad8dd55b04db6a64cddaf76d" width="100" height="100"/></td>
    <td align="center"><img src="https://mblogthumb-phinf.pstatic.net/MjAxODAxMDdfMjk1/MDAxNTE1MzAzODc3NjE1.HqFU7w9BX14fzsPWXqTulN13TI584cLlazYu4Yuuohcg.vbUBogBP6YzkgsyGUS2tLGFNc-rSBG8NazX5oL_54k8g.GIF.jee6959/kakao7.gif?type=w800" width="100" height="100"/></td>
    <td align="center"><img src="https://img.ppomppu.co.kr/zboard/data3/comment/88/freeboard_57277188" width="100" height="100"/></td>
  </tr>
  <tr>
    <td align="center"><strong>허광영</strong></td>
    <td align="center"><strong>문필현</strong></td>
    <td align="center"><strong>김지희</strong></td>
  </tr>
  <tr>
    <td align="center"><b>PM,Back,Front,DB</b></td>
    <td align="center"><b>Frontend</b></td>
    <td align="center"><b>DB</b></td>
  </tr>
  <tr>
    <td aling="center">
      <ol>
      	<li>프로젝트 매니저
		<li>서비스 기능 전체 구현
		<li>즐겨찾기, 검색 결과 출력
		<li>DB설계 및 구축
		<li>버스 데이터 가공
		<li>혼잡도 예측 알고리즘 작성
      </ol>
	</td>
    <td aling="center">
   	<ol>
      	<li>프론트 페이지 구현
    </ol>
    </td>
    <td aling="center">
    <ol>
      <li>날씨 · 날짜 데이터 크롤링
      <li>DB구성, 데이터 가공
    </ol>
    </td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/HeoGwangYoung" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/자신의username작성해주세요" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/자신의username작성해주세요" target='_blank'>github</a></td>
  </tr>
</table>

## 🤾‍♂️ 트러블슈팅

  
* 즐겨찾기 정보가 실시간 반영 되지 않는 오류<br>
문제점 : 즐겨찾기정보가 변경되어도 메인 페이지에서 변경된 정보가 보이지 않거나 버스 정보 페이지에서 이미 등록된 노선도 아이콘에 표시되지 않는 오류가 있었음<br>
해결방안 : 이를 해결하기 위해 메인 페이지에 돌아올 시 자동 새로고침을 통해 반영되게 하였고 버스 정보 페이지는 접속시 중복 검사를 통해 아이콘에 정보를 반영하게 하였음
<br>

* 버스 데이터 가공 시 컬럼이 데이터가 추가되지 않는 오류<br>
 문제점 : 데이터가 많아지면서 개별 요일 데이터는 정상적으로 나오나 합치는 과정에서 0.0과 NaN값으로 변해 데이터가 병합이 제대로 되지 않았음<br>
 해결방안 : 데이터 과부하를 해결하기 위해 이전 데이터까지를 먼저 CSV파일로 저장 후 다시 불러와 새로 병합하는 방식으로 했더니 제대로 병합되어 해결할 수 있었다.
