
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/subin/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container-fluid">
		<article id="main" class="special">
			<header>
				<h2>상품 수정 관리</h2>
			</header>
			<section>
				<form action="/admin/uniformInfo/update" method="post" enctype="multipart/form-data" autocomplete="off">
					<input type="hidden" name="uniInfoNo" value="${ uniformInfo.uniInfoNo }"/>
					<table class="table table-responsive d-flex justify-content-center">
						<tr>
							<td rowspan="8"><img
								src="/images/uniform/${ uniformInfo.uniformImg }"
								class="mx-auto rounded d-block"
								style="width: 400px; height: 400px" id="profile" />
								<div class="custom-file" style="margin:12px; width: 400px;">
									<input type="file" class="custom-file-input" id="customFile" value="${ uniformInfo.uniformImg }"
										name="attach" accept="image/*"> <label
										class="custom-file-label" for="customFile">파일 선택</label>
								</div></td>
							<th style="width: 15%">상품명</th>
							<td style="width: 50%"><input type="text" name="uniformName"
								value="${ uniformInfo.uniformName }" class="form-control" /></td>
						</tr>
						<tr>
							<th>색상</th>
							<td><input type="text" name="color" value="${ uniformInfo.color }"
								class="form-control" /></td>
						</tr>
						<tr>
						<tr>
							<th>S 수량</th>
							<td><input type="text" name="sCount" value="${ uniformInfo.sCount }"
								class="form-control" /></td>
						</tr>
						<tr>
							<th>M 수량</th>
							<td><input type="text" name="mCount" value="${ uniformInfo.mCount }"
								class="form-control" /></td>
						</tr>
						<tr>
							<th>L 수량</th>
							<td><input type="text" name="lCount" value="${ uniformInfo.lCount }"
								class="form-control" /></td>
						</tr>
						<tr>
							<th>XL 수량</th>
							<td><input type="text" name="xlCount" value="${ uniformInfo.xlCount }"
								class="form-control" /></td>
						</tr>
						
						<tr>
							<th>가격</th>
							<td><input type="text" name="price" value="${ uniformInfo.price }"
								class="form-control" /></td>
						</tr>

						<tr>
							<td colspan="3" style="width: 7%; text-align: center;">
								<button type="button" class="btn btn-info" onclick="location.href='/admin/uniformInfo'">목록으로</button>
								<button type="submit" class="btn btn-warning">수정</button>
								<button type="button" class="btn btn-warning" onclick="location.href='/admin/uniformInfo/delete?uniInfoNo=${uniformInfo.uniInfoNo}'">삭제</button>
							</td>
						</tr>
					</table>
				</form>
			</section>
		</article>
	</div>
</div>
<script>
	$(".custom-file-input").on( "change", function() { // 사진 파일 미리보기
		var fileName = $(this).val().split("\\").pop();
		$(this).siblings(".custom-file-label").addClass("selected")
				.html(fileName);
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#profile").attr("src", e.target.result);
		}

		reader.readAsDataURL(this.files[0]);
	});

	$("#profile").on("click", function(){ // 사진 클릭시 파일 업로드 창
		$("#customFile").click();
	});
</script>

<jsp:include page="/WEB-INF/views/subin/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />