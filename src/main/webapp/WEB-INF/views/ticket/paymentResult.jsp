<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/ticket/include/top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
.wrapper{
display: grid;
place-items: center;

}

</style>
</head>
<body>


<div class="container">
		<article id="main" class="special">
			<header>
				<h2>결제가 완료 되었어요</h2>
			</header>
			
			<section class="wrapper">
				<h5>경기가 기대된다면 팬들과 소통해보세요!</h5>
				<button type="button" onclick="location.href='/free'">자유게시판 GO</button>
				 
				<h6>내 예매 정보</h6>  
				<table>
					<tr>				
						<td>기아타이거즈</td>					
						<td>이미지</td>					
						<td>VS</td>			
						<td>이미지</td>
						<td>${result.rival}</td>
					</tr>
					<tr>
						<td>${result.gameDate}</td>					
						<td>${result.gameTime}</td>					
						<td>${result.요일}</td>	
						<td>${result.buyerCnt}</td>					
						<td>${result.total}</td>		
					</tr>
				</table>
			</section>
			
			
		</article> 
		
		
</div>



</body>
</html>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />