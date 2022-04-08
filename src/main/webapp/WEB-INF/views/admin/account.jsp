
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
				<table class="table" style="margin: 10px;"></table>
				<div class='btnSet'>
					<jsp:include page="/WEB-INF/views/admin/include/page.jsp" />
				</div>
			</section>
		</article>
	</div>
</div>

<script>
$(function() { // 페이지 로딩시 자동 실행
	$.ajax({
		url: "/admin/account",
		data: {
			"type": $("#accountType").val()
		}
	}).done(function(data){
		$(".table").html(data);
	});
});

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