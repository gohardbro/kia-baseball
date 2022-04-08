<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Baseball</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/assets/css/main.css" />

<!-- bootstrap  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<noscript>
	<link rel="stylesheet" href="/assets/css/noscript.css" />
</noscript>

<!-- Scripts -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jquery.dropotron.min.js"></script>
<script src="/assets/js/jquery.scrolly.min.js"></script>
<script src="/assets/js/jquery.scrollex.min.js"></script>
<script src="/assets/js/browser.min.js"></script>
<script src="/assets/js/breakpoints.min.js"></script>
<script src="/assets/js/util.js"></script>
<script src="/assets/js/main.js"></script>
</head>
<body class="left-sidebar is-preload">


	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="/" id="logo">KIA Tigers</a>
					</h1>
				</header>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<c:choose>
					<c:when test="${empty sessionScope.loginUser }">
						<ul style="float: right; border-left: 0; border-right: 0;">
							<li><a href="/login">로그인</a></li>
							<li><a href="/signup">회원가입</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul style="float: right; border-left: 0; border-right: 0;">
							<li><a href="/mypage">${loginUser.nickname }
									(${loginUser.id }) 님</a></li>
							<li><a href="/logout">로그아웃</a></li>							
							<c:if test="${loginUser.admin eq 'Y' }">
								<li><a href="/admin">Admin</a></li>
							</c:if>
						</ul>
					</c:otherwise>
				</c:choose>
				<br>
				<ul class="kia_nav">
					<li><a href="#">KIA tigers</a></li>
					<li><a href="/ticket">예매</a></li>
					<li><a href="/announce">커뮤니티</a></li>
					<li><a href="/goods">굿즈샵</a></li>
				</ul>
			</nav>

		</div>