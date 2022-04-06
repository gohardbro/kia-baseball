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
	</form>
	<hr>
	<a href="/update?no=${one.boardNo }">글 수정</a>&nbsp;&nbsp;&nbsp; <a
		href="/delete?no=${one.boardNo }">글 삭제</a>&nbsp;&nbsp;&nbsp;
	<div>
<%-- 		<c:if test="${sessionScope.id != null }"> --%>
			<div class="comment-txt">
				<textarea id="cmtCnt" name="cmtCmt"
					placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
			</div>
			<div class="comment-button">
				<button id="cmt_btn">댓글달기</button>
			</div>
<%-- 		</c:if> --%>
		<div id="listComment"></div>
	</div>
</div>
<script>
	$("#cmt_btn").click(function(){
		var content=$("#content").val();
		var boardNo="${one.boardNo}";
		var param={"content":content,"boardNo":boardNo};
		$.ajax({
			type:"POST",
			url:"/addComment",
			data:param,
			
			success: function(){ 
                alert("댓글이 등록되었습니다.");
                listComment();
            }
		});
	});
	
	function listComment() {
		$.ajax({
			type:"GET",
			url:"/listComment?boardNo${one.boardNo}"
			success: function(result){ 
		    	$("#selectAll").html(result);
			}
		});
	}
	
	function listComment(num){
	    $.ajax({
	        type: "POST", 
	        url: "/listComment?boardNo${one.boardNo}&curPage", 
	        success: function(result){ 
	            $("#selectAll").html(result);
	        }
	    });
	}

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