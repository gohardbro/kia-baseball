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
				<h2>결제가 완료 되었어요!</h2>
			</header>
			
			
			<div class="wrapper">
			
				<h5>경기가 기대된다면 팬들과 소통해보세요!</h5>
				<button type="button"><a href="">자유게시판 GO</a></button>
				 
			
			</div>
			
			
		</article>
		
		
</div>



</body>
</html>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />