<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Main -->
<!-- <div class="subheader"></div> -->
<div class="wrapper style1 container">

	<form method="post" enctype="multipart/form-data">
		<table border="1">
			<div class="_h6Bar">
				<strong>${board.title }</strong>
				<p class="icoWrap">
					<span class="date"><fmt:formatDate
							value="${board.writeDate }" pattern="yyyy-MM-dd" /> | </span> <span
						class="view"><img src="/images/eye.png">
						${board.views } | </span> <span class="like"><img
						src="/images/like.png"> ${board.likes }</span>
				</p>
			</div>
			<div class="viewCont">
				<p>
				<div>
					${board.content }
				</div>
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
		<a href="/update?no=${board.boardNo }">글 수정</a>&nbsp;&nbsp;&nbsp; <a
			href="/delete?no=${board.boardNo }">글 삭제</a>&nbsp;&nbsp;&nbsp;
	</form>
	<div class="my-3 p-3 bg-white rounded shadow-sm"
		style="padding-top: 10px">
		<form:form name="form" id="form" role="form" modelAttribute="cmt"
			method="post">
			<form:hidden path="boardNo" id="boardNo" />
			<div class="row">
				<div class="col-sm-10">
					<form:textarea path="content" id="content" class="form-control"
						rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
				</div>
				<div class="col-sm-2">
					<form:input path="writer" class="form-control" id="writer"
						placeholder="댓글 작성자"></form:input>
					<button type="button" class="btn btn-sm btn-primary"
						id="insetCmt_btn" style="width: 100%; margin-top: 10px">
						저 장</button>
				</div>
			</div>
		</form:form>
	</div>
	<div class="my-3 p-3 bg-white rounded shadow-sm"
		style="padding-top: 10px">
		<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
		<div id="commentList"></div>
	</div>

</div>
<div>
<div>
<div>
<script>

	$(document).ready(function(){
		showReplyList();
	});
	
	function showReplyList() {
		var url = "${pageContext.request.contextPath}/boardviewCtr/getCmtList";
		var paramData = {
			"boardNo" : "${board.boardNo}"
		};
		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',

            success: function(result) {
               	var htmls = "";
				if(result.length < 1){
					htmls.push("등록된 댓글이 없습니다.");
				} else {
					$(result).each(function() {
							htmls += '<div class="media text-muted pt-3" id="commentNo' + this.commentNo + '">';
	
							htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	
							htmls += '<span class="d-block">';
	
							htmls += '<strong class="text-gray-dark">'
										+ this.writer
										+ '</strong>';
	
							htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	
							htmls += '<a href="javascript:void(0)" onclick="fn_updateCmt('
										+ this.commentNo
										+ ', \''
										+ this.writer
										+ '\', \''
										+ this.content
										+ '\' )" style="padding-right:5px">수정</a>';
	
							htmls += '<a href="javascript:void(0)" onclick="fn_deleteCmt('
										+ this.commentNo
										+ ')" >삭제</a>';
	
							htmls += '</span>';
	
							htmls += '</span>';
	
							htmls += this.content;
							
							htmls += '<br/>' + this.writeDate;
	
							htmls += '</p>';
	
							htmls += '</div>';
							}); 

					}

						$("#commentList").html(htmls);
				} 
			});
		}
	
	$(document).on('click', '#insetCmt_btn', function(){
		var cmtContent = $('#content').val();
		var cmtWriter = $('#writer').val();
		
		var paramData = JSON.stringify({"content": cmtContent
				, "writer": cmtWriter
				, "boardNo":'${board.boardNo}'
		});

		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};

		$.ajax({

			url: "${pageContext.request.contextPath}/boardviewCtr/insertCmt"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				
				$('#content').val('');
				$('#writer').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	});
	
	function fn_updateCmt(commentNo, writer, content){

		var htmls = "";

		htmls += '<div class="media text-muted pt-3" id="commentNo' + commentNo + '">';

		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

		htmls += '<span class="d-block">';

		htmls += '<strong class="text-gray-dark">' + writer + '</strong>';

		htmls += '<span style="padding-left: 7px; font-size: 9pt">';

		htmls += '<a href="javascript:void(0)" onclick="fn_saveCmt(' + commentNo + ', \'' + writer + '\')" style="padding-right:5px">저장</a>';

		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

		htmls += '</span>';

		htmls += '</span>';		

		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

		htmls += content;

		htmls += '</textarea>';
		
		htmls += '</p>';
		
		htmls += '</div>';

		$('#commentNo' + commentNo).replaceWith(htmls);
		$('#commentNo' + commentNo + ' #editContent').focus();
	}
	
	function fn_saveCmt(commentNo, writer){
		var cmtEditContent = $('#editContent').val();

		var paramData = JSON.stringify({"content": cmtEditContent
				, "commentNo": commentNo
		});

		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};

		$.ajax({
			url: "${pageContext.request.contextPath}/boardviewCtr/updateCmt"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
	function fn_deleteCmt(commentNo){
		var paramData = {"commentNo": commentNo};

		$.ajax({
			url: "${pageContext.request.contextPath}/boardviewCtr/deleteCmt"
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}

</script>
<style>


</style>

<jsp:include page="/WEB-INF/views/yg/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />