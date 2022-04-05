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
</style>

<div class="row">
	<div class="col side" style="background-color: #f4f4f4;">빈컬럼</div>
	<div class="column middle">
		<div class="row">
			<div class="side_wrapper col-2">
				<jsp:include
					page="/WEB-INF/views/taejeong/include/mypageSideNav.jsp" />
			</div>
			<div class="main_wrapper col-10">
				<div>
					<h4>예매확인/취소</h4>
				</div>
				<div class="main_content">
					<p>
						<span>예매번호</span>를 클릭하면 예매 상세 내용을 확인할 수 있습니다.
					</p>


					<div class="selectZone">
						<div class="btn-group" role="group" aria-label="First group">
							<strong>기간별 조회</strong>
							<button type="button" class="btn btn-outline-secondary" id="15dBtn">15일</button>
							<button type="button" class="btn btn-outline-secondary" id="1monBtn">1개월</button>
							<button type="button" class="btn btn-outline-secondary" id="2monBtn">2개월</button>
							<button type="button" class="btn btn-outline-secondary" id="3monBtn">3개월</button>
						</div>

						<form class="selectFrom" action="/ticket/search" method="get">
							<strong>월 별 조회</strong> 
							<select class="selectBtn" name="dateTypeSelect" style="width: 85px;">
								<option value="예매일" class="">예매일</option>
								<option value="관람일" class="">경기일</option>
							</select> 
							<select class="selectBtn" name="yearSelect" style="width: 90px;">
								<!-- 바꿔: 이번년도 부터 -3년도 까지 자동계산으로 바꾸기  -->
								<option value="연도" class="">연도</option>
								<option value="2022" class="">2022년</option>
								<option value="2021" class="">2021년</option>
								<option value="2020" class="">2020년</option>
							</select> 
							<select class="selectBtn" name="monSelect" style="width: 70px;">
								<option value="" class="">월</option>
								<option value="01" class="">1월</option>
								<option value="02" class="">2월</option>
								<option value="03" class="">3월</option>
								<option value="04" class="">4월</option>
								<option value="05" class="">5월</option>
								<option value="06" class="">6월</option>
								<option value="07" class="">7월</option>
								<option value="08" class="">8월</option>
								<option value="09" class="">9월</option>
								<option value="10" class="">10월</option>
								<option value="11" class="">11월</option>
								<option value="12" class="">12월</option>
							</select>
							<button type="submit" class="btn btn-success">조회</button>
						</form>

					</div>
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
									<th>예매번호</th>
									<th>티켓명</th>
									<th>경기일시</th>
									<th>매수</th>
									<th>구매일시</th>
									<th>취소가능일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2</td>
									<td>KIA Tigers vs 한화</td>
									<td>2022-04-02 18:00</td>
									<td>3장</td>
									<td>22/04/01</td>
									<td>22/03/28 까지</td>
									<td>결제완료</td>
								</tr>
								<c:forEach items="${ticketList }" var="ticketList">
									<tr>
										<td>${ticketList.baseballNo }</td>
										<td>KIA Tigers vs ${ticketList.rival }</td>
										<td>${ticketList.gameDate } ${ticketList.gameTime }</td>
										<td>${ticketList.buyerCnt }장</td>
										<td>${ticketList.buyDate }</td>
										<td>22/03/28 까지</td>
										<td>결제완료</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;">빈컬럼</div>
</div>
<script>
	/* $(".btn-outline-secondary").click(function() {
		alert("hi");
	}); */

	$(".btn-outline-secondary").click(function() {
		$(".btn-outline-secondary").removeClass("active");
		$(this).addClass("active");
	});
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />