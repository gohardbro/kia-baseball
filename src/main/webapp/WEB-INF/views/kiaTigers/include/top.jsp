
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container-fluid pt-3">

    <div class="row mt-2">
        <div class="col-lg-2">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item"><a class="nav-link ${ menu eq 'team'? 'active': '' }" href="#">팀소개</a></li>
                <li class="nav-item"><a class="nav-link ${ menu eq 'player'? 'active': '' }" href="#">선수소개</a></li>
                <li class="nav-item"><a class="nav-link ${ menu eq 'schedule'? 'active': '' }" href="/kiaTigers/schedule">경기일정</a></li>
            </ul>
        </div>
        <div class="col-lg-10">