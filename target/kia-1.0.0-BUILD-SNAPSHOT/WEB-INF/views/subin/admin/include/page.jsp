<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

<div class='page-list'>
	<!-- 첫번째 블럭 -->
	<c:if test='${page.curBlock gt 1 }'> 
		<a title='처음' onclick='go_page(1)'>
			<i class="fas fa-angle-double-left"></i>
		</a>
		<a title='이전' onclick='go_page(${page.beginPage-page.blockPage})'>
			<i class="fas fa-angle-left"></i>
		</a>
	</c:if>

	<c:forEach var="no" begin="${page.beginPage}" end="${page.endPage}">
		<c:if test='${no eq page.curPage}'>
			<span class='page-on'>${no}</span>
		</c:if>
		<c:if test='${no ne page.curPage}'>
			<a onclick='go_page(${no})'>${no}</a>
		</c:if>
	</c:forEach>

	<!-- 다음블럭/마지막블럭: 마지막블럭이 아닌 경우만 -->
	<c:if test='${page.curBlock ne page.totalBlock}'>
		<a title='다음' onclick='go_page(${page.endPage+1})'>
			<i class="fas fa-angle-right"></i>
		</a>
		<a title='마지막' onclick='go_page(${page.totalPage})'>
			<i class="fas fa-angle-double-right"></i>
		</a>
	</c:if>


</div>

<style>
.page-list { 
	display: flex; 
	justify-content: center; 
	line-height: 36px; 
}
.page-list a, .page-list span {
	width: 38px; 
	height: 38px; 
	border: 1px solid transparent; 
	margin: 1px;
	text-align: center;
} 
.page-list .page-on {
	border: 1px solid #0040ff; 
	color: #0040ff;
}
.page-list a:hover {
	background-color: rgba(0, 64, 255, 0.1); 
	color:#0040ff;
}
</style>
