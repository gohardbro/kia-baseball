<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!-- Main -->
<div class="subheader"></div>
<div class="wrapper style1 container">

	<form method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left">${one.title }</td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left">${one.writer }</td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea name="content" cols="40" rows="10">${one.content }</textarea>
				</td>
			</tr>
			<tr>
				<td bgcolor="orange">등록일</td>
				<td align="left"><fmt:formatDate value="${one.writeDate }"
						pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">조회수</td>
				<td align="left">${one.views }</td>
			</tr>
			<tr>
				<td bgcolor="orange">첨부파일 목록</td>
				<td><c:forEach var="file" items="${file }">
						<a class="downlink" id="${file.boardNo }" href="${file.fileName }">${file.fileName }</a>
						<button type="button" onclick="deleteFile('${file.boardNo }');">삭제</button>
						<br>
					</c:forEach></td>
			</tr>
			<tr>
				<td bgcolor="orange" width="70">업로드</td>
				<td align="left"><input type="file" name="uploadFiles"
					multiple="multiple"></td>
			</tr>
		</table>
		<a href="/update?no=${one.boardNo }">글 수정</a>&nbsp;&nbsp;&nbsp; <a
			href="/delete?no=${one.boardNo }">글 삭제</a>&nbsp;&nbsp;&nbsp;
	</form>

	<div id="comment">
		<ol class="commentLsit">
			<c:forEach items="${cmtList }" var="cmtList">
				<li>
					<p>
						작성자 : ${cmtList.writer }<br /> 작성날짜 :
						<fmt:formatDate value="${cmtList.writeDate }" pattern="yyyy-MM-dd" />
					</p>
					<p>${cmtList.content }</p>
				</li>
				<div>
					<button type="button" class="updateCmt"
						data-rno="${cmtList.commentNo}">수정</button>
					<button type="button" class="deleteCmt"
						data-rno="${cmtList.commentNo}">삭제</button>
				</div>
			</c:forEach>
		</ol>
	</div>
	<c:choose>
		<c:when test="${empty sessionScope.loginUser }">
		</c:when>
		<c:otherwise>
			<form name="cmtForm" method="post">
				<input type="hidden" id="boardNo" name="boardNo"
					value="${one.boardNo }">
				<div>
					<label for="writer">댓글 작성자</label><input type="text" id="writer"
						name="writer" /> <br> <label for="content">댓글 내용</label><input
						type="text" id="content" name="content" />
				</div>
				<div>
					<button type="button" class="cmt-btn">작성</button>
				</div>
			</form>
		</c:otherwise>
	</c:choose>
</div>
<script>
	$(".cmt-btn").on("click", function() {
		var formObj = $("form[name='cmtForm']");
		formObj.attr("action", "/addComment");
		formObj.submit();
	});
	
	$(".updateCmt").on("click", function(){
		location.href = "/yg/boardview?no=${one.boardNo}"
						+ "&commentNo="+$(this).attr("data-commentNo");
	});
	
	$(".deleteCmt").on("click", function(){
		location.href = "/yg/boardview?no=${one.boardNo}"
			+ "&commentNo="+$(this).attr("data-commentNo");
	});
</script>
<style>
._small img table tr td {
	width: 10px;
	height: 10px;
}

.subheader {
	width: 100%;
	height: 200px;
	background-repeat: no-repeat;
	background-position: center center;
	background-image: url('/images/wordmark.jpg');
}

h2 {
	text-align: center;
	font-weight: 600;
}

#subnav {
	text-align: right;
}

#subnav li {
	list-style-type: none;
	float: right;
}
</style>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />