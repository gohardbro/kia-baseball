<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<div class="container mb-5">
	<form method="post">
		<div class="mt-3">
			<h2>${uniInfo.uniformName }</h2>
		</div>
		<div>
			<img src="/images/uniform/${uniInfo.uniformImg }" class="float-right">
		</div>
		<div>
			<table class="goodsInfo">
				<tr>
					<th>정가</th>
					<td>${uniInfo.price }</td>
				</tr>
				<tr>
					<th>판매가</th>
					<td>${uniInfo.price }</td>
				</tr>
				<tr>
					<th>구매제한</th>
					<td>최소 1개</td>
				</tr>
				<tr>
					<th>원산지</th>
					<td>대한민국</td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td><select>
							<option id="ssize">S</option>
							<option id="msize">M</option>
							<option id="lsize">L</option>
							<option id="xlsize">XL</option>
					</select><input type="hidden" id="sizeCheck" value="${size }"></td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><select>
							<c:forEach var="plyer" items="${plyer }">
								<option>${plyer.no }</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>

		</div>
		<div>
			<table>
				<tr>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</table>
		</div>
	</form>
	<div>
		<button type="button" onclick="location.href='/#'">구매하기</button>
		<button type="button"
			onclick="location.href='/basket?uniInfoNo=${uniInfo.uniInfoNo}'">장바구니
		</button>
		<button type="button" onclick="location.href='/goods'">목록</button>
	</div>
</div>
<div>
	<div>
		<div>

			<script>
				
			</script>

			<jsp:include page="/WEB-INF/views/yg/goods/include/bottom.jsp" />
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />