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

#zoneTable {
  width : 80%;

}

#zoneTable, td {
	padding: 15px; 
	border-bottom : 2px solid ;
	border-bottom-color : #E0E0E0;
	border-collapse: collapse;
	font-size: 16px;
	font-weight: number 900;
	color : #616161;
	text-align: center;
	}
</style>


</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>경기장 구역별 좌석 및 예매권 안내</h2>
			</header>



			<!-- 구역별 좌석 img -->
			<section>
				<div class="seatImg">
					<a class="image centered"><img src="images/zone.jpg"
						alt="구역별 좌석 및 예매권 안내" /></a>
				</div>
			</section>

			<!-- 좌석별 요금 테이블 -->
			<section>
				<table id="zoneTable">
					<tr>
						<td></td>
						<td>주중</td>
						<td>주말</td>
					</tr>
					<tr>
						<td>니로</td>
						<td>10000</td>
						<td>12000</td>
					</tr>
					<tr>
						<td>K5</td>
						<td>10000</td>
						<td>12000</td>
					</tr>
					<tr>
						<td>K8</td>
						<td>12000</td>
						<td>14000</td>
					</tr>
					<tr>
						<td>K9</td>
						<td>14000</td>
						<td>16000</td>
					</tr>
					<tr>
						<td>스포티지</td>
						<td>16000</td>
						<td>18000</td>
					</tr>
					<tr>
						<td>K3</td>
						<td>8000</td>
						<td>10000</td>
					</tr>
				</table>
			</section>


		</article>
	</div>
</div>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />