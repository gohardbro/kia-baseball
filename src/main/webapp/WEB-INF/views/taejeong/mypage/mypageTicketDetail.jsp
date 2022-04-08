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
	border-top: 1px solid #e1e4e6;
	border-bottom: 1px solid #e1e4e6;
}

td {
	font-size: 13px;
	text-align: center;
	padding: 10px 0px;
	border-top: 1px solid #e1e4e6;
	border-bottom: 1px solid #e1e4e6;
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

.cancelBtn {
	text-align: center;
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
					<h5>예매한 티켓정보</h5>
					<div>
						<table>
							<colgroup>
								<col style="width: 100px;">
								<col style="width: 150px;">
								<col style="width: 100px;">
								<col style="width: 150px;">
							</colgroup>
							<tbody>
								<c:forEach items="${ticketList }" var="ticketList"
									varStatus="status">
									<tr>
										<th>티켓명</th>
										<td>KIA Tigers vs ${ticketList.rival }</td>
										<th>예매자</th>
										<td>${ticketList.buyer }</td>
									</tr>
									<tr>
										<th>경기일시</th>
										<td>${ticketList.gameDate }${ticketList.gameTime }</td>
										<th>장소</th>
										<td>${ticketList.gameDate }</td>
									</tr>
									<tr>
										<th>좌석</th>
										<td>${ticketList.baseballZone }</td>
										<th>티켓수령 방법</th>
										<td>몰라</td>
									</tr>
									<tr>
										<th>예매일</th>
										<td>${ticketList.buyDate }</td>
										<th>현재상태</th>
										<td>결제완료했겠지</td>
									</tr>
									<tr>
										<th>결제수단</th>
										<td>신용카드했겠지</td>
										<th></th>
										<td colspan="2"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="cancelBtn">
							<c:forEach items="${ticketList }" var="ticketList"
								varStatus="status">
								<a type="button" class="btn btn-secondary" id="cancelBtnA"
									href="/ticket/ticketCancel?baseballNo=${ticketList.baseballNo}">취소하기</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;">빈컬럼</div>
</div>
<script>
	/* 취소하기 버튼클릭시 성공여부 alert */
	$("#cancelBtnA").click(function(){
		var ticketCancelMsg = ${ticketCancelMsg};
		if(ticketCancelMsg != null)
			alert(ticketCancelMsg);
		else
			alert("티켓취소를 실패했습니다.");
			
	});

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