
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
										<td><input type="checkbox" class="checkbox" value="${uniformCartList.uniformNo }"></td>
										<td><img src="${uniformCartList.uniformImg }"></td>
										<td class="productBox">
											<div class="namePart">
												${uniformCartList.uniformName }
												, ${uniformCartList.no }번 ${uniformCartList.name }
												, ${uniformCartList.color }
												, ${uniformCartList.uniCnt }개 
											</div>
											<div class="totalPriceOption">
											
												<span id="price">${uniformCartList.price }원 </span>
												<input type="hidden" value="${uniformCartList.price }" class="priceInput">
												<select>
													<option value="1">1
													<option value="2">2
													<option value="3">3
													<option value="4">4
													<option value="5">5
													<option value="6">6
													<option value="7">7
													<option value="8">8
													<option value="9">9
													<option value="10">10+
												</select>
												<span id="cnt">* ${uniformCartList.uniCnt }</span>
											</div>
										</td>
										<td id="totalPrice">${uniformCartList.price * uniformCartList.uniCnt }</td>
									</tr>
								</c:forEach>
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
	$("option").click(function(){
		var params = {
				price : $(".priceInput").val()
				,cnt = this.val()
		}
	
	    $.ajax({
	    	type : "POST",
	    	url : "/cart/calTotalPrice",
	    	data : params,
	    	success : function(res){
	    		
	    	},
	    	error : function(){
	    		
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
		console.log($(".checkAllbox").is(":checked"));
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