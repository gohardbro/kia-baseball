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


<style>
#glTable, th, td {
	border: 1px solid#;
}

.gl-logo {
	width: 70px;
	height: 70px;
	object-fit: scale-down;
}
</style>


</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="ticketMain" >
			<header>
				<h2>
					<a>경기장 구역별 좌석 및 예매권 안내</a>
				</h2>
			</header>


			<!-- 구역별 좌석 img -->
			<section>
				<div class="seatImg">
					<a id="seatInfo"><img src="images/pic06.jpg"
						alt="구역별 좌석 및 예매권 안내" /></a>
				</div>
			</section>
			
			<!-- 좌석별 요금 테이블 -->
			<section>
			
			</section>
			
		
		</article>
	</div>
</div>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />