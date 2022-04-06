<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/ticket/include/top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>



</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>경기장 구역별 좌석 및 예매권 안내</h2>
			</header>


			<!-- 좌석img와 요금table 가로로 나란히 배치  -->
			<!-- 구역별 좌석 img -->
			<div class="row">
				<div class="col">
					<div class="seatImg">
						<a class="image centered"><img src="images/zone.jpg"
							alt="구역별 좌석 및 예매권 안내" /></a>
					</div>
				</div>

				<!-- 좌석별 요금 테이블 -->
				<div class="col">
					<table>
						<c:forEach var="gl" items="${gameList}">
							<tr>
								<td></td>
								<td>주중</td>
								<td>주말</td>
							</tr>
							<tr>
								<%-- <td>${seat.color}</td> --%>
								<td>${seat.baseballZone}</td>
								<td>${seat.priceWeekday}</td>
								<td>${seat.priceWeekend}</td>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>
		</article>
	</div>
</div>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />