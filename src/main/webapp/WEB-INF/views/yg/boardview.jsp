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
		<table class="table">
			<tr>
				<td>no.1</td>
				<td>왼쪽 번호 오른쪽 작성일/조회수/좋아요</td>
				<td>22/03/29 | <img src="/images/eye.png"> 31 | <img
					src="/images/like.png"> 41
				</td>
			</tr>
		</table>
		<div style="margin-left: 20px; width: 80%">
			<h4>${one.title }</h4>
			<p style="font-size: small;">
				${one.writer } |
				<fmt:formatDate value="${one.writedate }"
					pattern="yyyy.MM.dd hh:mm:ss" />
			</p>
			<p style="min-height: 300px; white-space: break-spaces">
				<c:out value="${one.content}" />
			</p>
			<div style="margin-top: 10px;">
				<button type="button">수정</button>
				<button type="button">삭제</button>
			</div>
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
</style>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />