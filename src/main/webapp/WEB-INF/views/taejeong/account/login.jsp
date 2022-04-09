
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>login</title>
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/heroes/">



<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">



<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.text-muted {
	font-size: 12px;
}

.auth_wrapper {
	margin-top: 10px;
}

.accountFind {
	float: right;
	text-decoration: none;
}

.member-header {
	text-align: center;
}

.member-logo {
	margin: 47px 0 auto;
}

.alert, .w-100 {
	margin-top: 10px;
}
</style>



</head>
<body>



	<div class="container col-xl-10 col-xxl-8 px-4 py-5">
		<div class="row align-items-center g-lg-5 py-5">
			<header class="member-header">
				<h1 class="member-logo">
					<a class="member-logo_link" href="/home"> <img alt="tigers"
						src="images/wordmark.jpg" width="300px" height="100px">
					</a>
				</h1>
			</header>
			<div class="col-md-10 mx-auto col-lg-5">
				<form class="p-4 p-md-5 border rounded-3 bg-light" id="login_Form"
					action="/login" method="post">
					<div class="floatingInput form-floating mb-3">
						<input type="text" class="email_input form-control"
							id="validationServer01 floatingInput"
							aria-describedby="validationServer01Feedback"
							placeholder="name@example.com" name="id" /> <label
							for="floatingInput">아이디(이메일)</label>
						<div id="validationServer01Feedback" class="invalid-feedback">
							아이디를 입력하세요.</div>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="password form-control"
							id="validationServer02 floatingInput"
							aria-describedby="validationServer02Feedback"
							placeholder="Password" name="pw"> <label
							for="floatingPassword">비밀번호</label>
						<c:if test="${not empty loginErrMsg }">
							<div class="alert alert-danger">아이디나 비밀번호가 일치하지 않습니다.</div>
						</c:if>
					</div>

					<div class="checkbox mb-3">
						<label><input type="checkbox" name="autoLogin" value="true">
							로그인 유지 </label><a class="accountFind" href="/login/accountFind">아이디/비밀번호찾기</a>

					</div>
					<button class="w-100 btn btn-lg btn-primary" type="submit"
						id="confirmBtn">로그인</button>
						
					<a class="w-100 btn btn-lg"
						type="button" id="signupBtn" style="border: 1px solid black;"
						href="/signup">회원가입</a>
					<hr class="my-4">
					<small class="text-muted">@KiaTigers Corp. All rights
						reserved.</small>
				</form>
			</div>
		</div>
	</div>

	<div class="b-example-divider"></div>


	<div class="b-example-divider mb-0"></div>

	<script>
		
		
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>
</html>