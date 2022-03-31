<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-responsive">
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
			<form action="/admin/uniformInfo/update">
				<tr>
					<td>${ uniformInfo.uniInfoNo }</td>
					<td style="width: 30%"><input type="text"
						value="${ uniformInfo.uniformName }" class="form-control" /></td>
					<td><input type="text" value="${ uniformInfo.color }"
						class="form-control" /></td>
					<td><input type="text" value="${ uniformInfo.uniformSize }"
						class="form-control" /></td>
					<td><input type="text" value="${ uniformInfo.playerName }"
						class="form-control" /></td>
					<td><input type="text" value="${ uniformInfo.price }"
						class="form-control" /></td>
					<td><input type="text" value="${ uniformInfo.uniformCnt }"
						class="form-control" /></td>
					<td style="width: 7%"><button type="submit"
							class="btn btn-warning">수정</button></td>
				</tr>
			</form>
		</c:forEach>
		<tr>
			<td><span class="glyphicon glyphicon-plus"></span></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><input type="text" class="form-control" /></td>
			<td><button type="button" class="btn btn-primary">등록</button></td>
		</tr>
	</tbody>
</table>
