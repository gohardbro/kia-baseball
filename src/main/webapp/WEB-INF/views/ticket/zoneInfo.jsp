<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/ticket/include/top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>
.seatImg img {
	width: 120%;
	padding-right: 30px;
}

#h2 {margin-bottom: 100px;}

</style>
</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header id="h2">
				<h2>경기장 구역별 좌석 및 예매권 안내</h2>
			</header>


			<!-- 좌석img와 요금table 가로로 나란히 배치  -->
			<!-- 구역별 좌석 img -->
			<div class="row">
				<div class="col">
					<div class="seatImg">
						<a class="seatImg"><img src="images/zone.jpg"
							alt="구역별 좌석 및 예매권 안내" /></a>
					</div>
				</div>

				<!-- 좌석별 요금 테이블 -->
				<div class="col">
					<div class="container">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th></th>
									<th>주중</th>
									<th>주말</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="st" items="${priceTable}">
								<tr>
									<td>${st.baseballZone }</td>
									<td>${st.priceWeekday }</td>
									<td>${st.priceWeekend }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</article>
	</div>
</div>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />