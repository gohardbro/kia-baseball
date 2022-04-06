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
		<form name="update" method="post" enctype="multipart/form-data"
			action="${path }/update">
			<input type="hidden" name="boardNo" value="${one.boardNo}"/>
			<table border="1">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="title" value="${one.title }"/></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left">${one.writer }</td>
				</tr>
				<tr>
					<td bgcolor="orange">이전내용</td>
					<td align="left"></td>
				</tr>
				<tr>
					<td bgcolor="orange">바꿀내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10">${one.content }</textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left"><fmt:formatDate value="${one.writeDate }"
							pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">조회수</td>
					<td align="left">${one.views }</td>
				</tr>
				<tr>
					<td bgcolor="orange">첨부파일 목록</td>
					<td><c:forEach var="file" items="${file }">
							<a class="downlink" id="${file.boardNo }"
								href="${file.fileName }">${file.fileName }</a>
							<button type="button" onclick="deleteFile('${file.boardNo }');">삭제</button>
							<br>
						</c:forEach></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">업로드</td>
					<td align="left"><input type="file" name="uploadFiles"
						multiple="multiple"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="글 수정"></td>
				</tr>
			</table>
			<div>
				<input type="submit" class="btn btn-outing-info" value="완료" /> <input
					type="reset" class="btn btn-outing-info" value="취소" />
			</div>
		</form>
		<hr>
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