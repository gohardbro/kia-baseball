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
		<h2>자유게시판</h2>
		<nav id="subnav">
			<ul>
				<li><a href="/announce">공지사항</a></li>
				<li><a href="#">자유게시판</a></li>
				<li><a href="#">선수소개</a></li>
				<li><a href="/intro">팀소개</a></li>
			</ul>
		</nav>
		<table class="table">
			<c:forEach var="one" items="${all }">
				<tr>
					<td>${one.board_No }</td>
					<td><a href="/boardview?no=${one.board_No }">${one.title }</a></td>
					<td>${one.writer }|<fmt:formatDate value="${one.write_Date }"
							pattern="yyyy.MM.dd" /> | <img src="/images/eye.png">
						${one.views } | <img src="/images/like.png"> 43
					</td>
				</tr>
			</c:forEach>
		</table>
		<div style="margin-top: 10px;">
			<button type="button" onclick="location.href='/write'">글쓰기</button>
		</div>
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