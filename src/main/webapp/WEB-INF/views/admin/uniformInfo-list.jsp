<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-responsive d-flex">
	<thead>
		<tr>
			<th>#</th>
			<th>상품명</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>선수명</th>
			<th>가격</th>
			<th>수량</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ uniformInfoList }" var="uniformInfo">
			<tr>
				<td>${ uniformInfo.uniInfoNo }</td>
				<td style="width: 30%">${ uniformInfo.uniformName }</td>
				<td>${ uniformInfo.color }</td>
				<td>${ uniformInfo.uniformSize }</td>
				<td>${ uniformInfo.playerName }</td>
				<td>${ uniformInfo.price }</td>
				<td>${ uniformInfo.uniformCnt }</td>
				<td style="width: 7%"><button type="submit" onclick="location.href='/admin/uniformInfo/update?uniInfoNo=${uniformInfo.uniInfoNo}'"
						class="btn btn-warning">수정</button></td>
			</tr>
		</c:forEach>
		<!-- <tr>
			<td><span class="glyphicon glyphicon-plus"></span></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><button type="button" class="btn btn-primary">등록</button></td>
		</tr> -->
	</tbody>
</table>
