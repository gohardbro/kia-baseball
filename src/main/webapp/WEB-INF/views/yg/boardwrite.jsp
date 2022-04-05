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
		<
		<!-- form method="post">
			<div style="margin-top: 10px;">
				<input type="text" name="writer" placeholder="작성자.."
					style="width: 40%" />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="title" class="form-control"
					placeholder="글제목.." style="width: 82%" />
			</div>
			<div style="margin-top: 10px;">
				<textarea rows="10" name="content" placeholder="글내용.."
					style="width: 82%;"></textarea>
			</div>
			<div style="margin-top: 10px;">
				<button type="submit">등록</button>
				<button type="button">취소</button>
			</div>
		</form>
		<div style="margin-top: 10px;">
			<button type="button" onclick="location.href='/free'">목록</button>
		</div> -->
		<form method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="title"></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left"><input type="text" name="writer" size="10"></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">업로드</td>
					<td align="left"><input type="file" name="uploadFiles"
						multiple="multiple"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="새 글 등록"></td>
				</tr>
			</table>
		</form>
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