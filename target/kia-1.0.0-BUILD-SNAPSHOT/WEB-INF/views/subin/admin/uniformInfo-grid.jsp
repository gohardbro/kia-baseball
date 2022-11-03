<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<ul class='grid'>
	<c:forEach items="${ page.uniformInfoList }" var="uniformInfo">
		<li>
			<div style="width:214px; height:180px;">
				<a onclick="location.href='/admin/uniformInfo/update?uniInfoNo=${uniformInfo.uniInfoNo}'">
					<img src="/images/uniform/${ uniformInfo.uniformImg }"
					style="width: 150px; height: 150px;"
					class="mx-auto rounded d-block">
				</a>
			</div>
			<div><a onclick="location.href='/admin/uniformInfo/update?uniInfoNo=${uniformInfo.uniInfoNo}'">
				${ uniformInfo.uniformName }
			</a></div>
			<div>
				<fmt:formatNumber value="${ uniformInfo.price }" pattern="#,###원" />
				<span style='float: right;'>${ uniformInfo.color }</span>
			</div>
		</li>
	</c:forEach>
</ul>

<!-- 페이지 버튼 -->
<div class='btnSet'>
	<jsp:include page="/WEB-INF/views/subin/admin/include/page.jsp" />
</div>

<style>
ul {
	list-style-type: none;
	padding: 0;
}

.list-top {
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

.list-top ul {
	display: flex;
	line-height: 38px;
}

.list-top li:not (:first-child ) {
	margin-left: 3px;
}

ul.grid {
	width: 1200px;
	display: flex;
	flex-wrap: wrap;
	margin: 0 auto;
	margin-bottom: 1rem;
}

ul.grid li {
	width: 224px;
	height: 260px;
	margin-right: 20px;
	border: 1px solid #b0b0b0;
	box-sizing: border-box;
}

ul.grid li:nth-child(5n) {
	margin-right: 0
}

ul.grid li:nth-child(5) ~ li {
	margin-top: 20px;
}

ul.grid li div {
	text-align: left;
	padding: 9px 10px;
}

ul.grid li div:nth-child(2) {
	padding: 0 10px;
}

ul.grid li div:nth-child(1) {
	height: 65px;
}

ul.grid li div a:hover {
	font-weight: bold;
}
</style>