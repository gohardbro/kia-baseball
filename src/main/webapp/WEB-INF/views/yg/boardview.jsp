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
		<!-- <table class="table">
			<tr>
				<td>no.1</td>
				<td>왼쪽 번호 오른쪽 작성일/조회수/좋아요</td>
				<td>22/03/29 | <img src="/images/eye.png"> 31 | <img
					src="/images/like.png"> 41
				</td>
			</tr>
		</table> -->
		<table border="1">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input name="title" type="text"
						value="${one.title }"></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left">${one.writer }</td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10">${one.content }</textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left">${one.write_Date }</td>
				</tr>
				<tr>
					<td bgcolor="orange">조회수</td>
					<td align="left">${one.views }</td>
				</tr>
				<tr>
					<td bgcolor="orange">첨부파일 목록</td>
					<td><c:forEach var="file" items="${fileList }">
							<a class="downlink" id="${file.fSeq }"
								href="${file.originalFileName }">${file.originalFileName }</a>
							<button type="button" onclick="deleteFile('${file.fSeq }');">삭제</button>
							<br>
						</c:forEach></td>
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
</style>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />