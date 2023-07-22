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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
	integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
	crossorigin="anonymous"></script>
<script>
	Kakao.init('cc74d2eaa158f56dc0ca061964ab3cdb');
</script>

</head>
<body>
	<a id="kakao-login-btn" href="javascript:kakaoLogin()"> <img
		src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
		width="222" alt="카카오 로그인 버튼" />
	</a>
	<button id="btn">회원가입</button>
	
	<button onclick="location.href='BusNameSearch.jsp'">버스검색</button>
	<button onclick="location.href='../TestJoinCon'">길찾기</button>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		let kakao_account = "";
		
        window.Kakao.init("cc74d2eaa158f56dc0ca061964ab3cdb");

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, profile_image, account_email',
                success: function (authObj) {
                    console.log(authObj); // 토큰 정보
                    window.Kakao.API.request({
                        url: '/v2/user/me',
                        success: res => {
                            kakao_account = res.kakao_account;
                            console.log(kakao_account); // 로그인한 회원 정보
                            
                        }
                    });
                }

            });

        }
        
        
        
//        $('#btn').on('click', function(){
  //  	 	$.ajax({
    //	 		/* 어디로 보낼건지? */
    	// 		url : "../TestJoinCon",
    		//	/* 어떤 데이터를 보낼 것인지? */
    			//data : {
    			//	id : kakao_account.email,
    			//	nickname : kakao_account.profile.nickname,
    			//	profile_img : kakao_account.profile.profile_image_url 				
    			//}
    		//}) 
   // });
    </script>
</body>
</html>