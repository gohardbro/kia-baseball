<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<style>
body {
	margin: 0;
	background-color: #f5f5f5;
}

.contents {
	margin-right: 15%;
	margin-left: 15%;
	padding-bottom: 40px;
	width: 980px;
	
}

.contents_container {
	width: 878px;
	min-height: 900px;
	padding: 50px;
	background-color: #fff;
	border: 1px solid #ccc;
	
}

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
	border-top: 2px solid #969696;
}

th, td {
	border-bottom: 1px solid #ddd;
	padding: 14px 30px;
	font-size: 12px;
}

th {
	border-right: 1px solid #ddd;
	width: 120px;
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

	<div class="container" >
		<section class="contents">
			<div class="contents_container">
				<section class="usermodify_auth">
					<form action="/account" method="post">
						<h1 class="usermodify_auth_title">회원정보확인</h1>
						<p class="usermodify_auth_msg">
							<strong class="usermodify_auth_mail">${loginUser.id }</strong> 님의
							정보를 안전하게 보호하기 위해서 다시 한번 확인 합니다.
						</p>
						<table class="usermodify_table">   
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${loginUser.id}</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input class="usermodify_auth_password" type="password"
										name="pw"></td>
									<c:if test="${not empty pwCheckErrMsg }">
										<div class="alert alert-danger">${pwCheckErrMsg }</div>
									</c:if>
								</tr>
							</tbody>
						</table>
						<div class="usermodify_auth_foot">
							<button type="submit" class="confirm_btn btn btn-primary btn-sm">확인</button>
							<a href="/mypage" class="cancel_btn btn btn-secondary btn-sm">
								취소</a>
						</div>
					</form>
				</section>
			</div>
		</section>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />