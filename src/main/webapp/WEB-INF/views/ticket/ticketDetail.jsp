<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/ticket/include/top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/assets/js/todayLabel.js"></script>
<style>
img.gl-logo {
	width: 60px;
}

#rival {
	width: 150px;
	text-align: left;
}

#h2 {
	margin-bottom: 100px;
}
</style>
</head>
<body>

	<!-- 선택하신 경기 -->
	<div class="container">
		<article id="main" class="special">
			<header id="h2">
				<h2>구역 및 매수 선택</h2>
			</header>
			<table class="table">
				<tbody>
					<tr>
						<td>${oneGame.gameDate}</td>
						<td class="disp_week" >
						<input type="hidden"  class = "gamedate" value = "${oneGame.gameDate }" >
						<script type="text/javascript">
							var data = $('.gamedate').val();
							document.write(getInputDayLabel(data));
						</script>
						</td>

						<td>${oneGame.gameTime}</td>
						<td>기아타이거즈</td>
						<td><img src="/images/Logo_Mini/KIA.jpg" class="gl-logo" />
						</td>
						<td>VS</td>

						<td><img src="/images/Logo_Mini/${oneGame.teamImg}"
							class="gl-logo" /></td>
						<td id="rival">${oneGame.sponsor}${oneGame.teamName}</td>
						<td>챔피언스필드</td>


					</tr>


				</tbody>
			</table>

		
		</article>
	</div>


	
	<div class="areaChoice">

		 	<c:forEach>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> 
				<label class="form-check-label" for="flexRadioDefault1"> ${baseballZone} </label>
			</div>
			</c:forEach>
 
	<%-- 

		매수선택 + 수량 업다운 버튼
		<td id="quantity<%=i%>" class="quantity">
		<span class="count count-box">
				<button type="button" name="countBtn" class="upBtn">
					<img src=" 올라가는 모양 이미지 ">
				</button> 
				<input type="text" class="countInput" id="quantity" <%=i%>
				name="countInput" value="<%=qtylist.get(i)%>" readonly="readonly"
				style="width: 20px; border: none;">
				<button type="button" name="countBtn" class="downBtn">
					<img src="내려가는 모양 이미지">
				</button>
		</span>
		</td>

		<div>
		총 결제해야하는 금액 보여주는 곳 
		</div>
		
		<button type="button">결제하기버튼</button> 
		
		
		
		<script>
		
		
		 버튼누르면 
		 if($(this).hasClass("upBtn")){
    		 count++;
    		
    	 } else {
    		 count--;
    		 if(count < 1) return;
    	 }
		 
		 countInput.val(count);
    	 totalInput.val(count * price); 
		 
		
		</script>
		 --%>

</body>
</html>
<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />