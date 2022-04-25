<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header_main.jsp" />
<div class="container">
	<div class="wrapper">
		<!-- 인기 유니폼 10개 -->
		<section class="carousel">
			<div class="reel">

				<c:forEach items="${ uniformTop10 }" var="uniform"
					varStatus="status">
					<article>
						<a href="#?uniInfoN0=${ uniform.uniInfoNo }" class="image featured"><img
							src="/images/uniform/${ uniform.uniformImg }" alt="" /></a>
						<header>
							<h3>
								<a href="#?uniInfoN0=${ uniform.uniInfoNo }">Top ${status.count }</a>
							</h3>
						</header>
						<p>${ uniform.uniformName }</p>
					</article>
				</c:forEach>

			</div>
		</section>

		<!-- 인기 게시물 top 5 -->
		<section id="content" style="padding: 10; width: 100%; padding: 24px;">
			<h2>인기게시물 Hot 5</h2>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성자</th>
						<th>좋아요</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ boardHot5 }" var="board" varStatus="status">
						<tr>
							<td>${ status.count }</td>
							<td><a href="/boardview?no=${ board.boardNo }" style="color: inherit;">${ board.title }</a></td>
							<td>${ board.writer }</td>
							<td>${ board.likes }</td>
							<td>${ board.views }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<div class="row align-content-center">
			<div class="col-lg-4" onclick="location.href='#'">
				<img src="/images/main_img/player.png" class=" img-fluid" />
			</div>
			<div class="col-lg-4" onclick="location.href='/kiaTigers/calendar'">
				<img src="/images/main_img/calendar.png" class=" img-fluid" />
			</div>
			<div class="col-lg-4" onclick="location.href='/kiaTigers/map'">
				<img src="/images/main_img/map.png" class=" img-fluid" />
			</div>
		</div>
		<div class="row mt-1">
			<div class="col-lg-4" onclick="location.href='/goods'">
				<img src="/images/main_img/goods.png" style="border-radius: 15px"
					class=" img-fluid" />
			</div>
			<div class="col-lg-4"
				onclick="location.href='https://www.instagram.com/always_kia_tigers'">
				<img src="/images/main_img/instagram.png" class="img-fluid" />
			</div>
			<div class="col-lg-4">
				<iframe
					style="border-radius: 15px; height: 100%; max-width: 392px; width: 100%;"
					src="https://www.youtube.com/embed/uj7usIs5JdU"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen class=""></iframe>
			</div>
		</div>
		<table>
			<tr>
				<td onclick="location.href='#'"></td>
				<td onclick="location.href='/kiaTigers/calendar'"></td>
				<td onclick="location.href='/kiaTigers/map'"></td>
			</tr>
			<tr>
				<td onclick="location.href='/goods'"></td>
				<td
					onclick="location.href='https://www.instagram.com/always_kia_tigers'"></td>
				<td></td>
			</tr>
		</table>
	</div>
</div>



<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />