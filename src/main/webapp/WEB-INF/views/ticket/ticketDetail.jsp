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

<!-- 아임포트 라이브러리 -->
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script>
	function temp() {
		console.log("TEMP CALLED");
		var IMP = window.IMP;
		IMP.init('imp89839657');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : 'Kia Tigers 경기 예매권(팬페이지 구매)' //상품명
			amount : //가격 //이것만 있어도 결제는 넘어감 
			buyer_email : 'iamport@siot.do', <- id로 
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			 
			
		/* 	얘네 요소를 테이블 만들어서 넣기? 
			누가 결제했는지 내역이 DB에 들어가야 하니까 
			현재 로그인 한 사람의 정보를 파라미터로 가지고 와서 넣어주고  
			선택한 좌석/티켓장수에 따른 amount를 넣어준다 
			결제가 되면 결제된 내역을 (사람정보, 경기정보, 금액, 결제시간) 넘겨준다  */
			경기정보
			
			
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액은 : ' + rsp.paid_amount + '원 입니다.';
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	};
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
										<div>
											<input type="radio" name="zoneCheck"
												value="${sc.baseballZone}">${sc.baseballZone}
										</div>
									</c:forEach>
								</div>


								<script>
								$("input[name=zoneCheck]").click(function(){

									
									
									var data = $('.gamedate').val();
									console.log(data); /* 날짜는 잘 가져왔음 */
									document.write(getInputDayLabel(data));
									var yoil = getInputDayLabel(data);
									
									var basballZone = $(this).val();
									
									
									$.ajax({
										url:"/ticketPrice",
										data : {"yoil": yoil, "baseballZone": basballZone},
										success : function(weekend){
											alert("성공");
										},
										error : function(){
											alert("실패");
										}
									});
								});
								</script>

								<!-- 수량 업다운 버튼 -->
								<div class="quantity">

									<span class="count count-box">
										<button type="button" class="btn btn-outline-danger"
											id="upBtn">△</button> <!-- 수량숫자--> <!-- quantity = i --> <input
										type="text" class="countInput" id="quantity" name="countInput"
										value="list.get(i)" readonly="readonly"
										style="width: 70px; border: none;" />

										<button type="button" class="btn btn-outline-danger"
											id="upBtn">▽</button>
									</span>
								</div>
								<!-- 수량 업다운 버튼 끝-->

								<div>
									<a>총 결제금액</a>
								</div>
								<div>
									<a>(여기 돈 계산해서 들어오기)</a><a>원</a>
								</div>

								<button type="button" onclick="temp()">결제하기</button>
							</div>
						</div>
					</div>

					<!-- 오른쪽 col 끝-->

				</div>
			</section>




		</article>
	</div>



</body>
</html>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />