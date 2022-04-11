
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
.header {
	background-color: #f1f1f1;
	padding: 30px;
	text-align: center;
	font-size: 35px;
}

/* Create three unequal columns that floats next to each other */
.column {
	float: left;
	padding: 10px;
}

/* Left and right column */
.column.side {
	width: 20%;
}

/* Middle column */
.column.middle {
	width: 60%;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the footer */
.footer {
	background-color: #f1f1f1;
	padding: 10px;
	text-align: center;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media ( max-width : 600px) {
	.column.side, .column.middle {
		width: 100%;
	}
}

.divider {
	height: 30px;
	width: 100%;
}

.selectFrom {
	float: right;
}

.selectBtn {
	display: inline-block;
	padding: 6px 12px;
}

select, option {
	font-size: 14px;
	padding: 0 12px;
}

.titleZone {
	border-bottom: 2px solid #999;
}

.main_wrapper {
	padding: 38px 39px 100px;
}

/* 추가 */
.usermodify_auth_title {
	font-size: 30px;
}

.usermodify_auth_msg {
	font-size: 12px;
}

.usermodify_table {
	color: #666666;
}

.usermodify_auth_mail {
	color: #0185da;
}

.usermodify_table {
	width: 878px;
	border-top: 2px solid #969696;
}

th, td {
	border-bottom: 1px solid #ddd;
	padding: 14px 30px;
	font-size: 12px;
}

th {
	border-right: 1px solid #ddd;
	width: 100px;
	background-color: #eef1f8;
	text-align: left;
}

td {
	width: 717px;
}

.usermodify_auth_password {
	width: 200px;
	border: 1px solid #ccc;
	height: 22px;
	padding: 2px 5px;
	line-height: 22px;
}

.confirm_btn {
	border-color: #0185da;
	color: #fff;
	background-color: #0e9ae9;
	background-image: linear-gradient(#20b3f8, #0185d8);
}

.cancel_btn {
	border-color: #828282;
	color: #fff;
	background-color: #999ca5;
	background-image: linear-gradient(#a8abba, #8c8f98);
}

.usermodify_auth_foot {
	text-align: center;
	margin-top: 10px;
}
</style>

<div class="row" style="margin: 0px;">
	<div class="column side" style="background-color: #f4f4f4;"></div>
	<div class="column middle">
		<div class="row">
			<div class="side_wrapper col-2">
				<jsp:include
					page="/WEB-INF/views/taejeong/include/mypageSideNav.jsp" />
			</div>
			<div class="main_wrapper col-10">
				<div class="titleZone">
					<h3 class="usermodify_auth_title">회원정보확인</h3>
				</div>
				<div class="main_content">
					<p style="font-size: 13px; color: #999; margin: 36px 0 26px;"
						class="usermodify_auth_msg">
						<strong class="usermodify_auth_mail">${loginUser.id }</strong> 님의
						정보를 안전하게 보호하기 위해서 다시 한번 확인 합니다.
					</p>

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
													<div id="validationServer01Feedback"
														class="invalid-feedback">validationServer01Feedback</div>
												</div>
												<div class="col-6" style="display: inline-block;">
													<button
														class="usermodify_email_form_submit btn btn-primary"
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
											<button type="button"
												class="usermodify_nickName_change_cancel"
												id="usermodify_nickName_change_cancel"
												style="display: none;"
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
											<button type="button"
												class="usermodify_phoneNumber_change_btn"
												id="usermodify_phoneNumber_change_btn"
												onclick="changeButtonToCanelPhoneNumber()">휴대폰 번호
												변경</button>
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
													<div id="validationServer03Feedback"
														class="invalid-feedback">validationServer03Feedback</div>
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
															<td><button type="submit"
																	class="usermodify_password_submit">비밀번호 변경</button></td>
														</tr>
													</tbody>
												</table>
											</form>
										</div></td>
								</tr>

							</tbody>
						</table>
						<div class="usermodify_foot">
							<!-- 부트스트랩 링크추가해야함 -->
							<button type="button" onclick="location.href='/mypage'"
								class="btn btn-secondary btn-sm">나가기</button>
						</div>
					</section>


					<div class="divider"></div>
					<div></div>

				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;"></div>
</div>
<script>
	$(".btn-outline-secondary").click(function() {
		$(".btn-outline-secondary").removeClass("active");
		$(this).addClass("active");
	});
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />