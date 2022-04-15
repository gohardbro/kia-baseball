<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<div class="container">
	<form method="post">
		<div>
			<h2>장바구니</h2>
			<table>
				<thead>
					<tr>
						<th>상품/옵션 정보</th>
						<th>수량</th>
						<th>상품금액</th>
						<th>할인/적립</th>
						<th>합계금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${uniform }<br>사이즈 : 100</td>
						<td>2개</td>
						<td>70,000원</td>
						<td>-</td>
						<td>70,000원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<dl>
		<dt>합계</dt>
		<dd>
			<strong>109,000</strong>원
		</dd>
	</dl>
</div>
<div>
	<button type="button" onclick="location.href='/payment'">상품 주문</button>
</div>
</div>

</div>
<jsp:include page="/WEB-INF/views/yg/goods/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />