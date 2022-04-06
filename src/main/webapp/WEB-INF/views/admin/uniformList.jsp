<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">
	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>상품 구매내역</h2>
			</header>

			<section>
				<h3>유니폼별 집계</h3>
				<canvas id="uniformChart"></canvas>
				<span></span>
				<table style="display: none" id="c1">
					<thead>
						<tr>
							<td>111</td>
							<td>111</td>
							<td>111</td>
						</tr>
					</thead>
				</table>
			</section>

			<section>
				<h3>선수별 집계</h3>
				<canvas id="playerChart"></canvas>
				<span>더보기</span>
				<table style="display: none" id="c1">
					<thead>
						<tr>
							<td>111</td>
							<td>111</td>
							<td>111</td>
						</tr>
					</thead>
				</table>
			</section>
		</article>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	// 유니폼별 집계
	var ctx = document.getElementById('uniformChart').getContext('2d');
	var uniformChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : ${ uniformTop5.uniform },
			datasets : [ {
				label : '수량',
				backgroundColor : 'rgb(200,	153, 126)',
				borderColor : 'rgb(200,	153, 126)',
				data : ${ uniformTop5.uniformCnt }
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
					text : '유니폼 Top 5'
				}
			},
			scales : {
				yAxes : [ {
					ticks : {
						suggestedMin : 0,
						suggestedMax : 100
					}
				} ]
			}
		}
	});
	
	// 선수별 집계
	var ctx = document.getElementById('playerChart').getContext('2d');
	var playerChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : ${ playerTop5.player },
			datasets : [ {
				label : '수량',
				backgroundColor : 'rgb(200,	153, 126)',
				borderColor : 'rgb(200,	153, 126)',
				data : ${ playerTop5.uniformCnt }
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
					text : '인기 선수 Top 5'
				}
			},
			scales : {
				yAxes : [ {
					ticks : {
						suggestedMin : 0,
						suggestedMax : 100
					}
				} ]
			}
		}
	});
</script>

<jsp:include page="/WEB-INF/views/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />