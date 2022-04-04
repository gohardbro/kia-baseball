<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>

<!-- Main -->
<div class="wrapper style1">

	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>티켓 예매내역</h2>
			</header>

			<section>
				<nav class="navbar navbar-expand-sm" style = "max-width : 1175px">
				<input type="month" class="form-control" name="gameDate"
					style="width: 20%; margin: 5px;">
				<select id="dateAndTime" class="custom-select" style="width: 10%; margin: 5px;">
					<option selected>첫째 주</option>
					<option>둘째 주</option>
					<option>셋째 주</option>
					<option>넷째 주</option>
				</select>
				<select id="dateAndTime" class="custom-select" style="width: 10%; margin: 5px;">
					<option selected>K3석</option>
					<option>K5석</option>
					<option>K8석</option>
					<option>K9석</option>
					<option>니로석</option>
					<option>스포티지석</option>
				</select>
				</nav>
				<canvas id="myChart"></canvas>
			</section>
		</article>

	</div>

</div>

<script>
	/* $("[name=gameDate]").change(function(e) { // 게임 일정 목록값이 바뀌면
		var gameDate = $(this).val();

		$.ajax({
			url : "/admin/ticket/search",
			data : {
				"gameDate" : gameDate
			}
		}).done(function(data) {
			console.log(data);
		});
	}); */

	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
			datasets : [ {
				label : 'K3',
				backgroundColor : 'rgb(200,	153, 126)',
				borderColor : 'rgb(200,	153, 126)',
				data : [ 20, 80, 50, 85, 76, 64 ]
			}, ]
		},
		options : {
			responsive : true,
			plugins : {
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : '야구장 티켓 예매 현황'
				}
			},
			scales: {
				yAxes: [{
					ticks: {
						suggestedMin: 0,
						suggestedMax: 100
					}
				}]
			}
		}
	});
</script>

<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />