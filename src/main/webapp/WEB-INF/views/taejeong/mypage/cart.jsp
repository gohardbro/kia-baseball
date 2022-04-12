
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
								<col style="width: 35px;">
								<col style="width: 150px;">
								<col style="width: 100px;">
								<col style="width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th><label><input type="checkbox"
											class="checkAllbox" onclick="checkAll()"> 전체선택</label></th>
									<th>이미지</th>
									<th>상품정보</th>
									<th>상품금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${uniformCartList }" var="uniformCartList" varStatus="status">
									<tr>
										<td><input type="checkbox" class="checkbox checkbox${uniformCartList.uniformNo }" name="chkList" value="${uniformCartList.price * uniformCartList.uniCnt }"></td>
										<td><img src="${uniformCartList.uniformImg }"></td>
										<td class="productBox">
											<div class="namePart">
												${uniformCartList.uniformName }
												, ${uniformCartList.no }번 ${uniformCartList.name }
												, ${uniformCartList.color }
											</div>
											<div class="totalPriceOption">
												<span id="price"><fmt:formatNumber value="${uniformCartList.price }" pattern="#,###"></fmt:formatNumber>원 </span> 
												<select class="selectbox" data-price="${uniformCartList.price }" data-no="${uniformCartList.uniformNo }" data-cnt="${uniformCartList.uniCnt }">
													<option value="1" ${uniformCartList.uniCnt == 1 ? "selected" : "" }>1
													<option value="2" ${uniformCartList.uniCnt == 2 ? "selected" : "" }>2
													<option value="3" ${uniformCartList.uniCnt == 3 ? "selected" : "" }>3
													<option value="4" ${uniformCartList.uniCnt == 4 ? "selected" : "" }>4
													<option value="5" ${uniformCartList.uniCnt == 5 ? "selected" : "" }>5
													<option value="6" ${uniformCartList.uniCnt == 6 ? "selected" : "" }>6
													<option value="7" ${uniformCartList.uniCnt == 7 ? "selected" : "" }>7
													<option value="8" ${uniformCartList.uniCnt == 8 ? "selected" : "" }>8
													<option value="9" ${uniformCartList.uniCnt == 9 ? "selected" : "" }>9
													<option value="10" ${uniformCartList.uniCnt == 10 ? "selected" : "" }>10+ 
												</select>
												개
											</div>
										</td>
										<td class="totalPrice${uniformCartList.uniformNo }"><fmt:formatNumber value="${uniformCartList.price * uniformCartList.uniCnt }" pattern="#,###"></fmt:formatNumber>원</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="4">총 상품가격 = <strong id="selectedTotalPrice" style="font-size: 17px;"></strong>원</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;"></div>
</div>

<script>
	
	
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

	$(".selectbox").change(
			function() {
				var params = {
					price : $(this).data("price"),
					uniCnt : $(this).val(),
					uniformNo : $(this).data("no")
				}

				console.log($(this).data("price") + "/" + $(this).val() + "/"
						+ $(this).data("no"));

				var uniformNo = $(this).data("no");
				$.ajax({
					type : "POST",
					url : "/cart/calTotalPrice",
					data : params,
					success : function(total) {
						var totalAddedComma = addComma(total);
						$(".totalPrice" + uniformNo)
								.html(totalAddedComma + "원");
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