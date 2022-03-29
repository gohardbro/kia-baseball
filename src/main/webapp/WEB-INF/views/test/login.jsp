<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.member-wrapper {
	margin: 0 239px;
	padding: 0 45px;
	width: 460px;
	height: 490px;
}

.member-header {
	text-align: center;
}

.member-logo {
	margin: 47px 0 auto;
}

#login-email-input, #login-password-input {
	width: 442px;
	height: 20px;
	padding: 16px 0 12px 12px;
	font-size: 18px;
	margin-top: 12px;
}

.login-accountInfoFind {
	float: right;
	text-decoration: none;
}

.login_content-util {
	margin-top: 12px;
}

#auto-login {
	width: 23px;
	height: 23px;
}

.auto-login-span {
	margin: 3px;
	font-size: 17px;
	line-height: 7px;
}

.auto-login-label {
	height: 24px;
}

.login_button {
	display: block;
	width: 100%;
	height: 20px;
	text-align: center;
	margin-top: 16px;
	line-height: 20px;
	padding: 16px 0;
	font-size: 17px;
	border-radius: 2px;
}

.sginup_botton {
	text-align: center;
	display: block;
	margin-top: 18px;
	width: 100%;
	height: 20px;
	padding: 18px 0;
	border: 1px solid #cccccc;
	text-decoration: none;
	font-size: 17px;
	border-radius: 2px;
}
footer {
	padding: 20px 0 40px;
	text-align: center;
	font-size: 12px;
	color: #555555;
}
</style>
</head>
<body>
	<div class="member-wrapper">
		<header class="member-header">
			<h1 class="member-logo">
				<a class="member-logo_link" href="/home"> <img alt="tigers"
					src="images/wordmark.jpg" width="300px" height="100px">
				</a>
			</h1>
		</header>

		<div class="member-main">
			<form class="login-form" action="/test/home" method="post">
				<div class="login_content">
					<div class="login-input_id">
						<input type="email" maxlength="80" name="email"
							id="login-email-input" placeholder="아이디(이메일)" autocomplete="off">
					</div>
					<div class="login-input_pass">
						<input type="password" name="password" id="login-password-input"
							placeholder="비밀번호">
					</div>
				</div>
				<div class="login_content-util">
					<label class="auto-login-label" for="auto-login"> <input
						type="checkbox" id="auto-login"> <span
						class="auto-login-span">자동로그인</span>
					</label> <a class="login-accountInfoFind" href="/test/login/accountFind">아이디(이메일)/비밀번호
						찾기</a>
				</div>
				<div class="login_trigger">
					<button class="login_button" type="submit">로그인</button>
					<a class="sginup_botton" href="/test/login/signup">회원가입</a>
				</div>
			</form>
		</div>
		<footer>
			<div>@KiaTigers Corp. All rights reserved.</div>
		</footer>
	</div>

</body>
</html>