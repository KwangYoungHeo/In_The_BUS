
$(document).ready(function() {
	// document.getElementById('LogOut').setAttribute('hidden', true);

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

	var jsonData = getCookieValue("jsonData");
	if (jsonData) {
		jsonData = JSON.parse(decodeURIComponent(jsonData));
		console.log(jsonData);
		// 여기에서 jsonData를 원하는 방식으로 사용합니다.
		$.ajax({
			url: "../LoginCon",
			data: {
				id: jsonData.id
			},
			dataType: "json",
			success: function(result) {
				if (result != null) {
					bookmark(result);
					member(result);
				}
			},
			error: function(e) {
				alert('알 수 없는 문제가 발생했습니다.');
				console.log(e);
			}
		})

	} else {
		console.log("쿠키에 JSON 데이터가 저장되어 있지 않습니다.");
	}
});

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
								document.cookie = "jsonData=" + encodeURIComponent(JSON.stringify(result) + "; max-age=" + (60 * 60 * 1000));
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
											document.cookie = "jsonData=" + encodeURIComponent(JSON.stringify(result)) + "; max-age=" + (60 * 60 * 1000);
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
					$(".firstBookmark").after("<a href='../web/BUS_Inside.jsp?arsID=" + bookmarkList[i].ars_id
						+ "&localStationID=" + bookmarkList[i].station_id + "&station_name=" + bookmarkList[i].station_name + "&busID=" + bookmarkList[i].bus_id
						+ "&busNo=" + bookmarkList[i].bus_name + "'><div class='bookmark'><h3>" + bookmarkList[i].bus_name + "</h3><span>" + bookmarkList[i].station_name + "</span></div></a>");
				}
			}
		}
	});
}

function getCookieValue(cookieName) {
	var name = cookieName + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var cookieArray = decodedCookie.split(';');
	for (var i = 0; i < cookieArray.length; i++) {
		var cookie = cookieArray[i].trim();
		if (cookie.indexOf(name) === 0) {
			const value = cookie.substring(name.length, cookie.length);
			return decodeURIComponent(value);
		}
	}
	return null; // 해당 쿠키가 없는 경우
}


function member(result) {
	$('#Login').after("<div><h3 id='userId'><img id='userImg' src='" + result.profile_img + "'>" + result.id + "</h3></div>");
	document.getElementById('Login').setAttribute('hidden', true);
	// document.getElementById('LogOut').removeAttribute('hidden');
}

function logOut() {
	document.cookie = "jsonData=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

