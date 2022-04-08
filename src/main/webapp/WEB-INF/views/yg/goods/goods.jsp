<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />


<div class="wrapper style1">

	<div class="container">
		<h2>KIA UNIFORMS</h2>
		<div class="goods-list">
				<div class="_align">
					<ul>
						<li><input type="radio" id="sort1" class="radio" name="sort">
							<label for="sort1" class="on">추천순</label></li>
						<li><input type="radio" id="sort2" class="radio" name="sort">
							<label for="sort2" class="on">판매인기순</label></li>
						<li><input type="radio" id="sort3" class="radio" name="sort">
							<label for="sort3" class="on">낮은가격순</label></li>
						<li><input type="radio" id="sort4" class="radio" name="sort">
							<label for="sort4" class="on">높은가격순</label></li>
						<li><input type="radio" id="sort5" class="radio" name="sort">
							<label for="sort5" class="on">상품평순</label></li>
						<li><input type="radio" id="sort6" class="radio" name="sort">
							<label for="sort6" class="on">등록일순</label></li>
					</ul>
				</div>
			<div class="item-display type-gallery">
				<div class="_list">
					<ul>
						<li style="width: 25%">
							<div>이미지</div> <span class="hot"></span>
							<div class="goods-info">
								<div>
									<a href="/info">이미지 상세보기</a>
								</div>
								<div class="price">
									<span class="cost"> <strong>29,000</strong> "원"
									</span>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</div>

<jsp:include page="/WEB-INF/views/yg/goods/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />