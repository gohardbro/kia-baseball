<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>상품 관리</h2>
			</header>

			<section>
				<nav class="navbar navbar-expand-sm">
					<form class="form-inline" action="/">
						<select class="form-control" id="sel1" style="margin: 10px;">
							<option>-- 선택 --</option>
							<option>상품명</option>
							<option>색상</option>
							<option>선수명</option>
						</select>
						
						<input class="form-control mr-sm-2" type="text"
							placeholder="Search">
						<button type="button" class="btn btn-info">검색</button>
					</form>
				</nav>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>상품명</th>
							<th>색상</th>
							<th>사이즈</th>
							<th>선수명</th>
							<th>가격</th>
							<th>수량</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>어센틱</td>
							<td>화이트</td>
							<td>M</td>
							<td>김선빈</td>
							<td>85,000</td>
							<td>29</td>
						</tr>
					</tbody>
				</table>
			</section>
		</article>

	</div>

</div>

<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />