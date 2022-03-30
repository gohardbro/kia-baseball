<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>계정 관리</h2>
			</header>

			<section>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>포인트</th>
							<th>가입일자</th>
							<th>신고</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>hong</td>
							<td>홍길동</td>
							<td>hh</td>
							<td>55</td>
							<td>2022-03-01</td>
							<td>3</td>
						</tr>
						<tr class="table-danger">
							<td>2</td>
							<td>hong</td>
							<td>홍길동</td>
							<td>hh</td>
							<td>55</td>
							<td>2022-03-01</td>
							<td>3</td>
							<td><button type="button" class="btn btn-danger">탈퇴</button>
							</td>
						</tr>
					</tbody>
				</table>
			</section>
		</article>

	</div>

</div>

<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />