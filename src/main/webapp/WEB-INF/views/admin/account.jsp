<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>계정 관리</h2>
			</header>

			<section>
				<select id="accountType" class="custom-select" style="width: 150px;">
					<option selected value="all">모든 회원</option>
					<option value="normal">정상 회원</option>
					<option value="reportCnt">신고 회원</option>
					<option value="report">차단 회원</option>

				</select>
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
						<c:forEach items="${ accountList }" var="account">
							<tr class="${ account.reportCnt >= 3? 'table-danger': ''}">
								<td>${ account.id }</td>
								<td>${ account.name }</td>
								<td>${ account.nickname }</td>
								<td>${ account.point }</td>
								<td><fmt:formatDate value="${ account.joinDate }"
										pattern="yyyy-MM-dd" /></td>
								<td>${ account.report eq 'N'? '정상': '차단' }</td>
								<td>${ account.reportCnt  }</td>
								<td><c:if
										test="${ account.reportCnt >= 3 && account.report eq 'N'}">
										<a href="/admin/account/report?id=${ account.id }"
											style="color: red;">차단</a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</article>
	</div>
</div>

<script>
$("#accountType").change(function (e){ // 회원 목록박스 값이 바뀌면
	$.ajax({
		url: "/admin/account",
		data: {
			"type": $("#accountType").val()
		}
	}).done(function(data){
		$(".table").html(data);
	});
});
</script>
<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />