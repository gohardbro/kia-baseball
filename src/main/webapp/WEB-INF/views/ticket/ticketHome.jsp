<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

</style>


</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>
					<a>경기 좌석도 안내 및 예매</a>
				</h2>
				<p>[!] 제휴카드 할인을 받으실경우 KIA TIGERS 공식 홈페이지에서 예매 가능 합니다.</p>
			</header>
			
			
			<!-- accordian -->
			<section>
			<div class="accordion accordion-flush" id="accordionFlushExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
							aria-expanded="false" aria-controls="flush-collapseOne">
							구역별 좌석 및 예매권 안내</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse collapse"
						aria-labelledby="flush-headingOne"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<a id="seatInfo"><img src="images/pic06.jpg"
						alt="구역별 좌석 및 예매권 안내" /></a> 
						</div>
					</div>
				</div>
			 </div>
			 </section>
			 <!-- accordian end-->
		<section>
		
		<table>
		<c:forEach ${} ></c:forEach>
		
		</table>
		
		</section>
		</article>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />