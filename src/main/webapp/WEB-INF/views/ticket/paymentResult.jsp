<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/ticket/include/top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
				<div class="shadow-lg p-4 mb-4 bg-white">
					<div style="padding:55px 65px;"> 
					<div>
						<span>기아</span> <span>VS</span> <span>${result.rival}</span>
					</div>
					<div>
						<span>${result.gameDate}</span> <span>${result.gameTime}</span> <span>${result.yoil}</span>
					</div>
					<div>
						<span>${result.baseballZone}존</span> <span>${result.buyerCnt}매(자유석)</span>
					</div>
					</div>
				 </div>
				<div style="margin-top:50px;">
					<h5>경기가 기대된다면 팬들과 소통해보세요!</h5>
				</div>
				<div style="margin-top:20px;">
					<button type="button" onclick="location.href='/free'" style="padding:35px 45px;">자유게시판 GO!</button>
				</div>
			</section>

		</article>
	</div>
 
</body>
</html>


<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />