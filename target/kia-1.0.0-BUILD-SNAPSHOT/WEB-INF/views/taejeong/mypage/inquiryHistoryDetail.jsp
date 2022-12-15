
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
	border-bottom: 1px solid #e3e6e5;
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
.textZone {
	padding: 20px 28px;
	border: 1px solid rgb(238, 238, 238);
	background-color: rgb(255, 255, 255);
}
.textLine{
	margin: 5px 0;
	 
}
.answer {
	background-color: rgb(245, 248, 255);
}
</style>

<div class="row" style="margin: 0px;">
	<div class="column side" style="background-color: #f4f4f4;"></div>
	<div class="column middle">
		<div class="row">
			<div class="side_wrapper col-2">
				<jsp:include
					page="/WEB-INF/views/taejeong/include/mypageSideNav.jsp" />
			</div>
			<div class="main_wrapper col-10">
				<div class="titleZone">
					<h3>문의내역 상세</h3>
				</div>
				<div class="main_content">
				
				<div class="divider"></div>
					
				<c:forEach items="${historyList }" var="historyList" varStatus="status">
					<div class="textZone">
						<div>
							<div class="textLine" style="font-weight: bold;">문의 제목</div>
							<div class="textLine" style="font-size: 14px;">${historyList.title }</div>
							<div class="textLine" style="font-weight: bold;">문의 내용</div>
							<div class="textLine" style="font-size: 14px;">${historyList.content }</div>
							<div class="textLine"><small class="text-muted">${historyList.writeDate }</small><small class="text-muted" style="float: right;">${historyList.answer eq 'N' ? "" : "답변완료"  }</small></div>
						</div>			
					</div>
					<c:if test="${historyList.answer != 'N' }">
						<div class="textZone answer">
							<div style="padding-left: 25px;">
									<svg width="16" height="16" focusable="false"
										viewBox="0 0 20 20" aria-hidden="true" role="presentation"
										style="fill: rgb(136, 136, 136);">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0H20V20H0z"></path>
										<path stroke="#888888" d="M5 3.333L5 13.333 15 13.333"></path>
										</g>
									</svg>
								<div class="textLine" style="font-weight: bold; display: inline-block">관리자</div>
								<div class="textLine" style="font-size: 14px; padding-left: 21px">답변내용</div>
								<div class="textLine" style="padding-left: 21px"><small class="text-muted">${historyList.writeDate }</small></div>
							</div>			
						</div>
					</c:if>
				</c:forEach>

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
	
	/* bootstrap modal*/
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', function () {
	  myInput.focus()
	})
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />