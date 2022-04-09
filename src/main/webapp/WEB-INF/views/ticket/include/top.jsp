
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container-fluid pt-3">

	<div class="row mt-2">
		<div class="col-lg-2">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a
					class="nav-link ${ menu eq 'zoneInfo'? 'active': '' }"
					href="/ticket">경기장 구역별 좌석 안내</a></li>
				<li class="nav-item"><a
					class="nav-link ${ menu eq 'ticketBuy'? 'active': '' }"
					href="/ticketBuy">경기 티켓 예매</a></li>
			</ul>
		</div>
		<div class="col-lg-10">

