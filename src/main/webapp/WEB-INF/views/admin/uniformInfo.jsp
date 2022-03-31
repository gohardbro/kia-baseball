<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container-fluid">
		<article id="main" class="special">
			<header>
				<h2>상품 관리</h2>
			</header>

			<section>
				<nav class="navbar navbar-expand-sm">
					<form class="form-inline" action="/">
						<select class="form-control" id="search" style="margin: 10px;">
							<option selected value="uniformName">상품명</option>
							<option value="color">색상</option>
							<option value="playerName">선수명</option>
						</select> <input class="form-control mr-sm-2" type="text" id="word"
							placeholder="Search">
						<button type="button" class="btn btn-info">검색</button>
					</form>
				</nav>
				<form id="update">
					<table class="table table-responsive">
						<thead>
							<tr>
								<th>#</th>
								<th>상품명</th>
								<th>색상</th>
								<th>사이즈</th>
								<th>선수명</th>
								<th>가격</th>
								<th>수량</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ uniformInfoList }" var="uniformInfo">
								<tr>
									<td>${ uniformInfo.uniInfoNo }<input type="hidden"
										name="uniInfoNo" value="${ uniformInfo.uniInfoNo }" /></td>
									<td style="width: 30%"><input type="text"
										name="uniformName" value="${ uniformInfo.uniformName }"
										class="form-control" /></td>
									<td><input type="text" name="color"
										value="${ uniformInfo.color }" class="form-control" /></td>
									<td><input type="text" name="uniformSize"
										value="${ uniformInfo.uniformSize }" class="form-control" /></td>
									<td><input type="text" name="playerName"
										value="${ uniformInfo.playerName }" class="form-control" /></td>
									<td><input type="text" name="price"
										value="${ uniformInfo.price }" class="form-control" /></td>
									<td><input type="text" name="uniformCnt"
										value="${ uniformInfo.uniformCnt }" class="form-control" /></td>
									<td style="width: 7%"><button type="submit"
											class="btn btn-warning">수정</button></td>
								</tr>
							</c:forEach>
							<tr>
								<td><span class="glyphicon glyphicon-plus"></span></td>
								<td><input type="text" name="uniformName"
									class="form-control" /></td>
								<td><input type="text" name="color" class="form-control" /></td>
								<td><input type="text" name="uniformSize"
									class="form-control" /></td>
								<td><input type="text" name="playerName"
									class="form-control" /></td>
								<td><input type="text" name="price" class="form-control" /></td>
								<td><input type="text" name="uniformCnt"
									class="form-control" /></td>
								<td><button type="submit" class="btn btn-primary">등록</button></td>
							</tr>
						</tbody>
					</table>
				</form>
				<form id="insert">
					<table class="table table-responsive">
						<tbody>

						</tbody>
					</table>
				</form>
			</section>
		</article>
	</div>
</div>

<script>
	$(".btn-info").click(function(e) { // 검색 버튼 클릭
		var type = $("#search").val();
		var word = $("#word").val();
		console.log(type);
		console.log(word);

		$.ajax({
			url : "/admin/uniformInfo/search",
			data : {
				"type" : type,
				"word" : word,
			}
		}).done(function(data) {
			console.log(data);
			$(".table").html(data);
		});
	});
</script>

<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />