<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Heroes · Bootstrap v5.1</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/heroes/">



<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


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
</style>


<!-- Custom styles for this template -->
<link href="heroes.css" rel="stylesheet">
</head>
<body>

	<main>
	<h1 class="visually-hidden">Heroes examples</h1>
	<div class="b-example-divider"></div>

	<div class="container col-xl-10 col-xxl-8 px-4 py-5">
		<div class="row align-items-center g-lg-5 py-5">
			<div class="col-md-10 mx-auto col-lg-5">
				<form class="p-4 p-md-5 border rounded-3 bg-light">
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="floatingInput"
							placeholder="name@example.com"> <label
							for="floatingInput">아이디(이메일)</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="floatingPassword"
							placeholder="Password"> <label for="floatingPassword">비밀번호</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="floatingPassword"
							placeholder="Password"> <label for="floatingPassword">비밀번호확인</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="name@example.com"> <label
							for="floatingInput">닉네임</label>
					</div>
					<div class="checkbox mb-3">
						<label> <input type="checkbox" value="remember-me">
							모두 동의합니다.
						</label>
					</div>
					<button class="w-100 btn btn-lg btn-primary" type="submit">가입하기</button>
					<hr class="my-4">
					<small class="text-muted">@KiaTigers Corp. All rights
						reserved.</small>
				</form>
			</div>
		</div>
	</div>

	<div class="b-example-divider"></div>


	<div class="bg-dark text-secondary px-4 py-5 text-center">
		<div class="py-5">
			<h1 class="display-5 fw-bold text-white">Dark mode hero</h1>
			<div class="col-lg-6 mx-auto">
				<p class="fs-5 mb-4">Quickly design and customize responsive
					mobile-first sites with Bootstrap, the world’s most popular
					front-end open source toolkit, featuring Sass variables and mixins,
					responsive grid system, extensive prebuilt components, and powerful
					JavaScript plugins.</p>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					<button type="button"
						class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">Custom
						button</button>
					<button type="button" class="btn btn-outline-light btn-lg px-4">Secondary</button>
				</div>
			</div>
		</div>
	</div>

	<div class="b-example-divider mb-0"></div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>
</html>