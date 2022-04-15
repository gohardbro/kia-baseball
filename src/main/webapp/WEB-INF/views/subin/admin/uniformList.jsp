
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/subin/admin/include/top.jsp" />

<!-- Main -->
<div class="wrapper style1">
	<div class="container">
		<article id="main" class="special">
			<header>
				<h2>상품 구매 현황</h2>
			</header>

			<section>
				<h3>유니폼별 집계</h3>
				<canvas id="uniformChart"></canvas>
				<details>
				   <summary>더보기</summary>
					<table class="table" id="uniformTable" style="margin: 2px;">
						<thead>
							<tr>
								<th>상품명</th>
								<th>수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ uniformList.uniform }" var="uniform" varStatus="status">
								<tr>
									<td>${ uniform }</td>
									<td>${ uniformList.uniformCnt[status.index] }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</details>
			</section>

			<section>
				<h3>선수별 집계</h3>
				<canvas id="playerChart"></canvas>
				<details>
				   <summary>더보기</summary>
					<table class="table" id="playerTable" style="margin: 2px;">
						<thead>
							<tr>
								<th>선수명</th>
								<th>수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ playerList.player }" var="player" varStatus="status">
								<tr>
									<td>${ player }</td>
									<td>${ playerList.uniformCnt[status.index] }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</details>
			</section>
		</article>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	var uniformNameTop5 = ${ uniformList.uniformJson };
	var uniformCntTop5 = ${ uniformList.uniformCntJson };
	uniformNameTop5 = uniformNameTop5.slice(0, 5);
	uniformCntTop5 = uniformCntTop5.slice(0, 5);
	
	// 유니폼별 집계
	var ctx = document.getElementById('uniformChart').getContext('2d');
	var uniformChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : uniformNameTop5,
			datasets : [ {
				label : '수량',
				backgroundColor : 'rgb(200,	153, 126)',
				borderColor : 'rgb(200,	153, 126)',
				data : uniformCntTop5
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
	
	var playerNameTop5 = ${ playerList.playerJson };
	var PlayerCntTop5 = ${ playerList.uniformCntJson };
	playerNameTop5 = playerNameTop5.slice(0, 5);
	PlayerCntTop5 = PlayerCntTop5.slice(0, 5);
	// 선수별 집계
	var ctx = document.getElementById('playerChart').getContext('2d');
	var playerChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : playerNameTop5,
			datasets : [ {
				label : '수량',
				backgroundColor : 'rgb(200,	153, 126)',
				borderColor : 'rgb(200,	153, 126)',
				data : PlayerCntTop5
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

<style>
details {
	margin: 20px 0 10px;
}

details>summary {
	background: #EF9A9A;
	color: #fff;
	padding: 10px;
	outline: 0;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.5s;
	text-align: left;
	box-shadow: 1px 1px 2px gray;
}

details>summary::-webkit-details-marker {
	background: #EF9A9A;
	color: #fff;
	background-size: contain;
	transform: rotate3d(0, 0, 1, 90deg);
	transition: transform 0.25s;
}

details[open]>summary::-webkit-details-marker {
	transform: rotate3d(0, 0, 1, 180deg);
}

details[open]>summary {
	background: #EF9A9A;
}

details[open]>summary ~ * {
	animation: reveal 0.5s;
}

.tpt {
	background: #444;
	color: #fff;
	margin: 5px 0 10px;
	padding: 5px 10px;
	line-height: 25px;
	border-radius: 5px;
	box-shadow: 1px 1px 2px gray;
}

@keyframes reveal {
	from { opacity:0;
		transform: translate3d(0, -30px, 0);
	}

	to {
		opacity: 1;
		transform: translate3d(0, 0, 0);
	}
}
</style>

<jsp:include page="/WEB-INF/views/subin/admin/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />