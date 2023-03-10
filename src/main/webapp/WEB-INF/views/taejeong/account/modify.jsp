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
	<div class="container" >
		<section class="contents">
			<div class="contents_container">
				<section class="usermodify_auth">
					<h1 class="usermodify_auth_title">???????????? ??????</h1>
					<table class="usermodify_table">
						<tbody>
							<tr>
								<th>?????????(?????????)</th>
								<td><div class="usermodify_email">
										<strong class="usermodify_email_current_email">${loginUser.id }</strong>
									</div>
								</td>
							</tr>
							<tr>
								<th>?????????</th>
								<td><div class="usermodify_nickName">
										<strong class="usermodify_email_current_nickName">${loginUser.nickname }</strong>
										<button type="button" class="usermodify_nickName_change_btn"
											id="usermodify_nickName_change_btn"
											onclick="changeButtonToCanelNickName()">????????? ??????</button>
										<button type="button" class="usermodify_nickName_change_cancel"
											id="usermodify_nickName_change_cancel" style="display: none;"
											onclick="changeButtonToDefaultNickName()">????????? ?????? ??????</button>
										<form class="usermodify_nickName_form row g-3" method="post"
											action="/modify/nickname" id="usermodify_nickName_form"
											style="display: none;">
											<div class="col-md-4">
												<input type="text"
													class="usermodify_nickName_form_input form-control nickname"
													id="validationServer02" name="nickname"
													aria-describedby="validationServer02Feedback"
													onkeyup="nicknameCheck()" required>
												<div id="validationServer02Feedback"
													class="invalid-feedback already_nickname nickname_feedback_invalid">?????? ???????????? ??????
													????????????.</div>
												<div id="validationServer02Feedback"
													class="invalid-feedback empty_nickname"
													style="display: none;">???????????? ???????????????.</div>
												<div id="validationServer02Feedback" class="valid-feedback nickname_feedback_valid">
													??????????????? ????????? ?????????.</div>
											</div>
											<div class="col-6" style="display: inline-block;">
												<button
													class="usermodify_nickName_form_submit btn btn-primary"
													type="button">????????? ??????</button>
											</div>
										</form>
									</div></td>
							</tr>
							<tr>
								<th>???????????????</th>
								<td><div class="usermodify_nickName">
										<strong class="usermodify_email_current_phoneNumber">${empty loginUser.phone ? '?????????' : loginUser.phone}
										</strong>
										<button type="button" class="usermodify_phoneNumber_change_btn"
											id="usermodify_phoneNumber_change_btn"
											onclick="changeButtonToCanelPhoneNumber()">????????? ?????? ??????</button>
										<button type="button"
											class="usermodify_phoneNumber_change_cancel"
											id="usermodify_phoneNumber_change_cancel"
											style="display: none;"
											onclick="changeButtonToDefaultPhoneNumber()">????????? ??????
											?????? ??????</button>
										<form class="usermodify_phoneNumber_form row g-3"
											action="/modify/phone" method="post"
											id="usermodify_phoneNumber_form" style="display: none;">
											<div class="col-md-4">
												<input type="text"
													class="usermodify_phoneNumber_form_input form-control phone"
													id="validationServer03" name="phone"
													aria-describedby="validationServer03Feedback" onkeyup="phoneCheck()" required>
												<div id="validationServer03Feedback" class="invalid-feedback phone_feedback_invalid">
													validationServer03Feedback</div>
												<div id="validationServer03Feedback" class="valid-feedback phone_feedback_valid">
													validationServer03Feedback</div>
											</div>
											<div class="col-6" style="display: inline-block;">
												<button
													class="usermodify_phoneNumber_form_submit btn btn-primary"
													type="button">??????</button>
											</div>
										</form>
									</div></td>
							</tr>
							<tr>
								<th>??????????????????</th>
								<td><div class="usermodify_password">
										<form class="usermodify_password_form"
											action="/modify/password" method="post">
											<table class="usermodify_password_table">
												<tbody>
													<tr>
														<th>?????? ????????????</th>
														<td><input class="usermodify_auth_current_password"
															type="password" name="pw"></td>
													</tr>
													<tr>
														<th>??? ????????????</th>
														<td><small class="pw_rule" style="display:none;">????????????: ?????? ???,???????????? ?????????
																????????? 1??? ????????? ????????? 8??? ~ 20???</small> <input
															class="usermodify_auth_password pw"
															id="validationServer05"
															aria-describedby="validationServer05Feedback"
															type="password" name="new_pw" onfocus="display_pw_rule()"
															onkeyup="pwCheck()" />
															<div id="validationServer05Feedback"
																class="invalid-feedback pw_feedback_invalid"></div>
															<div id="validationServer05Feedback"
																class="valid-feedback pw_feedback_valid"></div></td>
													</tr>
													<tr>
														<th>???????????? ??????</th>
														<td><input class="usermodify_auth_password_again"
															id="validationServer04" name="new_pw_again"
															aria-describedby="validationServer04Feedback"
															type="password">
															<div id="validationServer04Feedback"
																class="invalid-feedback">??????????????? ???????????? ????????????.</div>
															<div id="validationServer04Feedback"
																class="valid-feedback">??????????????? ???????????????.</div></td>
													</tr>
													<tr>
														<td>${updatePwMsg }</td>
														<td><button type="button" class="usermodify_password_submit">???????????? ??????</button></td>
													</tr>
												</tbody>
											</table>
										</form>
									</div></td>
							</tr>
							<tr>
								<th>????????? ??????</th>
								<td>
									<form action="/modify/profile/upload" method="post"
										autocomplete="off" enctype="multipart/form-data">
										<div style="text-align: center;">
										<div style="margin: 15px;">
										<c:choose>
											<c:when test="${empty loginUser.profile }">
												<img src="/images/default-profile.png"
												class="mx-auto rounded d-block"
												style="width: 200px; height: 200px" id="profile" />??????????????? ???????????? ???????????? 200px??? ???????????????. <label
												class="text-info"></label>
											</c:when>
											<c:otherwise>
												<img src="/images/profile/${loginUser.profile }"
												class="mx-auto rounded d-block"
												style="width: 200px; height: 200px" id="profile" />??????????????? ???????????? ???????????? 200px??? ???????????????. <label
												class="text-info"></label>
											</c:otherwise>
										</c:choose>
											
										</div>
											<div class="custom-file" style="magin: 20px;">
												<input type="file" class="custom-file-input" id="customFile"
													name="file" accept="image/*" >
											</div>
											<div>
												<button type="submit" class="usermodify_nickName_change_btn">?????????
											?????? ??????</button>
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
						<button type="button" onclick="location.href='/mypage'"
							class="btn btn-secondary btn-sm">?????????</button>
					</div>
				</section>
			</div>
		</section>
	</div>
	<script>
		/* ????????? ?????? ??????????????? ?????? */
		function verifyNickname(){
			var nickname = $(".nickname").val();
			
			var regExp = /^[\w???-??????-??????-???]{2,20}$/; /* ?????? ?????? 2??? ~ 20??? */
			
			if (nickname.match(regExp) != null) {
				return true;
			} else {
				return false;
			}
		}
		
		/* ????????? ???????????? & ????????? ?????? ?????? */
		function nicknameCheck() {
			var nickname_input = $(".nickname").val();

			$.ajax({
				type : "POST",
				url : "/signup/nicknameCheck",
				data : {
					nickname : nickname_input
				},
				success : function(cnt) {
					if (cnt == 0) { /* cnt = DB??? ??????????????? ?????? */
						$(".nickname_feedback_valid").text("??????????????? ????????? ?????????.");
						$(".nickname").removeClass("is-invalid");
						$(".nickname").addClass("is-valid");
						if(verifyNickname() == false){   /* ????????? ??????????????? ????????? true?????? */
							$(".nickname_feedback_invalid").text("???????????? ???????????? ?????? 2??? ~ 20???"); 
							$(".nickname").removeClass("is-valid");
							$(".nickname").addClass("is-invalid");
						}
					} else {
						$(".nickname_feedback_invalid").text("?????? ???????????? ?????? ????????????."); 
						$(".nickname").removeClass("is-valid");
						$(".nickname").addClass("is-invalid");
					}

				},
				error : function() {
					alert("????????????????????? ???????????????");
				}
			});
		};
		
		//???????????? ???????????? ???????????????(????????????)
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

		
		/* ????????? ?????? ?????? ????????? ?????????input ????????? ??????????????? is-valid??? ????????? ????????? submit*/
		$(".usermodify_nickName_form_submit").on("click", function() {
			var element = $(".usermodify_nickName_form_input").attr("class");

			var classSearch = "";
			classSearch = element.indexOf("is-valid");

			if (classSearch != -1) {
				$("#usermodify_nickName_form").submit();
				alert("???????????? ?????????????????????.");
			}

		});
		
		/* ????????? ?????? ??????????????? */
		function verifyPhone(){
			var phone = $(".phone").val();
			
			var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; 
			
			if (phone.match(regExp) != null) {
				return true;
			} else {
				return false;
			}
		}
		
		/* ???????????? ?????? ??????????????? */
		function verifyPw(){
			var pw = $(".pw").val();
			
			var regExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/; /* ?????? ???,???????????? ????????? ????????? 1??? ????????? ????????? 8??? ~ 20??? */

			
			if (pw.match(regExp) != null) {
				return true;
			} else {
				return false;
			}
		}
		
		/* ???????????? ??????????????? */
		function pwCheck() {
			var pw_input = $(".pw").val();

			if (verifyPw() == true) { 
				$(".pw_feedback_valid").text("??????????????? ???????????? ?????????.");
				$(".pw").removeClass("is-invalid");
				$(".pw").addClass("is-valid");
			} else {
				$(".pw_feedback_invalid").text("???????????? ?????? ???????????? ?????????.");
				$(".pw").removeClass("is-valid");
				$(".pw").addClass("is-invalid");
			}

		}

		/* ????????????????????? */
		$(".passwordAgain").keyup(function() {
			var password = $(".password").val();
			var passwordAgain = $(".passwordAgain").val();
			if (passwordAgain != password) {
				$(".passwordAgain").removeClass("is-valid");
				$(".passwordAgain").addClass("is-invalid");
			} else {
				$(".passwordAgain").removeClass("is-invalid");
				$(".passwordAgain").addClass("is-valid");
			}
		});
		$(".password").keyup(function() {
			var password = $(".password").val();
			var passwordAgain = $(".passwordAgain").val();
			if (passwordAgain != password) {
				$(".passwordAgain").removeClass("is-valid");
				$(".passwordAgain").addClass("is-invalid");
			} else {
				$(".passwordAgain").removeClass("is-invalid");
				$(".passwordAgain").addClass("is-valid");
			}
		});
		
		/* ????????? ??????????????? */
		function phoneCheck(){
			
			if (verifyPhone() == true) { 
				$(".phone_feedback_valid").text("??????????????? ?????? ?????????.");
				$(".phone").removeClass("is-invalid");
				$(".phone").addClass("is-valid");
			} else {
				$(".phone_feedback_invalid").text("???????????? ?????? ?????? ?????????.");
				$(".phone").removeClass("is-valid");
				$(".phone").addClass("is-invalid");
			}

		}
		
		/* ???????????? ????????? ???????????? ????????? */
		$(".usermodify_password_submit").on(
				"click",
				function() {
					var elements = [$(".pw").attr("class"), $(".usermodify_auth_password_again").attr("class")];

					var classSearch = [];

					for (var i = 0; i < elements.length; i++) {
						classSearch[i] = elements[i].indexOf("is-valid"); /* indexof?????? ???????????? -1??? ????????? */

					}
					if (classSearch[0] != -1 && classSearch[1] != -1) {
						$(".usermodify_password_form").submit();

					} else {
						alert("???????????? ????????????!");

					}

				});
		
		/* ??? ???????????? ????????? */
		$(".usermodify_phoneNumber_form_submit").on(
				"click",
				function() {
					var elements = $(".phone").attr("class");


					var	classSearch = elements.indexOf("is-valid"); /* indexof?????? ???????????? -1??? ????????? */

					if (classSearch != -1) {
						$(".usermodify_phoneNumber_form").submit();

					} else {
						alert("??????????????? ????????????!");

					}

				});
		
		
	
	
	
	
	
	
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
		
		function display_pw_rule() {
			$(".pw_rule").css("display", "inline-block");

		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>