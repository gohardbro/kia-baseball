<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>
					<a href="#">티켓 예매내역</a>
				</h2>
			</header>

			<section>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>경기 날짜</th>
							<th>경기 시간</th>
							<th>구매자</th>
							<th>구역</th>
							<th>수량</th>
							<th>금액</th>
							<th>구매 일자</th>
							<th>취소/환불</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2022-04-02</td>
							<td>14:00</td>
							<td>홍길동</td>
							<td>K5</td>
							<td>3</td>
							<td>68,000</td>
							<td>2022-03-30</td>
						</tr>
					</tbody>
				</table>
			</section>
		</article>

	</div>

</div>


<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />