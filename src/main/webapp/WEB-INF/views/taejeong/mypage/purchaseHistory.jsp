
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<h3>????????????</h3>
				</div>
				<div class="main_content">
					<p style="font-size: 13px; color: #999; margin: 36px 0 26px;">
					</p>


					<div class="selectZone">
						<form action="/purchaseHistory/searchByPeriod" method="get">
							<div class="btn-group" role="group" aria-label="First group">
								<strong style="padding:8px 6px 7px;">????????? ??????</strong>
								<button type="submit" class="btn btn-outline-secondary"
									id="15dBtn" name="periodBtn" value="15d">15???</button>
								<button type="submit" class="btn btn-outline-secondary"
									id="1monBtn" name="periodBtn" value="1mon">1??????</button>
								<button type="submit" class="btn btn-outline-secondary"
									id="2monBtn" name="periodBtn" value="2mon">2??????</button>
								<button type="submit" class="btn btn-outline-secondary"
									id="4monBtn" name="periodBtn" value="4mon">4??????</button>
							</div>
						</form>
						<form class="selectFrom" action="/purchaseHistory/search" method="get">
							<strong>??? ??? ??????</strong> <select class="selectBtn"
								name="yearSelect" style="width: 90px;">
								<!-- ??????: ???????????? ?????? -3?????? ?????? ?????????????????? ?????????  -->
								<option value="??????" class="">??????</option>
								<option value="2022" class="">2022???</option>
								<option value="2021" class="">2021???</option>
								<option value="2020" class="">2020???</option>
							</select> <select class="selectBtn" name="monSelect" style="width: 70px;">
								<option value="" class="">???</option>
								<option value="01" class="">1???</option>
								<option value="02" class="">2???</option>
								<option value="03" class="">3???</option>
								<option value="04" class="">4???</option>
								<option value="05" class="">5???</option>
								<option value="06" class="">6???</option>
								<option value="07" class="">7???</option>
								<option value="08" class="">8???</option>
								<option value="09" class="">9???</option>
								<option value="10" class="">10???</option>
								<option value="11" class="">11???</option>
								<option value="12" class="">12???</option>
							</select>
							<button type="submit" class="btn btn-success">??????</button>
						</form>

					</div>
					<div class="divider"></div>
					<div style="margin-top: 20px;">
						<table>
							<colgroup>
								<col style="width: 120px;">
								<col>
								<col>
								<col style="width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th>????????????</th>
									<th>?????????</th>
									<th>????????????</th>
									<th>????????????</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${uniformList }" var="uniformList">
									<tr>
										<td>${uniformList.buyDate } </td>
										<td><a href="/info?uniInfoNo=${uniformList.uniInfoNo }" class="link"><img src="/images/uniform/${uniformList.uniformImg }" style="width:64px; height:64px;"></a></td>
										<td><a href="/info?uniInfoNo=${uniformList.uniInfoNo }" class="link">${uniformList.uniformName }, ${uniformList.no }???,
											${uniformList.name }, ${uniformList.color }</a></td>
										<td><fmt:formatNumber value="${uniformList.total }" pattern="#,###"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<span class="activeBtn" hidden="">${activeBtn2 }</span>

				</div>
			</div>
		</div>
	</div>

	<div class="column side" style="background-color: #f4f4f4;"></div>
</div>
<script>
	/* ??????????????? ????????? ?????? ?????? active */
	$(function(){
		var activeBtn = $(".activeBtn").text();
		console.log(activeBtn);
		if(activeBtn == "15d"){
			$(".btn-outline-secondary").removeClass("active");
			$("#15dBtn").addClass("active");
		}else if(activeBtn =="1mon"){
			$(".btn-outline-secondary").removeClass("active");
			$("#1monBtn").addClass("active");
		}else if(activeBtn =="2mon"){
			$(".btn-outline-secondary").removeClass("active");
			$("#2monBtn").addClass("active");
		}else if(activeBtn =="4mon"){
			$(".btn-outline-secondary").removeClass("active");
			$("#4monBtn").addClass("active");
		}
	});
	
	


</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />