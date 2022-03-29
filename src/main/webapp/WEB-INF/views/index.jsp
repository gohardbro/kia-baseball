<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header_main.jsp" />
<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<div class="row">
			<div class="col-7" id="content" style="pading: 0">
				<!-- 유니폼 카드 10개 작성 -->
				<section class="carousel">
					<div class="reel">
						<article>
							<a href="#" class="image featured"><img
								src="images/pic01.jpg" alt="" /></a>
							<header>
								<h3>
									<a href="#">유니폼1 이름</a>
								</h3>
							</header>
							<p>유니폼1 설명</p>
						</article>
						<article>
							<a href="#" class="image featured"><img
								src="images/pic01.jpg" alt="" /></a>
							<header>
								<h3>
									<a href="#">유니폼2 이름</a>
								</h3>
							</header>
							<p>유니폼2 설명</p>
						</article>
					</div>
				</section>
				<!-- 인기 게시물 top 5 -->
				<section id="content" style="padding: 10; width: 100%;">
					<h2>인기게시물 Top 5</h2>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="#" style="color: inherit;">Anna</a></td>
								<td>Pitt</td>
								<td>35</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="#" style="color: inherit;">Anna</a></td>
								<td>Pitt</td>
								<td>35</td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>


			<!-- 채팅 -->
			<div class="col-5" id="sidebar">
				<h2>실시간 채팅</h2>
				<form>
					<div class="custom-control custom-switch">
						<input type="checkbox" class="custom-control-input" id="switch1">
						<label class="custom-control-label" for="switch1">자동 업데이트</label>
					</div>
					<div style="display: flex; margin: 5px;">
						<input type="text" class="form-control form-control"
							style="width: 80%; margin: 5px;">
						<button type="button" class="btn btn-light"
							style="width: 20%; margin: 5px;">작성</button>
					</div>
				</form>
				<ul style="list-style: none;">
					<li>[user1] 안녕하세요</li>
				</ul>
			</div>
			
		</div>

		<!-- 티켓 정보 -->
		<a href="#" class="image featured"><img
			src="images/home_ticket.jpg" alt="티켓정보" /></a>

		<div class="row">
			<!-- 유튜브 -->
			<article class="col-6 col-12-mobile special">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/uj7usIs5JdU"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</article>

			<!-- 지도 api -->
			<article class="col-6 col-12-mobile special"></article>
		</div>


	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />