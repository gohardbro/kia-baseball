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
					<nav class="navbar navbar-expand-sm d-flex justify-content-between" style = "max-width : 1175px">
						<form class="form-inline" action="/">
							<select class="form-control" id="search" style="margin: 10px;">
								<option selected value="uniformName">상품명</option>
								<option value="color">색상</option>
							</select>
							<input class="form-control mr-sm-2" type="text" id="word" placeholder="Search">
							<button type="button" class="btn btn-info">검색</button>
						</form>
					<button type="button" class="btn btn-primary" onclick="location.href='/admin/uniformInfo/insert'">등록</button>
					</nav>

				<table class="table table-responsive"></table>
			</section>
		</article>
	</div>
</div>

<script>
	$(function() { // 페이지 로딩시 자동 실행
		$.ajax({
			url : "/admin/uniformInfo/search",

		}).done(function(data) {
			$(".table").html(data);
		});
	});

	$(".btn-info").click(function(e) { // 검색 버튼 클릭
		searchUniformInfo();
	});
		
	$("#word").on("keydown", function(e){ // 입력창에서 엔터 누른 경우
		var code = e.keyCode || e.which;
		if (code == 13) { // 엔터 입력 시 
			searchUniformInfo();
			return false;
		}
	}); 
	
	function searchUniformInfo(){ // 키워드 검색
		var type = $("#search").val();
		var word = $("#word").val();

		$.ajax({
			url : "/admin/uniformInfo/search",
			data : {
				"type" : type,
				"word" : word,
			}
		
		}).done(function(data) {
			$(".table").html(data);
		});
	}
</script>

<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />