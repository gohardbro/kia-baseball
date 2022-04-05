<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!-- Main -->
<div class="subheader"></div>
<div class="wrapper style1">

	<div class="container">
		<h2>공지사항</h2>
		<nav id="subnav">
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="/free">자유게시판</a></li>
				<li><a href="#">선수소개</a></li>
				<li><a href="/intro">팀소개</a></li>
			</ul>
		</nav>
		<table class="table">
			<tr>
				<td>no.1</td>
				<td>왼쪽 번호 오른쪽 작성일/조회수/좋아요</td>
				<td>22/03/29 | <img src="/images/eye.png"> 31 | <img
					src="/images/like.png"> 41
				</td>
			</tr>
			<tr>
				<td>no.2</td>
				<td>왼쪽 번호 오른쪽 작성일/조회수/좋아요</td>
				<td>22/03/29 | <img src="/images/eye.png"> 35 | <img
					src="/images/like.png"> 42
				</td>
			</tr>
			<tr>
				<td>no.3</td>
				<td>왼쪽 번호 오른쪽 작성일/조회수/좋아요</td>
				<td>22/03/29 | <img src="/images/eye.png"> 37 | <img
					src="/images/like.png"> 43
				</td>
			</tr>
		</table>
	</div>
</div>
<style>
._small img table tr td {
	width: 10px;
	height: 10px;
}

.subheader {
	width: 100%;
	height: 200px;
	background-repeat: no-repeat;
	background-position: center center;
	background-image: url('/images/wordmark.jpg');
}

h2 {
	text-align: center;
	font-weight: 600;
}

#subnav {
	text-align: right;
}

#subnav li {
	list-style-type: none;
	float: right;
}
#subnav li a {
	color: black;
}

table tr td a {
	color: black;
}
</style>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />