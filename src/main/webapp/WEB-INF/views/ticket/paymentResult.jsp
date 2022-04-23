<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/ticket/include/top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
.wrapper {
	display: grid;
	place-items: center;
}
</style>
</head>
<body>

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>결제가 완료 되었어요</h2>
			</header>

			<section class="wrapper">
				 <div>
					<div>
						<span>기아</span> <span>VS</span> <span>${result.rival}</span>
					</div>
					<div>
						<span>${result.gameDate}</span> <span>${result.gameTime}</span> <span>${result.gameDate}요일</span>
					</div>
					<div>
						<span>${result.baseballZone}존</span> <span>${result.buyerCnt}매(자유석)</span>
					</div>
				 </div>
				<h5>경기가 기대된다면 팬들과 소통해보세요!</h5>
				<button type="button" onclick="location.href='/free'">자유게시판 GO!</button>
			</section>

		</article>
	</div>

</body>
</html>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />