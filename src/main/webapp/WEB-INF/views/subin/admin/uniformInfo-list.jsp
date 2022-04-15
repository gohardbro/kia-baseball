
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table">
	<thead>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>색상</th>
			<th>S 수량</th>
			<th>M 수량</th>
			<th>L 수량</th>
			<th>XL 수량</th>
			<th>가격</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ page.uniformInfoList }" var="uniformInfo">
			<tr>
				<td>${ uniformInfo.uniInfoNo }</td>
				<td style="width: 30%">${ uniformInfo.uniformName }</td>
				<td>${ uniformInfo.color }</td>
				<td>${ uniformInfo.sCount }</td>
				<td>${ uniformInfo.mCount }</td>
				<td>${ uniformInfo.lCount }</td>
				<td>${ uniformInfo.xlCount }</td>
				<td>${ uniformInfo.price }</td>
				<td style="width: 7%"><button type="submit" onclick="location.href='/admin/uniformInfo/update?uniInfoNo=${uniformInfo.uniInfoNo}'"
						class="btn btn-warning">수정</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 페이지 버튼 -->
<div class='btnSet'>
	<jsp:include page="/WEB-INF/views/subin/admin/include/page.jsp" />
</div>
