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
		<div class="_h6Bar">
			<strong>${board.title }</strong>
			<p class="icoWrap">
				<span class="date"><fmt:formatDate
						value="${board.writeDate }" pattern="yyyy-MM-dd" /> | </span><span
					class="writer"> ${board.writer } | </span><span class="view"><img
					src="/images/eye.png"> ${board.views } | </span><span class="like"><img
					src="/images/like.png"> ${board.likes }</span>
			</p>
		</div>
		<div class="viewCont">
			<p>
			<div class="pb-5">${board.content }</div>
		</div>
		<table border="1">
			<tr>
				<td align="center" colspan="2">
					<button type="button"
						onClick="location.href='/update?no=${board.boardNo }'">글
						수정</button>
					<button type="button"
						onClick="location.href='/delete?boardNo=${board.boardNo }'">글
						삭제</button>
					<button type="button" onClick="location.href='/free'">글목록</button>
				</td>
			</tr>
		</table>
		
	</form>
	<div class="my-3 p-3 bg-white rounded shadow-sm"
		style="padding-top: 10px">
		<form:form name="form" id="form" role="form" modelAttribute="cmt"
			method="post">
			<form:hidden path="boardNo" id="boardNo" />
			<c:choose>
				<c:when test="${empty sessionScope.loginUser }">
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col-sm-10">
							<form:textarea path="content" id="content" class="form-control" 
								rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
						</div>
						<div class="col-sm-2">
							<input type="hidden" id="writer" name="writer" value="${loginUser.id }">
							<button type="button" class="btn btn-sm btn-primary"
								id="insetCmt_btn" style="width: 100%; margin-top: 10px">
								저 장</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</form:form>
	</div>
	<div class="my-3 p-3 bg-white rounded shadow-sm"
		style="padding-top: 10px">
		<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
		<div id="commentList"></div>
	</div>
</div>

<script>

	$(document).ready(function() {
		showReplyList();
	});

	function showReplyList() {
		var url = "${pageContext.request.contextPath}/boardviewCtr/getCmtList";
		var paramData = {
			"boardNo" : ${board.boardNo}
		};
		$
				.ajax({
					type : 'POST',
					url : url,
					data : paramData,
					dataType : 'json',

					success : function(result) {
						var htmls = "";
						if (result.length < 1) {
							htmls = "등록된 댓글이 없습니다.";
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

												htmls += '<br/>'
														+ this.writeDate;

												htmls += '</p>';

												htmls += '</div>';
											});

						}

						$("#commentList").html(htmls);
					}
				});
	}

	$(document).on('click', '#insetCmt_btn', function() {
		var cmtContent = $('#content').val();
		var cmtWriter = $('#writer').val();
		var paramData = JSON.stringify({
			"content" : cmtContent,
			"writer" : cmtWriter,
			"boardNo" : ${board.boardNo}
		});

		var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};

		$.ajax({

			url : "${pageContext.request.contextPath}/boardviewCtr/insertCmt",
			headers : headers,
			data : paramData,
			type : 'POST',
			dataType : 'text',
			success : function(result) {
				showReplyList();
				$('#content').val('');
				$('#writer').val('');
				location.reload();
			},
			error : function(error) {
				console.log("에러 : " + error);
			}
		});
	});

	function fn_updateCmt(commentNo, writer, content) {

		var htmls = "";

		htmls += '<div class="media text-muted pt-3" id="commentNo' + commentNo + '">';

		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

		htmls += '<span class="d-block">';

		htmls += '<strong class="text-gray-dark">' + writer + '</strong>';

		htmls += '<span style="padding-left: 7px; font-size: 9pt">';

		htmls += '<a href="javascript:void(0)" onclick="fn_saveCmt('
				+ commentNo + ', \'' + writer
				+ '\')" style="padding-right:5px">저장</a>';

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

	function fn_saveCmt(commentNo, writer) {
		var cmtEditContent = $('#editContent').val();

		var paramData = JSON.stringify({
			"content" : cmtEditContent,
			"commentNo" : commentNo
		});

		var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};

		$.ajax({
			url : "/boardviewCtr/updateCmt",
			headers : headers,
			data : paramData,
			type : 'POST',
			dataType : 'text',
			success : function(result) {
				console.log(result);
				showReplyList();
			},
			error : function(error) {
				console.log("에러 : " + error);
			}
		});
	}

	function fn_deleteCmt(commentNo) {
		var paramData = {
			"commentNo" : commentNo
		};

		$.ajax({
			url : '/boardviewCtr/deleteCmt',
			data : paramData,
			type : 'POST',
			dataType : 'text',
			success : function(result) {
				showReplyList();
			},
			error : function(error) {
				console.log("에러 : " + error);
			}
		});
	}

	$('#likebtn').click(function() {
		likeupdate();
	});

	function likeupdate() {
		var paramData = JSON.stringify({
			idLike : $('#id').val(),
			boardNoLike : $('#boardNo').val(),
			count : $('#likecheck').val()
		});
		console.log(paramData);
		$.ajax({
			url : '/boardviewCtr/likeupdate',
			type : 'POST',
			contentType : 'application/json',
			data : paramData,
			success : function(result) {
				console.log("수정" + result.result);
				if ($('#likecheck').val() == 0) {
					console.log("좋아요 취소");
					$('#likecheck').val(0);
					$('#likebtn').attr('class', 'btn btn-light');
				} else if ($('#likecheck').val() == 1) {
					console.log("좋아요!");
					$('#likecheck').val(1);
					$('#likebtn').attr('class', 'btn btn-danger');
				}
			},
			error : function(result) {
				console.log("에러" + result.result)
			}

		});
	};
</script>
<div>
	<div>
		<div>
			<jsp:include page="/WEB-INF/views/yg/include/bottom.jsp" />
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />