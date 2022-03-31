<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Insert title here</title>
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

.usermodify_auth_password {
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

.usermodify_email_form, .usermodify_nickName_form {
	margin-top: 12px;
}

.usermodify_email_form_submit, .usermodify_nickName_form_submit {
	font-size: 12px;
	width: 92px;
	height: 30px;
	padding: 5px 10x;
}

.usermodify_email_form_input, .usermodify_nickName_form_input {
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
									<strong class="usermodify_email_current_email">jangci@naver.com</strong>
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
												id="validationServer05"
												aria-describedby="validationServer05Feedback" required>
											<div id="validationServer05Feedback" class="invalid-feedback">
												Please provide a valid zip.</div>
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
									<strong class="usermodify_email_current_nickName">gohard</strong>
									<button type="button" class="usermodify_nickName_change_btn"
										id="usermodify_nickName_change_btn"
										onclick="changeButtonToCanelNickName()">닉네임 변경</button>
									<button type="button" class="usermodify_nickName_change_cancel"
										id="usermodify_nickName_change_cancel" style="display: none;"
										onclick="changeButtonToDefaultNickName()">닉네임 변경 취소</button>
									<form class="usermodify_nickName_form row g-3"
										id="usermodify_nickName_form" style="display: none;">
										<div class="col-md-4">
											<input type="text"
												class="usermodify_nickName_form_input form-control is-invalid"
												id="validationServer05"
												aria-describedby="validationServer05Feedback" required>
											<div id="validationServer05Feedback" class="invalid-feedback">
												Please provide a valid zip.</div>
										</div>
										<div class="col-6" style="display: inline-block;">
											<button class="usermodify_nickName_form_submit btn btn-primary"
												type="submit">닉네임 변경</button>
										</div>
									</form>
								</div></td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td><div class="usermodify_nickName">
									<strong class="usermodify_email_current_phoneNumber">010-2222-4444</strong>
									<button type="button" class="usermodify_phoneNumber_change_btn"
										id="usermodify_phoneNumber_change_btn"
										onclick="changeButtonToCanelPhoneNumber()">휴대폰 번호 변경</button>
									<button type="button"
										class="usermodify_phoneNumber_change_cancel"
										id="usermodify_phoneNumber_change_cancel"
										style="display: none;"
										onclick="changeButtonToDefaultPhoneNumber()">휴대폰 번호
										변경 취소</button>
								</div></td>
						</tr>
						<tr> <!-- form이나 ajax 정하기  -->
							<th>비밀번호변경</th>
							<td><div class="usermodify_password">
									<table class="usermodify_password_table">
										<tbody>
											<tr>
												<th>현재 비밀번호</th>
												<td><input class="usermodify_auth_password"
													type="password"></td>
											</tr>
											<tr>
												<th>새 비밀번호</th>
												<td><input class="usermodify_auth_password"
													type="password"></td>
											</tr>
											<tr>
												<th>비밀번호 다시 입력</th>
												<td><input class="usermodify_auth_password"
													type="password"></td>
											</tr>
											<tr>
												<td></td>
												<td><button type="button"
														class="usermodify_password_submit">비밀번호 변경</button></td>
											</tr>
										</tbody>
									</table>

								</div></td>
						</tr>
					</tbody>
				</table>
				<div class="usermodify_foot">
					<!-- 부트스트랩 링크추가해야함 -->
					<button type="button" class="btn btn-secondary btn-sm">
						나가기</button>
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
			element3.style.cssText = 'display: block;'; /* block 했을때 flex가 풀려버리는거 질문 */
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
		}

		function changeButtonToDefaultPhoneNumber() {
			var element2 = document
					.getElementById('usermodify_phoneNumber_change_cancel');
			element2.style.cssText = 'display: none;';

			var element = document
					.getElementById('usermodify_phoneNumber_change_btn');
			element.style.cssText = 'display: inline-block;';
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>