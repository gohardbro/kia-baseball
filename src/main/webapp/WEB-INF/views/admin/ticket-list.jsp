<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table">
	<thead>
		<tr>
			<th>#</th>
			<th>경기 날짜</th>
			<th>경기 시간</th>
			<th>구매자</th>
			<th>구역</th>
			<th>수량</th>
			<th>금액</th>
			<th>구매 일자</th>
			<th>취소 일자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ ticketList }" var="ticket">
			<tr>
				<td>${ ticket.baseballNo }</td>
				<td>${ ticket.gameDate }</td>
				<td>${ ticket.gameTime }</td>
				<td>${ ticket.buyer }</td>
				<td>${ ticket.zone }</td>
				<td>${ ticket.buyerCnt }</td>
				<td>${ ticket.total }</td>
				<td><fmt:formatDate value="${ ticket.buyDate }"
						pattern="yyyy-MM-dd" /></td>
				<td>${ ticket.refund !=null? ticket.refund: '-' }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

