
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

/* 추가 */

.usermodify_auth_title {
	font-size: 30px;
}

.usermodify_auth_msg {
	font-size: 12px;
}

.usermodify_table {
	color: #666666;
}

.usermodify_auth_mail {
	color: #0185da;
}

.usermodify_table {
	width: 878px;
	border-top: 2px solid #969696;
}

th, td {
	border-bottom: 1px solid #ddd;
	padding: 14px 30px;
	font-size: 12px;
}

th {
	border-right: 1px solid #ddd;
	width: 100px;
	background-color: #eef1f8;
	text-align: left;
}

td {
	width: 717px;
}

.usermodify_auth_password {
	width: 200px;
	border: 1px solid #ccc;
	height: 22px;
	padding: 2px 5px;
	line-height: 22px;
}

.confirm_btn {
	border-color: #0185da;
	color: #fff;
	background-color: #0e9ae9;
	background-image: linear-gradient(#20b3f8, #0185d8);
}

.cancel_btn {
	border-color: #828282;
	color: #fff;
	background-color: #999ca5;
	background-image: linear-gradient(#a8abba, #8c8f98);
}

.usermodify_auth_foot {
	text-align: center;
	margin-top: 10px;
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
					<h3 class="usermodify_auth_title">회원정보확인</h3>
				</div>
				<div class="main_content">
					<p style="font-size: 13px; color: #999; margin: 36px 0 26px;" class="usermodify_auth_msg">
						<strong class="usermodify_auth_mail">${loginUser.id }</strong> 님의
							정보를 안전하게 보호하기 위해서 다시 한번 확인 합니다.
					</p>
					
					<form action="/account" method="post">
						<table class="usermodify_table">
							<tbody>
								<tr>
									<th><input type="checkbox">아이디</th>
									<td>${loginUser.id}</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input class="usermodify_auth_password"
										type="password" name="pw"></td>
									<c:if test="${not empty pwCheckErrMsg }">
										<div class="alert alert-danger">${pwCheckErrMsg }</div>
									</c:if>
								</tr>

							</tbody>
						</table>
						<div class="usermodify_auth_foot">
							<button type="submit" class="confirm_btn btn btn-primary btn-sm">확인</button>
							<button type="button" class="cancel_btn btn btn-secondary btn-sm">
								취소</button>
						</div>
					</form>


					<div class="divider"></div>
					<div></div>

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
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />