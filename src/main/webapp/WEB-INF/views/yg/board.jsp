<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/yg/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<h2>자유게시판</h2>
		<nav id="subnav">
			<ul>
				<li><a href="/announce">공지사항</a></li>
				<li><a href="#">자유게시판</a></li>
				<li><a href="#">선수소개</a></li>
				<li><a href="/intro">팀소개</a></li>
			</ul>
		</nav>
		<table class="table">
			<c:forEach var="one" items="${all }">
				<tr>
					<td>${one.boardNo }</td>
					<td><a href="/boardview?no=${one.boardNo }">${one.title }</a></td>
					<td>${one.writer }|<fmt:formatDate value="${one.writeDate }"
							pattern="yyyy.MM.dd" /> | <img src="/images/eye.png">
						${one.views } | <img src="/images/like.png"> 43
					</td>
				</tr>
			</c:forEach>
		</table>
		<div style="margin-top: 10px;">
			<button type="button" onclick="location.href='/write'">글쓰기</button>
		</div>
		<div class="paging">
			<ul>
				<c:if test="${pvo.prev }">
					<li><a href="free${pvo.makeQuery(pvo.startPage - 1) }">이전</a>
				</c:if>
				<c:forEach begin="${pvo.startPage }" end="${pvo.endPage }" var="cnt">
					<li><a href="free${pvo.makeQuery(cnt) }">${cnt }</a></li>
				</c:forEach>
				<c:if test="${pvo.next && pvo.endPage > 0 }">
					<li><a href="free${pvo.makeQuery(pvo.endPage + 1) }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/yg/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />