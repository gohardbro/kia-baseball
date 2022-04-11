
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
.header {
	background-color: #f1f1f1;
	padding: 30px;
	text-align: center;
	font-size: 35px;
}

/* Create three unequal columns that floats next to each other */
.column {
	float: left;
	padding: 10px;
}

/* Left and right column */
.column.side {
	width: 20%;
}

/* Middle column */
.column.middle {
	width: 60%;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the footer */
.footer {
	background-color: #f1f1f1;
	padding: 10px;
	text-align: center;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media ( max-width : 600px) {
	.column.side, .column.middle {
		width: 100%;
	}
}

th {
	font-size: 14px;
	color: #666666;
	background-color: #f8f8f8;
	text-align: center;
	padding: 14px 0px;
	border-top: 1px solid #c7c7c7;
	border-bottom: 1px solid #c7c7c7;
}

td {
	font-size: 13px;
	text-align: center;
	padding: 10px 0px;
}

.divider {
	height: 30px;
	width: 100%;
}

.selectFrom {
	float: right;
}

.selectBtn {
	display: inline-block;
	padding: 6px 12px;
}

select, option {
	font-size: 14px;
	padding: 0 12px;
}

.titleZone {
	border-bottom: 2px solid #999;
}

.main_wrapper {
	padding: 38px 39px 100px;
}
#bt {
	float: left;
}
#backBtn {
	float:right;
}
.btn-lg {
	margin: 0 20px;
}
</style>

<div class="row" style="margin: 0px;">
	<div class="column side" style="background-color: #f4f4f4;"></div>
	<div class="column middle">
		<div class="row">

			<div class="main_wrapper col-12">
				<div class="titleZone">
					<h3>문의하기</h3>
				</div>
				<div class="main_content">

					<div class="divider"></div>
					<div>
						<form method="post" autocomplete="off" action="/inquiry/write"
							enctype="multipart/form-data">
							<b>제목</b>
							<div class="form-group">
								<input type="text" class="title" name="title">
							</div>
							<b>내용</b>
							<div class="form-group">
								<textarea class="form-control" rows="10" id="comment"
									placeholder="문의내용" name="content"></textarea>
							</div>
							<div>
								<button type="submit" class="btn btn-primary btn-lg" id="bt" onclick="submitAlert()" >문의하기</button>
								<a type="submit" class="btn btn-secondary btn-lg" id="backBtn" href="/mypage">돌아가기</a>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;"></div>
</div>
<script>
	$(".btn-outline-secondary").click(function() {
		$(".btn-outline-secondary").removeClass("active");
		$(this).addClass("active");
	});
	
	
	function submitAlert(){
		const inquryMsg = "${inquryMsg}";
		console.log(inquryMsg);
		if(inquryMsg != null){
			alert("문의를 등록했습니다.");
		}else{
			alert("문의등록 실패! 다시시도하세요.");
			
		}
	}
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />