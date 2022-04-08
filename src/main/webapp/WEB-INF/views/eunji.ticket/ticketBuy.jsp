<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/eunji.ticket/include/top.jsp" />
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
<script type="text/javascript" src="/assets/js/todayLabel.js"></script>
<style>
img.gl-logo {
	width: 60px;
}

#rival {
	width: 150px;
	text-align: left;
}

#h2 {
	margin-bottom: 100px;
}
</style>
</head>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header id="h2">
				<h2>경기 선택</h2>
			</header>
			<article id="gameSelect" class="special">



				<!-- gamelist + button[예매하기] -->
				<div class="container">
					<table class="table table-hover">
						<tbody>
							<c:forEach var="gl" items="${gameList}" varStatus="status">
								<input type="hidden" id="idx" value="${status.count }">
								<tr>
									<td>${gl.gameDate}</td>
									<td class="disp_week" data-value="${gl.gameDate}"></td>
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
							</c:forEach>
						</tbody>
					</table>
					<script type="text/javascript">
						$(".disp_week").each(function(){
							var v = $(this).data("value");
							$(this).text(getInputDayLabel(v));
						})	
					</script>
				</div>


			</article>
		</article>
	</div>
</div>





<jsp:include page="/WEB-INF/views/eunji.ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />