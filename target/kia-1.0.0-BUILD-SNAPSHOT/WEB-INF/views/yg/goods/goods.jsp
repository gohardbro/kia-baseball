<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />


<div class="container mb-5">
	<div>
		<h2 class="mt-3">KIA UNIFORMS</h2>
		<div>
			<ul class="list-group list-group-horizontal my-1">
				<li class="list-group-item">추천순</li>
				<li class="list-group-item">판매인기순</li>
				<li class="list-group-item">낮은가격순</li>
				<li class="list-group-item">높은가격순</li>
				<li class="list-group-item">상품평순</li>
				<li class="list-group-item">등록일순</li>
			</ul>
			<div class="row mt-1">
				<c:forEach var="uniInfo" items="${uniInfo }">
					<div class="col-sm-3">
						<div class="card" style="width: 100%; height: 100%">
							<img class="card-img-top" src="/images/uniform/${uniInfo.uniformImg }" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">
								<a href="/info?uniInfoNo=${uniInfo.uniInfoNo }">${uniInfo.uniformName }</a></h5>
								<p class="card-text">
									<strong>${uniInfo.price}</strong>원
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<ul class="pagination mt-4">
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
		</ul>
	</div>
</div>

<jsp:include page="/WEB-INF/views/yg/goods/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />