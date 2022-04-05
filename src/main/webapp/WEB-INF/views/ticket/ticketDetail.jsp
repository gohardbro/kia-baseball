<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
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
</style>


</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="detail" class="special">
			<header>
				<h2>
					<a> 구역/매수 선택</a>
				</h2>
			</header>

			<section>

				<div class="container">
					<div class="item">구역</div>
					<div class="item">매수</div>
					<div class="item">결제하기 버튼</div>

				</div>

			</section>



		</article>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />