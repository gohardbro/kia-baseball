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

			<section>
				<select id="dateAndTime" class="custom-select" style="width: 180px;">
					<c:forEach items="${ scheduleList }" var="schedule" varStatus="status">
						<option  ${ status.count == 1? 'selected': '' } value="${ schedule.gameDate } ${ schedule.gameTime }">${ schedule.gameDate } ${ schedule.gameTime }</option>
					</c:forEach>
				</select>
				<form action="/admin/lineup/insert">
					<input type="hidden" id="gameDate" name="gameDate" value=""/>
					<input type="hidden" id="gameTime" name="gameTime" value=""/>
					<input type="hidden" id="service" name="service" value=""/>
					<table class="table">
						<tr>
							<th>선발 투수</th>
							<td>
								<input type="text" name="pitcher" class="form-control form-control-sm" list="pitcherList">
								<datalist id="pitcherList"></datalist>
							</td>
						</tr>
						<tr>
							<th>1번 타자</th>
							<td>
								<input type="text" name="hitter1" class="form-control form-control-sm" autocomplete="off" list="hitter1List">
								<datalist id="hitter1List"></datalist>
							</td>
						</tr>
						<tr>
							<th>2번 타자</th>
							<td>
								<input type="text" name="hitter2" class="form-control form-control-sm" autocomplete="off" list="hitter2List">
								<datalist id="hitter2List"></datalist>
							</td>
						</tr>
						<tr>
							<th>3번 타자</th>
							<td>
								<input type="text" name="hitter3" class="form-control form-control-sm" autocomplete="off" list="hitter3List">
								<datalist id="hitter3List"></datalist>
							</td>
						</tr>
						<tr>
							<th>4번 타자</th>
							<td>
								<input type="text" name="hitter4" class="form-control form-control-sm" autocomplete="off" list="hitter4List">
								<datalist id="hitter4List"></datalist>
							</td>
						</tr>
						<tr>
							<th>5번 타자</th>
							<td>
								<input type="text" name="hitter5" class="form-control form-control-sm" autocomplete="off" list="hitter5List">
								<datalist id="hitter5List"></datalist>
							</td>
						</tr>
						<tr>
							<th>6번 타자</th>
							<td>
								<input type="text" name="hitter6" class="form-control form-control-sm" autocomplete="off" list="hitter6List">
								<datalist id="hitter6List"></datalist>
							</td>
						</tr>
						<tr>
							<th>7번 타자</th>
							<td>
								<input type="text" name="hitter7" class="form-control form-control-sm" autocomplete="off" list="hitter7List">
								<datalist id="hitter7List"></datalist>
							</td>
						</tr>
						<tr>
							<th>8번 타자</th>
							<td>
								<input type="text" name="hitter8" class="form-control form-control-sm" autocomplete="off" list="hitter8List">
								<datalist id="hitter8List"></datalist>
							</td>
						</tr>
						<tr>
							<th>9번 타자</th>
							<td>
								<input type="text" name="hitter9" class="form-control form-control-sm" autocomplete="off" list="hitter9List">
								<datalist id="hitter9List"></datalist>
							</td>
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
		}).done(function(data){
			$("[name=pitcher]").attr("value", data.pitcher);
			$("[name=hitter1]").attr("value", data.hitter1);
			$("[name=hitter2]").attr("value", data.hitter2);
			$("[name=hitter3]").attr("value", data.hitter3);
			$("[name=hitter4]").attr("value", data.hitter4);
			$("[name=hitter5]").attr("value", data.hitter5);
			$("[name=hitter6]").attr("value", data.hitter6);
			$("[name=hitter7]").attr("value", data.hitter7);
			$("[name=hitter8]").attr("value", data.hitter8);
			$("[name=hitter9]").attr("value", data.hitter9);
			
			if(data != "") {
				$(".btn-info").html("수정");
				$("#service").val("update");
			}
		});		
 		
 	}); 
 	
	function findPlayerName(list, name){ // 선수이름 조회
		$.ajax({
			url: "/admin/lineup/findPlayer",
			data: {
				"name": name
			}
		}).done(function(data){
			var _html = "";
			for(var i=0; i<data.length; i++){
				_html += "<option>"+data[i].name+"</option>"
			}
			
			$(list).html(_html);
		});
	}
	
	$("[name=pitcher]").on("keyup", function(){ // 투수 이름 입력시
 		findPlayerName("#pitcherList", $("[name=pitcher]").val());
 	});

	$("[name=hitter1]").on("keyup", function(){ // 1번 타자 이름 입력시
 		findPlayerName("#hitter1List", $("[name=hitter1]").val());
 	});
 	$("[name=hitter2]").on("keyup", function(){ // 2번 타자 이름 입력시
 		findPlayerName("#hitter2List", $("[name=hitter2]").val());
 	});
 	$("[name=hitter3]").on("keyup", function(){ // 3번 타자 이름 입력시
 		findPlayerName("#hitter3List", $("[name=hitter4]").val());
 	});
 	$("[name=hitter4]").on("keyup", function(){ // 4번 타자 이름 입력시
 		findPlayerName("#hitter4List", $("[name=hitter4]").val());
 	});
 	$("[name=hitter5]").on("keyup", function(){ // 5번 타자 이름 입력시
 		findPlayerName("#hitter5List", $("[name=hitter5]").val());
 	});
 	$("[name=hitter6]").on("keyup", function(){ // 6번 타자 이름 입력시
 		findPlayerName("#hitter6List", $("[name=hitter6]").val());
 	});
 	$("[name=hitter7]").on("keyup", function(){ // 7번 타자 이름 입력시
 		findPlayerName("#hitter7List", $("[name=hitter7]").val());
 	});
 	$("[name=hitter8]").on("keyup", function(){ // 8번 타자 이름 입력시
 		findPlayerName("#hitter8List", $("[name=hitter8]").val());
 	});
 	$("[name=hitter9]").on("keyup", function(){ // 9번 타자 이름 입력시
 		findPlayerName("#hitter9List", $("[name=hitter9]").val());
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