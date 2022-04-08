<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container-fluid pt-3">
	
	<div class="row mt-2">
		<div class="col-lg-2">
			<ul class="nav nav-pills flex-column">	
				<li class="nav-item"><a class="nav-link ${ menu eq 'announce'? 'active': '' }" href="/announce">공지사항</a></li>
				<li class="nav-item"><a class="nav-link ${ menu eq 'free'? 'active': '' }" href="/free">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link ${ menu eq 'intro'? 'active': '' }" href="/intro">팀 소개</a></li>
				<li class="nav-item"><a class="nav-link ${ menu eq 'ticket'? 'active': '' }" href="#">선수 소개</a></li>
			</ul>
		</div>
		<div class="col-lg-10">