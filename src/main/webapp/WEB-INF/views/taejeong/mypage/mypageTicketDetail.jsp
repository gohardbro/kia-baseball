<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
.header {
	background-color: #f1f1f1;
	padding: 30px;
	text-align: center;
	font-size: 35px;
}

/* Create three unequal columns that floats next to each other */
.column {
	float: left;
	padding: 10px;
}

/* Left and right column */
.column.side {
	width: 20%;
}

/* Middle column */
.column.middle {
	width: 60%;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the footer */
.footer {
	background-color: #f1f1f1;
	padding: 10px;
	text-align: center;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media ( max-width : 600px) {
	.column.side, .column.middle {
		width: 100%;
	}
}

th {
	font-size: 14px;
	color: #666666;
	background-color: #f8f8f8;
	text-align: center;
	padding: 14px 0px;
	border-top: 1px solid #c7c7c7;
	border-bottom: 1px solid #c7c7c7;
}

td {
	font-size: 13px;
	text-align: center;
	padding: 10px 0px;
}

.divider {
	height: 30px;
	width: 100%;
}

.selectFrom {
	float: right;
}

.selectBtn {
	display: inline-block;
	padding: 6px 12px;
}

select, option {
	font-size: 14px;
	padding: 0 12px;
}

.titleZone {
	border-bottom: 2px solid #999;
}

.main_wrapper {
	padding: 38px 39px 100px;
}
</style>

<div class="row" style="margin: 0px;">
	<div class="column side" style="background-color: #f4f4f4;">빈컬럼</div>
	<div class="column middle">
		<div class="row">
			<div class="side_wrapper col-2">
				<jsp:include
					page="/WEB-INF/views/taejeong/include/mypageSideNav.jsp" />
			</div>
			<div class="main_wrapper col-10">
				<div class="titleZone">
					<h3>예매확인/취소</h3>
				</div>
				<div class="main_content">
					<p style="font-size: 13px; color: #999; margin: 36px 0 26px;">
						취소하기를 눌러서 예매를 취소하세요.</p>


					<div class="selectZone"></div>
					<div class="divider"></div>
					<div>
						<table>
							<colgroup>
								<col style="width: 90px;">
								<col>
								<col style="width: 135px;">
								<col style="width: 50px;">
								<col style="width: 135px;">
								<col style="width: 100px;">
								<col style="width: 155px;">
							</colgroup>
							<thead>
								<tr>
									<th>티켓명</th>
									<td>d</td>
									<th>예매자</th>
									<td></td>
								</tr>
								<tr>
									<th>경기일시</th>
									<td></td>
									<th>장소</th>
									<td></td>
								</tr>
								<tr>
									<th>좌석</th>
									<td></td>
									<th>티켓수령 방법</th>
									<td></td>
								</tr>
								<tr>
									<th>예매일</th>
									<td></td>
									<th>현재상태</th>
									<td></td>
								</tr>
								<tr>
									<th>결제수단</th>
									<td></td>
									<th></th>
									<td colspan="2"></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;">빈컬럼</div>
</div>
<script>
	/* 예매취소 가능일 계산 */
	function calCancelDate() {
		var strDate = $("gameDate").val();
		var arr = strDate.split('-');
		var dat = new Date(arr[0], arr[1], arr[2]);
		dat.setDate(dat.getDate() - 1);
		$(".cancelDate").text(dat);
	}

	$(function() {
		$('td[onload]').trigger('onload');
	});

	$(".btn-outline-secondary").click(function() {
		$(".btn-outline-secondary").removeClass("active");
		$(this).addClass("active");
	});
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />