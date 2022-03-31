<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">
	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>라인업</h2>
			</header>

			<section >
				<select id="dateAndTime" class="custom-select" style="width: 180px;">
					<option selected>== 경기 날짜 ==</option>
					<c:forEach items="${ scheduleList }" var="schedule">
						<option value="${ schedule.gameDate } ${ schedule.gameTime }">${ schedule.gameDate } ${ schedule.gameTime }</option>
					</c:forEach>
					
				</select>
				<form action="/admin/lineup/insert">
					<input type="hidden" id="gameDate" name="gameDate" value=""/>
					<input type="hidden" id="gameTime" name="gameTime" value=""/>
					<input type="hidden" id="service" name="service" value=""/>
					<table class="table">
						<tr>
							<th>선발 투수</th>
							<td><input type="text" name="pitcher" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>1번 타자</th>
							<td><input type="text" name="hitter1" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>2번 타자</th>
							<td><input type="text" name="hitter2" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>3번 타자</th>
							<td><input type="text" name="hitter3" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>4번 타자</th>
							<td><input type="text" name="hitter4" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>5번 타자</th>
							<td><input type="text" name="hitter5" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>6번 타자</th>
							<td><input type="text" name="hitter6" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>7번 타자</th>
							<td><input type="text" name="hitter7" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>8번 타자</th>
							<td><input type="text" name="hitter8" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<th>9번 타자</th>
							<td><input type="text" name="hitter9" class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><button
									type="submit" class="btn btn-info">등록</button></td>
						</tr>
					</table>
				</form>
			</section>
		</article>
	</div>
</div>

<script>
 	$("#dateAndTime").change(function (e){ // 게임 일정 목록값이 바뀌면
 		$("[name=pitcher]").attr("value", "");
		$("[name=hitter1]").attr("value", "");
		$("[name=hitter2]").attr("value", "");
		$("[name=hitter3]").attr("value", "");
		$("[name=hitter4]").attr("value", "");
		$("[name=hitter5]").attr("value", "");
		$("[name=hitter6]").attr("value", "");
		$("[name=hitter7]").attr("value", "");
		$("[name=hitter8]").attr("value", "");
		$("[name=hitter9]").attr("value", "");
		$(".btn-info").html("등록");
 		var sp = $("#dateAndTime").val().split(" ");

		$("#gameDate").val(sp[0]);
		$("#gameTime").val(sp[1]);
		$("#service").val("insert");
		
		var gameDate = sp[0];
 		var gameTime = sp[1];
 		
		$.ajax({
			url: "/admin/lineup/select",
			data: {
				"gameDate": gameDate,
				"gameTime": gameTime
			}
		}).done(function(rst){
			$("[name=pitcher]").attr("value", rst.pitcher);
			$("[name=hitter1]").attr("value", rst.hitter1);
			$("[name=hitter2]").attr("value", rst.hitter2);
			$("[name=hitter3]").attr("value", rst.hitter3);
			$("[name=hitter4]").attr("value", rst.hitter4);
			$("[name=hitter5]").attr("value", rst.hitter5);
			$("[name=hitter6]").attr("value", rst.hitter6);
			$("[name=hitter7]").attr("value", rst.hitter7);
			$("[name=hitter8]").attr("value", rst.hitter8);
			$("[name=hitter9]").attr("value", rst.hitter9);
			
			if(rst != "") {
				$(".btn-info").html("수정");
				$("#service").val("update");
			}
		});		
 		
 	}); 

</script>

<style>
table tr th {
	background-color: #E8F5FF;
	width: 100px;
	text-align: center;
}

table {
	margin: 10px;
}
</style>


<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />