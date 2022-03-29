<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	margin: 0;
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
.usermodify_table{
	color: #666666;
}

.usermodify_auth_mail {
	color: #0185da;
}
.usermodify_table{
	width: 878px;
	border-top: 2px solid #969696;
} 
th, td{
	border-bottom: 1px solid #ddd;
	padding: 14px 30px;
	font-size: 12px;
}
th{
	border-right: 1px solid #ddd;
	width: 100px;
	background-color: #eef1f8;
    text-align: left;
}
td{
	width: 717px;
}
.usermodify_auth_password{
	width: 200px;
	border: 1px solid #ccc;
	height: 22px;
    padding: 2px 5px;
    line-height: 22px;
}
</style>
</head>
<body>
	<section class="contents">
		<div class="contents_container">
			<section class="usermodify_auth">
				<form action="/test/mypage/account" method="post">
					<h1 class="usermodify_auth_title">회원정보확인</h1>
					<p class="usermodify_auth_msg">
						<strong class="usermodify_auth_mail">jangci@naver.com</strong> 님의
						정보를 안전하게 보호하기 위해서 다시 한번 확인 합니다.
					</p>
					<table class="usermodify_table">
						<tbody>
							<tr>
								<th>아이디(이메일)</th>
								<td>jangci@naver.com</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input class="usermodify_auth_password" type="password"></td>
							</tr>
						</tbody>
					</table>
					<div class="usermodify_auth_foot">
						<!-- 부트스트랩 링크추가해야함 -->
						<button type="submit" class="btn btn-primary btn-sm">확인</button>
						<button type="button" class="btn btn-secondary btn-sm">
							취소</button>
					</div>
				</form>
			</section>
		</div>
	</section>

</body>
</html>