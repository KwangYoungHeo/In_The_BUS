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

};

document.addEventListener('DOMContentLoaded', function() {
	const hamburgerButton = document.getElementById('Login');
	const modal = document.getElementById('modal');
	const closeButton = document.getElementById('close-button');
	const blurBackground = document.getElementById('blur-background');

	hamburgerButton.addEventListener('click', function() {
		modal.style.display = 'block';
		blurBackground.style.display = 'block';
	});

	closeButton.addEventListener('click', function() {
		modal.style.display = 'none';
		blurBackground.style.display = 'none';
	});

	blurBackground.addEventListener('click', function() {
		modal.style.display = 'none';
		blurBackground.style.display = 'none';
	});
});

let kakao_account = "";

window.Kakao.init("cc74d2eaa158f56dc0ca061964ab3cdb");

function member(result) {
	console.log("들어왔나");
	$('#Login').after("<div><h3 id='userId'><img id='userImg' src='" + result.profile_img + "'>" + result.id + "</h3></div>");
	document.getElementById('Login').setAttribute('hidden', true);
}

function kakaoLogin() {
	window.Kakao.Auth.login({
		scope: 'profile_nickname, profile_image, account_email',
		success: function(authObj) {
			console.log(authObj); // 토큰 정보
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: res => {
					kakao_account = res.kakao_account;
					console.log(kakao_account); // 로그인한 회원 정보

					$.ajax({
						url: "../LoginCon",
						data: {
							id: kakao_account.email
						},
						dataType: "json",
						success: function(result) {
							if (result != null) {
								alert("로그인 성공!!")
								document.cookie = "jsonData=" + encodeURIComponent(JSON.stringify(result));
								bookmark(result);
								member(result);
							} else {
								$.ajax({
									url: "../JoinCon",
									data: {
										id: kakao_account.email,
										nickname: kakao_account.profile.nickname,
										profile_img: kakao_account.profile.profile_image_url
									},
									dataType: "json",
									success: function(result) {
										if (result == null) {
											alert("회원가입 실패..")
										} else {
											alert("회원가입 성공!!")
											console.log(result);
											document.cookie = "jsonData=" + encodeURIComponent(JSON.stringify(result));
											member(result);
											bookmark(result);
										}
									},
									/* 실패 시 */
									error: function(e) {
										alert('알 수 없는 문제가 발생했습니다. 다시 시도해 주세요..');
										console.log(e);
									}
								})
							}
						},
						error: function(e) {
							alert('알 수 없는 문제가 발생했습니다. 다시 시도해 주세요.');
							console.log(e);
						}
					})

				}
			});
		}
	});
}

// 회원 북마크 가져오기
function bookmark(result) {
	$.ajax({
		url: "../BookmarkGetCon",
		data: {
			id: result.id
		},
		dataType: "json",
		success: function(bookmarkList) {
			if (bookmarkList != null) {
				console.log(bookmarkList);
				for (var i = 0; i < bookmarkList.length; i++) {
					$(".firstBookmark").after("<a href='../web/BUS_Inside.jsp?arsID=" + bookmarkList[i].ars_ID
						+ "&localStationID=" + bookmarkList[i].station_id + "&station_name=" + bookmarkList[i].station_name + "&busID="+ bookmarkList[i].bus_id 
						+ "&busNo=" + bookmarkList[i].bus_name + "'><div class='bookmark'><h3>" + bookmarkList[i].bus_name + "</h3></div></a>");
				}
			}
		}
	});
}
