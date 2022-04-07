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
img.gl-logo {
	width: 60px;
}

#rival {
	width: 150px;
	text-align: left;
}
</style>
</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header id="h2">
				<h2>경기 선택</h2>
				<p>경기 일자 일주일 전부터 </p>
			</header>
			<article id="gameSelect" class="special">



				<!-- gamelist + button[예매하기] -->
				<div class="container">
					<c:forEach var="gl" items="${gameList}">
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>${gl.gameDate}</td>
									<td>${gl.gameTime}</td>
									<td>기아타이거즈</td>
									<td><img src="/images/Logo_Mini/KIA.jpg" class="gl-logo" />
									</td>
									<td>VS</td>

									<td><img src="/images/Logo_Mini/${gl.teamImg}"
										class="gl-logo" /></td>
									<td id="rival">${gl.sponsor}${gl.teamName}</td>
									<td>챔피언스필드</td>
									<td id="gl-btn">
										<button type="button"
											onclick="location.href='/ticketDetail?scheduleNo=${gl.scheduleNo}'">예매하기</button>
									</td>

								</tr>
							</tbody>
						</table>
					</c:forEach>
				</div>


			</article>
		</article>
	</div>
</div>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />