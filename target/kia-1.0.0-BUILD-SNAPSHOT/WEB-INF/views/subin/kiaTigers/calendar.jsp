<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/subin/kiaTigers/include/top.jsp" />

 <script src="/assets/js/bootstrap.bundle.min.js"></script>
<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>경기 일정</h2>
			</header>

			<section>
				<nav class="navbar navbar-expand-sm" style="max-width: 1175px">
					<input type="month" class="form-control" name="gameMonth"
						id="gameMonth" style="width: 20%; margin: 5px;">
				</nav>

				<table class="table table_calender">
					<colgroup>
						<col width="14.2%">
						<col width="14.2%">
						<col width="14.2%">
						<col width="14.2%">
						<col width="14.2%">
						<col width="14.2%">
						<col width="14.2%">
					</colgroup>
					<thead>
						<tr>
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>
					</thead>
					<tbody class="date"></tbody>
				</table>

			</section>
		</article>
	</div>
</div>

<script>
	//input 현재 날짜 입력
	var dt = new Date();
	var Year = dt.getFullYear().toString();
	var Month = "" + (dt.getMonth() + 1);
	if (Month.length < 2)
		Month = "0" + Month;
	$("#gameMonth").val(Year + "-" + Month);

	var db;
	$(function() { // 페이지 로딩시 자동 실행
		db = printCalendar($("#gameMonth").val());
		_html = printDate($("#gameMonth").val(), db);
		$(".date").html(_html);
	});

	$("#gameMonth").change(function(e) { // Month 목록값이 바뀌면
		db = printCalendar($("#gameMonth").val());
		_html = printDate($("#gameMonth").val(), db);
		$(".date").html(_html);
	});

	function printCalendar(gameMonth) {
		var ajaxData;
		$.ajax({
			url : "/kiaTigers/calendar/search",
			data : {
				"gameMonth" : gameMonth
			},
			async : false,
		}).done(function(data) {
			ajaxData = data;
		});
		return ajaxData;
	}
</script>
<script src="/assets/js/calendar.js"></script>

<style>
.table_calendar {
	margin-top: 0;
	width: 100%;
	text-align: center;
}

.table thead th {
	background-color: #e4e5e6;
	text-align: center;
}

.table tbody td {
	position: relative;
	height: 180px;
	border-left: 1px solid #e4e5e6;
	border-right: 1px solid #e4e5e6;
	border-bottom: 1px solid #e4e5e6;
	vertical-align: top;
	padding-top: 25px;
}

.table tbody td p {
	text-align: center;
}

.lineup ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.lineup ul li p {
	text-align: center;
}

.score-table {
	border: 1px solid #e4e5e6;
	border-collapse: collapse;
	margin-bottom: 40px;
}

.score-table th, .score-table td {
	text-align: center;
}

.score-table th {
	background-color: #f6f6f6;
}

.modal-body h3 {
	text-align: center;
}
</style>
				
<jsp:include page="/WEB-INF/views/subin/kiaTigers/calendar-popup.jsp" /><!-- 팝업 -->
<jsp:include page="/WEB-INF/views/subin/kiaTigers/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />