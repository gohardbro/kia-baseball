<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/yg/include/top.jsp" />

<div class="wrapper style1">

	<div class="container">
		<h2>공지사항</h2>
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


<jsp:include page="/WEB-INF/views/yg/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />