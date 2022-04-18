
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
	border-bottom: 1px solid #e3e6e5;
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
	<div class="column side" style="background-color: #f4f4f4;"></div>
	<div class="column middle">
		<div class="row">
			<div class="side_wrapper col-2">
				<jsp:include
					page="/WEB-INF/views/taejeong/include/mypageSideNav.jsp" />
			</div>
			<div class="main_wrapper col-10">
				<div class="titleZone">
					<h3>문의내역</h3>
				</div>
				<div class="main_content">
				
					<div class="divider"></div>
					<div class="selectZone">
						<form action="/inquiry/history" method="post">
							<div class="btn-group" role="group" aria-label="First group">
								<strong>기간별 조회</strong>
								<button type="submit" class="btn btn-outline-secondary"
									id="15dBtn" name="periodBtn" value="15d">15일</button>
								<button type="submit" class="btn btn-outline-secondary"
									id="1monBtn" name="periodBtn" value="1mon">1개월</button>
								<button type="submit" class="btn btn-outline-secondary"
									id="2monBtn" name="periodBtn" value="2mon">2개월</button>
								<button type="submit" class="btn btn-outline-secondary"
									id="4monBtn" name="periodBtn" value="4mon">4개월</button>
							</div>
						</form>
					</div>
					<div class="divider"></div>
					<div>
						<table>
							<colgroup>
								<col style="width: 90px;">
								<col>
								<col style="width: 130px;">
							</colgroup>
							<thead>
								<tr>
									<th>제목</th>
									<th>내용</th>
									<th></th>
									<th>문의일시</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${historyList }" var="historyList"
									varStatus="status">
									<tr>
										<td>${historyList.title }</td>
										<td><a href="/inquiry/historyDetail?${historyList.inquiryNo }">${historyList.content }</a></td>
										<td>${historyList.answer eq 'N' ? "" : "답변완료"  }</td>
										<td>${historyList.writeDate }</td>										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;"></div>
</div>
<script>
	$(".btn-outline-secondary").click(function() {
		$(".btn-outline-secondary").removeClass("active");
		$(this).addClass("active");
	});
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />