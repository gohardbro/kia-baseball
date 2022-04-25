
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	border-bottom: 1px solid #e3e3e3;
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

.checkbox {
	width: 15px;
	height: 15px;
	border: 1px solid black;
}
.btn_zone {
	text-align: center;
}
.namePart {
	border-bottom: 1px solid #e3e3e3;
}
.totalPriceOption, .namePart{
	margin: 7px; 0;
}
.addOptionBtn {
	width: 65px;
	height: 28px;	
	padding: 2px;
	font-size: 11px;
	border: 1px solid black;
	background-color: white;
	color: black;
	font-weight: bold;
} 
.addOptionBtn:hover {
	background-color: #007bff;
}
.selectboxInput {
	width: 60px;
	height: 28px;
}
.direct{
	margin: 5px;
}
.link {
	color: black;
}
.link:hover{
	color: #007BFF;
}
</style>

<div class="row" style="margin: 0px;">
	<div class="column side" style="background-color: #f4f4f4;"></div>
	<div class="column middle">
		<div class="row">
			<div class="main_wrapper col-12">
				<div class="titleZone">
					<h3>장바구니</h3>
				</div>
				<div class="main_content">
					<p style="font-size: 13px; color: #999; margin: 36px 0 26px;">
					</p>



					<div class="divider"></div>
					<div>
						<table>
							<colgroup>
								<col style="width: 70px;">
								<col style="width: 150px;">
								<col>
								<col style="width: 130px;">
							</colgroup>
							<thead>
								<tr>
									<th><label><input type="checkbox"
											class="checkAllbox checkbox" onclick="checkAll()"> 전체선택</label></th>
									<th>이미지</th>
									<th>상품정보</th>
									<th>상품금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${uniformCartList }" var="uniformCartList" varStatus="status">
									<tr>
										<td><input type="checkbox" class="checkbox checkbox${uniformCartList.uniformNo }" name="chkList" value="${uniformCartList.price * uniformCartList.uniCnt }" data-unino="${uniformCartList.uniformNo }"></td>
										<td><a href="/info?uniInfoNo=${uniformCartList.uniInfoNo }" class="link"><img src="images/uniform/${uniformCartList.uniformImg }" style="width:100px; height:100px;"></a></td>
										<td class="productBox">
											<div class="namePart">
												<a href="/info?uniInfoNo=${uniformCartList.uniInfoNo }" class="link">
													${uniformCartList.uniformName }
													, ${uniformCartList.no }번 ${uniformCartList.name }
													, ${uniformCartList.color }, ${uniformCartList.uniSize }
												</a>
											</div>
											<div class="totalPriceOption">
												<span id="price"><fmt:formatNumber value="${uniformCartList.price }" pattern="#,###"></fmt:formatNumber>원 </span>
												<select class="selectbox selectbox${uniformCartList.uniformNo }" data-price="${uniformCartList.price }" data-no="${uniformCartList.uniformNo }" data-cnt="${uniformCartList.uniCnt }">
													<option value="1" ${uniformCartList.uniCnt == 1 ? "selected" : "" }>1
													<option value="2" ${uniformCartList.uniCnt == 2 ? "selected" : "" }>2
													<option value="3" ${uniformCartList.uniCnt == 3 ? "selected" : "" }>3
													<option value="4" ${uniformCartList.uniCnt == 4 ? "selected" : "" }>4
													<option value="5" ${uniformCartList.uniCnt == 5 ? "selected" : "" }>5
													<option value="6" ${uniformCartList.uniCnt == 6 ? "selected" : "" }>6
													<option value="7" ${uniformCartList.uniCnt == 7 ? "selected" : "" }>7
													<option value="8" ${uniformCartList.uniCnt == 8 ? "selected" : "" }>8
													<option value="9" ${uniformCartList.uniCnt == 9 ? "selected" : "" }>9
													<option value="10+" ${uniformCartList.uniCnt == 10 ? "selected" : "" }>10+ 
													<c:if test="${uniformCartList.uniCnt > 9}">
														<option value="${uniformCartList.uniCnt}" selected>${uniformCartList.uniCnt}
													</c:if>
												</select>
												개
												<div class="direct direct${uniformCartList.uniformNo }" data-no="${uniformCartList.uniformNo }">
													<input type="number" class="selectboxInput" name="selectboxInput" min="1" max="99"/>
													<button type="button" class="addOptionBtn">수량 변경</button>
												</div>
											</div>
										</td>
										<td class="totalPrice${uniformCartList.uniformNo }"><strong><fmt:formatNumber value="${uniformCartList.price * uniformCartList.uniCnt }" pattern="#,###"></fmt:formatNumber>원</strong></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="4">총 상품가격 = <strong id="selectedTotalPrice" style="font-size: 17px;"></strong>원</td>
								</tr>
							</tbody>
						</table>
						<div class="btn_zone">
							<a class="btn btn-secondary btn-lg" id="backBtn" href="/mypage">돌아가기</a>
							<button type="button" class="btn btn-primary btn-lg" id="purchaseBtn" onclick="getCheckedProductInfo()">구매하기</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;"></div>
</div>

<script>
	/* 수량변경 입력키 숫자외엔 입력안되게 */
	$(".selectboxInput").on("keydown", function(e) {
	    if(!((e.keyCode > 95 && e.keyCode < 106) || (e.keyCode > 47 && e.keyCode < 58) || e.keyCode == 8 || e.keyCode == 9)) {
	        return false;
	    }
	});

	/* select에서 10+ 선택했을때 수량직접입력하게 input 뜸 */
	$(".direct").hide();
	$('.selectbox').change(function() {
	    var r = $(this).val();
	    var direct = ".direct"+$(this).data("no");
	    
	    if (r == '10+') {
	    	$(direct).show();
	    } else {
	    	$(direct).hide();
	    }
	  }); 
	
	/* 수량변경 버튼 누르면 select에 수량 option 추가되고 selected 됌  */
	$(".addOptionBtn").click(function(){
		var direct = ".direct"+$(this).parent().data("no");
		var selectbox = ".selectbox"+$(this).parent().data("no");
		var directInputVal = $(direct).children("input").val();
		$(selectbox).append(
				"<option value='"+directInputVal+"' selected>" + directInputVal + "</option>");
		$(".direct").hide();
		$(selectbox).change();
		
	});

	// 체크박스 체크된 상품의 정보 불러온다. 그리고 iamport결제창에 정보넘김.
	function getCheckedProductInfo() {
		var uniNo = "";
		var info = [];
		var cartInfo = [];
		var total = 0;
		var uniformName = "";
		$('input[name=chkList]:checked').each(function(index) {
			uniNo = $(this).data("unino");
			info[index] = uniNo;
			cartInfo[index] = "cartInfo" + uniNo;
		});

		$.ajax({
			type : "POST",
			url : "/cart/getInfo",
			data : JSON.stringify(info),
			contentType : "application/json; charset=UTF-8",
			success : function(response) {
				for (var i = 0; i < cartInfo.length; i++) {
					total += response[cartInfo[i]].total;
					uniformName += response[cartInfo[i]].uniformNo + ", ";
					uniformName += response[cartInfo[i]].uniformName + ", ";
					uniformName += response[cartInfo[i]].no + "번, ";
					uniformName += response[cartInfo[i]].nickname + ", ";
					uniformName += response[cartInfo[i]].color + ", ";
					uniformName += response[cartInfo[i]].uniSize + "/ "; /* 추가 */
				}
				var buyer = response[cartInfo[0]].buyer;
				var username = response[cartInfo[0]].username;
				var phone = response[cartInfo[0]].phone;

				console.log(buyer);
				console.log(username);
				console.log(phone);
				console.log(uniformName);
				console.log(total);

				iamportAPI(buyer, username, phone, uniformName, total, info);
			},
			error : function() {
				alert("실패");
			}
		});

	};

	/* ----------------------------------------------------------------------------------------------------------------- */
	/* iamport 결제 API*/
	function iamportAPI(buyer, username, phone, uniformName, total, info) {
		var IMP = window.IMP; // 생략가능
		IMP.init("imp87546800");
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드

		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			/*
			'kakao':카카오페이,
			html5_inicis':이니시스(웹표준결제)
			'nice':나이스페이
			'jtnet':제이티넷
			'uplus':LG유플러스
			'danal':다날
			'payco':페이코
			'syrup':시럽페이
			'paypal':페이팔
			 */
			pay_method : 'card',
			/*
			'samsung':삼성페이,
			'card':신용카드,
			'trans':실시간계좌이체,
			'vbank':가상계좌,
			'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			merchant_uid에 경우
			https://docs.iamport.kr/implementation/payment
			위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			참고하세요.
			나중에 포스팅 해볼게요.
			 */
			name : uniformName,
			//결제창에서 보여질 이름
			amount : total,
			//가격
			buyer_email : buyer,
			buyer_name : username,
			buyer_tel : phone,
			buyer_addr : '광주광역시 북구 중흥동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete',
			custom_data : info
		/*
		모바일 결제시,
		결제가 끝나고 랜딩되는 URL을 지정
		(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				var info = rsp.custom_data;
				for (var i = 0; i < info.length; i++) {
					console.log("결제완료된 UNIFORM_NO : " + info[i]);

					$.ajax({
						type : "POST",
						url : "/cart/updateBuyDateNSizeCount",
						data : {
							"uniformNo" : info[i]
						},
						success : function() {
							console.log("buyDate 업데이트 성공!");

						},
						error : function() {
							console.log("buyDate 업데이트 실패!");
						},
					});
					window.location = ""
				}
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	};
	/* ----------------------------------------------------------------------------------------------------------------- */

	$('input[type="checkbox"]').click(function() {
		calTotal();
	});

	/* 체크박스 선택된 상품들 가격 더하기 */
	function calTotal() {
		var price = "";
		var output = 0;
		$('input[name=chkList]:checked').each(function() {
			price = $(this).val();
			output += Number(price);
		});

		$("#selectedTotalPrice").text(addComma(output));
	}

	/* 3자리 숫자마다 , 찍어준다 */
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}

	/* 셀렉트박스 바뀔때마다 db에 가격바로 저장 */
	$(".selectbox").change(
			function() {
				var params = {
					price : $(this).data("price"),
					uniCnt : $(this).val(),
					uniformNo : $(this).data("no")
				}

				var uniformNo = $(this).data("no");
				$.ajax({
					type : "POST",
					url : "/cart/calTotalPrice", /* 여기 맵핑한 컨트롤러에서 계산된 total 이랑 uniCnt DB업데이트하고 total리턴함*/
					data : params,
					success : function(total) {
						var totalAddedComma = addComma(total);
						$(".totalPrice" + uniformNo).html(
								"<strong>" + totalAddedComma + "원"
										+ "</strong>");
						$(".checkbox" + uniformNo).val(total);

						calTotal();

					},
					error : function() {

					}
				});

			});

	
	$(".btn-outline-secondary").click(function() {
		$(".btn-outline-secondary").removeClass("active");
		$(this).addClass("active");
	});

	/* 체크박스 전체선택 */
	function checkAll() {
		var chkList = $(".checkbox");
		if ($(".checkAllbox").is(":checked"))
			chkList.prop("checked", true);
		else
			chkList.prop("checked", false);
	}

	/* 체크박스하나라도 풀면 전체선택도 풀리기 */
	$(".checkbox").click(function() {
		var total = $(".checkbox").length;
		var checked = $(".checkbox:checked").length;

		if (total != checked)
			$(".checkAllbox").prop("checked", false);
		else
			$(".checkAllbox").prop("checked", true);
	});
</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />