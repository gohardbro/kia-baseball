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
				<h2>상품 등록 관리</h2>
			</header>
			<section>
				<form action="/admin/uniformInfo/insert" method="post" enctype="multipart/form-data" autocomplete="off">
					<table class="table table-responsive d-flex justify-content-center">
						<tr>
							<td rowspan="6"><img
								src="/images/default-profile.png"
								class="mx-auto rounded d-block"
								style="width: 400px; height: 400px" id="profile" />
								<div class="custom-file" style="margin:12px; width: 400px;">
									<input type="file" class="custom-file-input" id="customFile"
										name="attach" accept="image/*"> <label
										class="custom-file-label" for="customFile">파일 선택</label>
								</div></td>
							<th>상품명</th>
							<td style="width: 30%"><input type="text" name="uniformName"
								 class="form-control" /></td>
						</tr>
						<tr>
							<th>색상</th>
							<td><input type="text" name="color" 
								class="form-control" /></td>
						</tr>
						<tr>
							<th>사이즈</th>
							<td><input type="text" name="uniformSize"
								class="form-control" /></td>
						</tr>
						<tr>
							<th>선수명</th>
							<td><input type="text" name="playerName" 
								class="form-control" /></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="price"
								class="form-control" /></td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="text" name="uniformCnt"
								class="form-control" /></td>
						</tr>

						<tr>
							<td colspan="3" style="width: 7%; text-align: center;">
							<button type="button" class="btn btn-info" onclick="location.href='/admin/uniformInfo'">목록으로</button>
							<button type="submit"
									class="btn btn-primary">등록</button></td>
						</tr>
					</table>
				</form>
			</section>
		</article>
	</div>
</div>
<script>
$(".custom-file-input").on("change", function() { // 파일 첨부한 경우
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />