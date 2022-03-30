<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>라인업</h2>
			</header>

			<section>
				<select name="cars" class="custom-select" style="width: 180px;">
					<option selected>== 경기 날짜 ==</option>
					<option value="2022-04-02">2022-04-02</option>
					<option value="2022-04-03">2022-04-03</option>
					<option value="2022-04-05">2022-04-05</option>
				</select>

				<form action="">
					<table class="table">
						<tr>
							<th>선발 투수</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>1번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>2번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>3번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>4번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>5번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>6번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>7번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>8번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>9번 타자</th>
							<td><input type="text" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><button
									type="button" class="btn btn-info">등록</button></td>
						</tr>
					</table>
				</form>
			</section>
		</article>
	</div>
</div>

<style>
table tr th {
	background-color: #E8F5FF;
	width: 100px;
	text-align: center;
}

table {
	margin: 10px;
}
</style>


<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />