<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table" style="margin: 10px;">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>포인트</th>
			<th>가입일자</th>
			<th>상태</th>
			<th colspan="2">신고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ page.accountList }" var="account">
			<tr class="${ account.reportCnt >= 3 && account.report eq 'N'? 'table-danger': ''}">
				<td>${ account.id }</td>
				<td>${ account.name }</td>
				<td>${ account.nickname }</td>
				<td>${ account.point }</td>
				<td><fmt:formatDate value="${ account.joinDate }"
						pattern="yyyy-MM-dd" /></td>
				<td>${ account.report eq 'N'? '정상': '차단' }</td>
				<td>${ account.reportCnt  }</td>
				<td><c:if test="${ account.reportCnt >= 3 && account.report eq 'N'}">
						<a href="/admin/account/report?id=${ account.id }"
							style="color: red;">차단</a>
					</c:if>
					<c:if test="${ account.report eq 'Y' }">
						<a href="/admin/account/noReport?id=${ account.id }"
							style="color: red;">취소</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 페이지 버튼 -->
<div class='btnSet'>
	<jsp:include page="/WEB-INF/views/subin/admin/include/page.jsp" />
</div>