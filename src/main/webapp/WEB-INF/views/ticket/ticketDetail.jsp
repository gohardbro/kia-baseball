<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/ticket/include/top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<!-- 선택하신 경기 -->
	<div class="container">
		<article id="main" class="special">
			<header id="h2">
				<h2>구역 및 매수 선택</h2>
			</header>
			<c:forEach var="one" items="${oneGame}">
				<table class="table">
					<tbody>
						<tr>
							<td>${one.gameDate}</td>
							<td>${one.gameTime}</td>
							<td>기아타이거즈</td>
							<td><img src="/images/Logo_Mini/KIA.jpg" class="gl-logo" />
							</td>
							<td>VS</td>

							<td><img src="/images/Logo_Mini/${one.teamImg}"
								class="gl-logo" /></td>
							<td id="rival">${one.sponsor}${one.teamName}</td>
							<td>챔피언스필드</td>


						</tr>
					</tbody>
				</table>
			</c:forEach>
	</div>



	좌석 매수 [결제하기]

</body>
</html>
<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />