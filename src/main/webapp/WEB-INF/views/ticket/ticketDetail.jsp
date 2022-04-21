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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>




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

 
.wbox{
	heigth:500px;
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
							<div class="shadow p-4 mb-4 bg-white" >

								<!-- 예매하실 경기 정보 -->
								<input type="hidden" class="gameDate"
									value="${oneGame.gameDate }">
								<table>

									<tr>
										<td>${oneGame.gameDate}</td>
									</tr>
									<tr>
										<td class="disp_week"></td>
										<td>${oneGame.gameTime}</td>
									</tr>
									<tr>
										<td><img src="/images/Logo_Mini/KIA.jpg" class="gl-logo" />
										</td>
										<td>VS</td>
										<td><img src="/images/Logo_Mini/${oneGame.teamImg}"
											class="gl-logo" /></td>
									</tr>
									<tr>
										<td>챔피언스필드(홈경기)</td>
									</tr>
								</table>


							</div>
						</div>
					</div>

					<!-- 오른쪽 col -->
					<div class="col-sm-8">
						<div class="container">
							<div class="shadow p-4 mb-4 bg-white" >
								<!-- seatArea고르기 radio 6개 -->
								<div class="seatChoice">
									<table>

										<c:forEach var="sc" items="${seatChoice}">
											<tr>
												<td><input type="radio" name="zoneCheck" id="seat"
													value="${sc.baseballZone}"> ${sc.baseballZone}</td>
												<td>잔여석:(122/200)</td>
											</tr>
										</c:forEach>

									</table>

								</div>

								<!-- 수량 업다운 버튼 -->
								<div class="quantity" >
									<span class="count count-box"> <span>예매 매수 : </span>
										<button type="button" class="btn btn-outline-danger" id="upBtn" >△</button> 
										<input type="text" class="countInput" id="quantity" name="quentity" 
										value="0" readonly="readonly"  display="inline-block;" style="border: none; width:50px; " />
										<button type="button" class="btn btn-outline-danger" id="downBtn" >▽</button>
									</span>
								</div>

								<!-- 결제할 금액  -->
								<div style="margin-top: 20px; margin-bottom: 20px;">
									결제금액 :<span id="totalAmount"></span>원
								</div>

								<button type="button" onclick="paymentProcess()" class="amountCheck"  style="width:80%">결제하기</button>

							</div>
						</div>
					</div>

				</div>
			</section>
		</article>
	</div>
	<form action="/progress/payment" style="display: none" method="post" id="pform" >
		<input type="hidden" name="buyer"  value="${loginUser.buyer}"/> 
		<input type="hidden" name="baseInfoNo" id="hidden_seat"/> 
		<input type="hidden" name="buyerCnt" id="hidden_cnt"/> 
		<input type="hidden" name="total" id="hidden_total"/>
		<input type="hidden" name="scheduleNo"  value="${oneGame.scheduleNo}"/>
	</form>

	

</body>


<script>
	// 주말여부에 따른 티켓금액 * 좌석(zone) = 가격(response) 
	var ajaxData;
	var data = $('.gameDate').val();
	$(".disp_week").html(getInputDayLabel(data));

	$("input[name=zoneCheck]").click(function() {
		var data = $('.gameDate').val();

		var yoil = getInputDayLabel(data);
		var basballZone = $(this).val();
		console.log(yoil + "/" + basballZone);
		$.ajax({
			url : "/ticketPrice",
			data : {
				"yoil" : yoil,
				"baseballZone" : basballZone
			},
			async : false,
			success : function(response) {
				ajaxData = response;
			},
			error : function() {
			}
		});

		updatePrice();
	});

	// 결제할 총 액 amount(주중,주말여부 적용된 zone요금 * 티켓매수)
	var amount;
	function updatePrice() {
		amount = ajaxData * $("#quantity").val();
		console.log(amount);
		$("#totalAmount").html(amount);
	}

	// 티켓 매수 : 업버튼 
	$("#upBtn").click(function() {
		var count = $("#quantity").val();
		if (count <= 3) {
			$("#quantity").val(++count);
		} else {
			count = 4;
		}
		updatePrice();
	});

	// 티켓 매수 : 다운버튼 
	$("#downBtn").click(function() {
		var count = $("#quantity").val();
		if (count > 0) {
			$("#quantity").val(--count);
		} else {
			count = 0;
		}
		updatePrice();
	});

	// 결제 function (아임포트)

	function paymentProcess() {
		console.log("TEMP CALLED");

		var IMP = window.IMP;
		IMP.init('imp89839657');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : 'Kia Tigers 경기 예매권(팬페이지 구매)', //상품명
			amount : amount, //가격 이것만 있어도 결제는 넘어감 
		/* buyer_email : ${loginUser.id},//<- id로 
		buyer_name :  ${loginUser.name},
		buyer_tel :  ${loginUser.phone} */

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
			progress();
		});
	}

	//결제성공시 성공완료 페이지로 넘어가는 function 
	function progress() {
		alert("결제완료 페이지로 이동합니다");
		
		$("#hidden_seat").val($("input[name=zoneCheck]:checked").val());
		$("#hidden_cnt").val( $("#quantity").val() );
		$("#hidden_total").val(amount);

		console.log($("#hidden_seat"));
		console.log($("#hidden_cnt"));
		console.log($("#hidden_total"));
		
		$("#pform").submit();
	}
</script>
</html>

<jsp:include page="/WEB-INF/views/ticket/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />