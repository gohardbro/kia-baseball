<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<div class="wrapper style1 container">

	<form method="post" enctype="multipart/form-data">
		<div class="_h6Bar">
			<strong>${notice.title }</strong>
			<p class="icoWrap">
				<span class="date"><fmt:formatDate
						value="${notice.writeDate }" pattern="yyyy-MM-dd" /> | </span><span
					class="writer"> ${notice.writer } | </span><span class="view"><img
					src="/images/eye.png"> ${notice.views }</span>
			</p>
		</div>
		<div class="viewCont">
			<p>
			<div class="pb-5">${notice.content }</div>
		</div>
		<table border="1">
			<tr>
				<td align="center" colspan="2">
					<button type="button"
						onClick="location.href='/announce'">글목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>


<div>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/yg/include/bottom.jsp" />
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />