<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<div class="container mb-5">
	<form action='<c:url value="/info"/>' method="post">
		<input type="hidden" name="uniInfoNo" value="${uniInfo.uniInfoNo }" />
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
					<th>구매수량</th>
					<td><input type="number" name="uniCnt" min="1"></td>
				</tr>
				<tr>
					<th>원산지</th>
					<td>대한민국</td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td><select name="uniSize">
							<option>S</option>
							<option>M</option>
							<option>L</option>
							<option>XL</option>
					</select></td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><select name="playerNo">
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
					<th>합계</th>
					<td><input type="text" name="total" readonly></td>
				</tr>
			</table>
		</div>
		<div>
			<button type="submit"
				onclick="location.href='/info?uniInfoNo=${uniInfo.uniInfoNo }'">구매하기</button>
			<button type="button" onclick="location.href='/goods'">목록</button>
			<button type="submit"
				onclick="location.href='/basket?uniInfoNo=${uniInfo.uniInfoNo}'">장바구니
			</button>
		</div>
	</form>
</div>

<script>
	var number = document.getElementById('number');

	number.onkeydown = function(e) {
		if (!((e.keyCode > 95 && e.keyCode < 106)
				|| (e.keyCode > 47 && e.keyCode < 58) || e.keyCode == 8)) {
			return false;
		}
	}
	
	var basket = 
		
		
		
</script>

<jsp:include page="/WEB-INF/views/yg/goods/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />