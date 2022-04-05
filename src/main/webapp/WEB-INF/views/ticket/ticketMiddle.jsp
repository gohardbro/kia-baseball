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
		<article id="main" class="special">
			<header>
				<h2>
					<a> 구역/매수 선택</a>
				</h2>
			</header>

 
			<section>
				<div id="glTable">
					<!-- gamelist + button[예매하기] -->
					<table>
						<c:forEach var="gl" items="${gameList}">
							<tr>
								<td>${gl.gameDate}</td>
								<td>${gl.gameTime}</td>
								<td>기아타이거즈</td>
								<td>
								<img src="/images/Logo_Mini/KIA.jpg" class="gl-logo" />
								</td>
	
								<td>VS</td>

								<td>
								<img src="/images/Logo_Mini/${gl.teamImg}" class="gl-logo" />
								</td> 
								<td>${gl.sponsor}${gl.teamName}</td>
								<td>챔피언스필드</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</section>
			
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