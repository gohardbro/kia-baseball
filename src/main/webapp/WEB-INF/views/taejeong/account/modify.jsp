<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<title>modify</title>
<style>
body {
	margin: 0;
}

.contents {
	margin-right: 15%;
	margin-left: 15%;
	padding-bottom: 40px;
	width: 980px;
	border: 1px solid #ccc;
}

.contents_container {
	width: 878px;
	min-height: 900px;
	padding: 50px;
	background-color: #fff;
}

.usermodify_auth_title {
	font-weight: bold;
	font-size: 30px;
}

.usermodify_auth_mail {
	color: #0185da;
}

.usermodify_table {
	color: #666666;
	width: 878px;
	border-top: 2px solid #969696;
}

.usermodify_table th, td {
	border-bottom: 1px solid #ddd;
	padding: 14px 30px;
	font-size: 12px;
}

.usermodify_table th {
	border-right: 1px solid #ddd;
	background-color: #eef1f8;
	text-align: left;
}

.usermodify_table td {
	width: 717px;
}

.usermodify_auth_password, .usermodify_auth_password_again,
	.usermodify_auth_current_password {
	width: 200px;
	border: 1px solid #ccc;
	height: 22px;
	padding: 2px 5px;
	line-height: 22px;
}

.usermodify_password_submit, .usermodify_email_change_btn,
	.usermodify_nickName_change_btn, .usermodify_phoneNumber_change_btn {
	border-color: #bcbfc6;
	color: #777;
	background-color: #fafbf6;
	background-image: linear-gradient(#fff, #f1f1f1);
}

.usermodify_password_table th, .usermodify_password_table td {
	width: 89.4px;
	border: none;
	background-color: white;
	padding: 5px 6px 11px;
}

.usermodify_password_table th {
	font-weight: normal;
}

.usermodify_foot {
	margin-top: 30px;
	text-align: center;
}

.usermodify_email_current_email, .usermodify_email_current_nickName,
	.usermodify_email_current_phoneNumber {
	margin-right: 12px;
}

.usermodify_email_change_cancel, .usermodify_nickName_change_cancel,
	.usermodify_phoneNumber_change_cancel {
	border-color: #828282;
	color: #fff;
	background-color: #999ca5;
	background-image: linear-gradient(#a8abba, #8c8f98);
}

.usermodify_email_form, .usermodify_nickName_form,
	.usermodify_phoneNumber_form {
	margin-top: 12px;
}

.usermodify_email_form_submit, .usermodify_nickName_form_submit,
	.usermodify_phoneNumber_form_submit {
	font-size: 12px;
	width: 92px;
	height: 30px;
	padding: 5px 10x;
}

.usermodify_email_form_input, .usermodify_nickName_form_input,
	.usermodify_phoneNumber_form_input {
	font-size: 12px;
	width: 220px;
	height: 30px;
	padding: 5px 10x;
}
</style>
</head>
<body>
	<section class="contents">
		<div class="contents_container">
			<section class="usermodify_auth">
				<h1 class="usermodify_auth_title">회원정보 수정</h1>
				<table class="usermodify_table">
					<tbody>
						<tr>
							<th>아이디(이메일)</th>
							<td><div class="usermodify_email">
									<strong class="usermodify_email_current_email">${loginUser.id }</strong>
									<button type="button" class="usermodify_email_change_btn"
										id="usermodify_email_change_btn"
										onclick="changeButtonToCanelEmail()">이메일 변경</button>
									<button type="button" class="usermodify_email_change_cancel"
										id="usermodify_email_change_cancel" style="display: none;"
										onclick="changeButtonToDefaultEmail()">이메일 변경 취소</button>
									<form class="usermodify_email_form row g-3"
										id="usermodify_email_form" style="display: none;">
										<div class="col-md-4">
											<input type="text"
												class="usermodify_email_form_input form-control is-invalid"
												id="validationServer01"
												aria-describedby="validationServer01Feedback" required>
											<div id="validationServer01Feedback" class="invalid-feedback">
												validationServer01Feedback</div>
										</div>
										<div class="col-6" style="display: inline-block;">
											<button class="usermodify_email_form_submit btn btn-primary"
												type="submit">인증메일 전송</button>
										</div>
									</form>
								</div></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><div class="usermodify_nickName">
									<strong class="usermodify_email_current_nickName">${loginUser.nickname }</strong>
									<button type="button" class="usermodify_nickName_change_btn"
										id="usermodify_nickName_change_btn"
										onclick="changeButtonToCanelNickName()">닉네임 변경</button>
									<button type="button" class="usermodify_nickName_change_cancel"
										id="usermodify_nickName_change_cancel" style="display: none;"
										onclick="changeButtonToDefaultNickName()">닉네임 변경 취소</button>
									<form class="usermodify_nickName_form row g-3" method="post"
										action="/modify/nickname" id="usermodify_nickName_form"
										style="display: none;">
										<div class="col-md-4">
											<input type="text"
												class="usermodify_nickName_form_input form-control"
												id="validationServer02" name="nickname"
												aria-describedby="validationServer02Feedback"
												onkeyup="nicknameCheck()" required>
											<div id="validationServer02Feedback"
												class="invalid-feedback already_nickname">해당 닉네임이 이미
												있습니다.</div>
											<div id="validationServer02Feedback"
												class="invalid-feedback empty_nickname"
												style="display: none;">닉네임을 입력하세요.</div>
											<div id="validationServer02Feedback" class="valid-feedback">
												사용가능한 닉네임 입니다.</div>
										</div>
										<div class="col-6" style="display: inline-block;">
											<button
												class="usermodify_nickName_form_submit btn btn-primary"
												type="button">닉네임 변경</button>
										</div>
									</form>
								</div></td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td><div class="usermodify_nickName">
									<strong class="usermodify_email_current_phoneNumber">${empty loginUser.phone ? '미등록' : loginUser.phone}
									</strong>
									<button type="button" class="usermodify_phoneNumber_change_btn"
										id="usermodify_phoneNumber_change_btn"
										onclick="changeButtonToCanelPhoneNumber()">휴대폰 번호 변경</button>
									<button type="button"
										class="usermodify_phoneNumber_change_cancel"
										id="usermodify_phoneNumber_change_cancel"
										style="display: none;"
										onclick="changeButtonToDefaultPhoneNumber()">휴대폰 번호
										변경 취소</button>
									<form class="usermodify_phoneNumber_form row g-3"
										action="/modify/phone" method="post"
										id="usermodify_phoneNumber_form" style="display: none;">
										<div class="col-md-4">
											<input type="text"
												class="usermodify_phoneNumber_form_input form-control"
												id="validationServer03" name="phone"
												aria-describedby="validationServer03Feedback" required>
											<div id="validationServer03Feedback" class="invalid-feedback">
												validationServer03Feedback</div>
											<div id="validationServer03Feedback" class="valid-feedback">
												validationServer03Feedback</div>
										</div>
										<div class="col-6" style="display: inline-block;">
											<button
												class="usermodify_phoneNumber_form_submit btn btn-primary"
												type="submit">변경</button>
										</div>
									</form>
								</div></td>
						</tr>
						<tr>
							<th>비밀번호변경</th>
							<td><div class="usermodify_password">
									<form class="usermodify_password_form"
										action="/modify/password" method="post">
										<table class="usermodify_password_table">
											<tbody>
												<tr>
													<th>현재 비밀번호</th>
													<td><input class="usermodify_auth_current_password"
														type="password" name="pw"></td>
												</tr>
												<tr>
													<th>새 비밀번호</th>
													<td><input class="usermodify_auth_password"
														type="password" name="new_pw" /></td>
												</tr>
												<tr>
													<th>비밀번호 확인</th>
													<td><input class="usermodify_auth_password_again"
														id="validationServer04" name="new_pw_again"
														aria-describedby="validationServer04Feedback"
														type="password">
														<div id="validationServer04Feedback"
															class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
														<div id="validationServer04Feedback"
															class="valid-feedback">비밀번호가 일치합니다.</div></td>
												</tr>
												<tr>
													<td>${updatePwMsg }</td>
													<td><button type="submit" class="usermodify_password_submit">비밀번호 변경</button></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div></td>
						</tr>
						<tr>
							<th>프로필</th>
							<td><div class="usermodify_nickName">
									<strong class="usermodify_email_current_nickName"></strong>

									<button type="button" class="usermodify_nickName_change_btn">프로필
										사진 변경</button>
								</div></td>
						</tr>
						<tr>
							<th>프로필</th>
							<td>
								<form action="/modify/profile/upload" method="post"
									autocomplete="off" enctype="multipart/form-data">
									<div style="text-align: center;">
									<div style="margin: 15px;">
										<img src="/profileImg/${loginUser.profile }"
											class="mx-auto rounded d-block"
											style="width: 200px; height: 200px" id="profile" />프로필사진 사이즈는 가로세로 200px로 맞춰집니다. <label
											class="text-info"></label>
									</div>
										<div class="custom-file" style="magin: 20px;">
											<input type="file" class="custom-file-input" id="customFile"
												name="file" accept="image/*" >
										</div>
										<div>
											<button
												class="usermodify_phoneNumber_form_submit btn btn-primary"
												type="submit">변경</button>
										</div>
									</div>
									
									
								</form>
								<div>
									<strong class="usermodify_email_current_nickName">${empty msg ? "" : msg}</strong>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
				<div class="usermodify_foot">
					<!-- 부트스트랩 링크추가해야함 -->
					<button type="button" onclick="location.href='/mypage'"
						class="btn btn-secondary btn-sm">나가기</button>
				</div>
			</section>
		</div>
	</section>
	<script>
		function changeButtonToCanelEmail() {
			var element = document
					.getElementById('usermodify_email_change_btn');
			element.style.cssText = 'display: none;';

			var element2 = document
					.getElementById('usermodify_email_change_cancel');
			element2.style.cssText = 'display: inline-block;';

			var element3 = document.getElementById('usermodify_email_form');
			element3.style.cssText = 'display: block;';
		}

		function changeButtonToDefaultEmail() {
			var element2 = document
					.getElementById('usermodify_email_change_cancel');
			element2.style.cssText = 'display: none;';

			var element = document
					.getElementById('usermodify_email_change_btn');
			element.style.cssText = 'display: inline-block;';

			var element3 = document.getElementById('usermodify_email_form');
			element3.style.cssText = 'display: none;';
		}

		function changeButtonToCanelNickName() {
			var element = document
					.getElementById('usermodify_nickName_change_btn');
			element.style.cssText = 'display: none;';

			var element2 = document
					.getElementById('usermodify_nickName_change_cancel');
			element2.style.cssText = 'display: inline-block;';

			var element3 = document.getElementById('usermodify_nickName_form');
			element3.style.cssText = 'display: block;';
		}

		function changeButtonToDefaultNickName() {
			var element2 = document
					.getElementById('usermodify_nickName_change_cancel');
			element2.style.cssText = 'display: none;';

			var element = document
					.getElementById('usermodify_nickName_change_btn');
			element.style.cssText = 'display: inline-block;';

			var element3 = document.getElementById('usermodify_nickName_form');
			element3.style.cssText = 'display: none;';
		}

		function changeButtonToCanelPhoneNumber() {
			var element = document
					.getElementById('usermodify_phoneNumber_change_btn');
			element.style.cssText = 'display: none;';

			var element2 = document
					.getElementById('usermodify_phoneNumber_change_cancel');
			element2.style.cssText = 'display: inline-block;';

			var element3 = document
					.getElementById('usermodify_phoneNumber_form');
			element3.style.cssText = 'display: block;';
		}

		function changeButtonToDefaultPhoneNumber() {
			var element2 = document
					.getElementById('usermodify_phoneNumber_change_cancel');
			element2.style.cssText = 'display: none;';

			var element = document
					.getElementById('usermodify_phoneNumber_change_btn');
			element.style.cssText = 'display: inline-block;';

			var element3 = document
					.getElementById('usermodify_phoneNumber_form');
			element3.style.cssText = 'display: none;';
		}
		//비밀번호 일치확인 다시만들기(간결하게)
		$(".usermodify_auth_password_again").keyup(function() {
			var password = $(".usermodify_auth_password").val();
			var passwordAgain = $(".usermodify_auth_password_again").val();
			if (passwordAgain != password) {
				$(".usermodify_auth_password_again").removeClass("is-valid");
				$(".usermodify_auth_password_again").addClass("is-invalid");
			} else {
				$(".usermodify_auth_password_again").removeClass("is-invalid");
				$(".usermodify_auth_password_again").addClass("is-valid");
			}
		});

		/* 닉네임 중복체크 */
		function nicknameCheck() {
			var nickname_input = $(".usermodify_nickName_form_input").val();

			$.ajax({
				type : "POST",
				url : "/signup/nicknameCheck",
				data : {
					nickname : nickname_input
				},
				success : function(cnt) {
					console.log(cnt);
					if (cnt == 0 && nickname_input != "") { /* cnt = DB에 해당닉네임 개수 */
						$(".already_nickname").css("display", "none");
						$(".empty_nickname").css("display", "none");
						$(".usermodify_nickName_form_input").removeClass(
								"is-invalid");
						$(".usermodify_nickName_form_input").addClass(
								"is-valid");
					} else if (cnt == 0 && nickname_input == "") {
						$(".invalid-feedback").css("display", "none");
						$(".empty_nickname").css("display", "inline-block");
						$(".usermodify_nickName_form_input").removeClass(
								"is-valid");
						$(".usermodify_nickName_form_input").addClass(
								"is-invalid");
					} else {
						$(".already_nickname").css("display", "inline-block");
						$(".empty_nickname").css("display", "none");
						$(".usermodify_nickName_form_input").removeClass(
								"is-valid");
						$(".usermodify_nickName_form_input").addClass(
								"is-invalid");
					}
				},
				error : function() {
					alert("닉네임중복체크 에러입니다");
				}
			});
		};

		$(".usermodify_nickName_form_submit").on("click", function() {
			var element = $(".usermodify_nickName_form_input").attr("class");

			var classSearch = "";
			classSearch = element.indexOf("is-valid");

			if (classSearch != -1) {
				$("#usermodify_nickName_form").submit();
				console.log("서브밋까진 성공");
			}

		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>