<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal" id="popup">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h1 class="modal-title">경기 일자</h1>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<h3>경기 스코어</h3>
				<div class="score">
					<div class="score-msg"></div>
					<table class='score-table'>
						<colgroup>
							<col style='width: 15%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 5%'>
							<col style='width: 10%'>
						</colgroup>
						<thead>
							<tr>
								<th>팀명</th>
								<c:forEach begin="1" end="12" varStatus="status">
									<th>${ status.count }</th>
								</c:forEach>
								<th>점수</th>
							</tr>
						</thead>
						<tbody class="score-tbody">
						</tbody>
					</table>
				</div>

				<h3>KIA 라인업</h3>
				<div class="lineup">
					<div class="lineup-msg"></div>
					<ul class="lineup-ul">
						<li><p>
								선발투수 <strong class="pitcher"></strong>
							</p></li>
						<c:forEach begin="1" end="9" varStatus="status">
							<li><p>${ status.count }번타자
									<strong class="hitter_${ status.count }"></strong>
								</p></li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<script src="/assets/js/calendar-popup.js"></script>
