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
<script type="text/javascript" src="/assets/js/todayLabel.js"></script>

<!-- 아임포트 라이브러리 -->
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
  
<!-- 아임포트 설정-->
<script>
var IMP = window.IMP;  
IMP.init('imp89839657');  



</script>

<script>
	if ($(this).hasId("upBtn")) {
		count++;

	} else {
		count--;
		if (count < 1)
			return;
	}

	countInput.val(count);
	totalInput.val(count * price);
</script>

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

.downBtn.upBtn {
	
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

			<section>
				<div class="row">
					<div class="col-sm-12">
						<div class="container">
							<div class="shadow-none p-4 mb-4 bg-light">
								<a>※안내사항</a><br> <a> -결제는 1인당 4매까지 가능합니다.</a><br> <a>-제휴카드를
									포함한 각종 할인 문의, 단체 관람 문의는 기아타이거즈 공식 홈페이지(https://tigers.co.kr/)를
									이용해 주세요.</a>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section>
				<div class="row">
					<div class="col-sm-4">
						<div class="container">
							<div class="shadow p-4 mb-4 bg-white">
								<!--선택된 경기 정보  -->
								<div>${oneGame.gameDate}</div>

								<div class="disp_week">
									<input type="hidden" class="gamedate"
										value="${oneGame.gameDate }">
									<script type="text/javascript">
										var data = $('.gamedate').val();
										console.log(data); /* 날짜는 잘 가져왔음 */
										document.write(getInputDayLabel(data));
									</script>
								</div>
								<div>${oneGame.gameTime}</div>
								<div>
									<img src="/images/Logo_Mini/KIA.jpg" class="gl-logo" />
								</div>
								<div>기아타이거즈</div>
								<div>VS</div>
								<div>
									<img src="/images/Logo_Mini/${oneGame.teamImg}" class="gl-logo" />
								</div>
								<div>${oneGame.sponsor}${oneGame.teamName}</div>
								<div>챔피언스필드(홈경기)</div>
							</div>
						</div>
					</div>

					<!-- 오른쪽 col -->
					<div class="col-sm-8">
						<div class="container">
							<div class="shadow p-4 mb-4 bg-white">
								<!-- seatArea고르기 k3,k5... -->
								<div class="areaChoice">
									<c:forEach var="sc" items="${seatChoice}">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="flexRadioDefault" id="flexRadioDefault1"> <label
												class="form-check-label" for="flexRadioDefault1">
												${sc.baseballZone} </label>
										</div>
									</c:forEach>
								</div>
								
								<!-- 수량 업다운 버튼 -->
								<div class="quantity">
								
									<span class="count count-box">
										 <button type="button" class="btn btn-outline-danger" id="upBtn">△</button>
										
										<!-- 수량숫자--> <!-- quantity = i --> 
										<input type="text" class="countInput" id="quantity" name="countInput"
										value="list.get(i)" readonly="readonly"
										style="width: 70px; border: none;" />

									 <button type="button" class="btn btn-outline-danger" id="upBtn">▽</button>
									</span>
								</div>
								<!-- 수량 업다운 버튼 끝-->
								
								<div><a>총 결제금액</a></div>
								<div><a>(여기 돈 계산해서 들어오기)</a><a>원</a></div>
							
								<button type="button" style="margin-top : 20px">결제하기</button>
							</div>
						</div>
						</div>

					<!-- 오른쪽 col 끝-->

				 </div>
			</section>




		</article>
	</div>


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
		
	


  --%>

</body>
</html>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />