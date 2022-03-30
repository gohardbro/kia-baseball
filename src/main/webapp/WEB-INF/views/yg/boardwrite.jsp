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
		<form method="post">
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
			<button type="button">좋아요</button>
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