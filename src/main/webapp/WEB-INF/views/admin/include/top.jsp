<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container-fluid pt-3">

    <div class="row mt-2">
        <div class="col-lg-2">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item"><a class="nav-link ${ menu eq 'account'? 'active': '' }" href="/admin">계정관리</a></li>
                <li class="nav-item"><a class="nav-link ${ menu eq 'uniform'? 'active': '' }" href="/admin/uniformInfo">상품관리</a></li>
                <li class="nav-item"><a class="nav-link ${ menu eq 'lineup'? 'active': '' }" href="/admin/lineup">라인업</a></li>
                <li class="nav-item"><a class="nav-link ${ menu eq 'ticket'? 'active': '' }" href="/admin/ticket">티켓 예매내역</a></li>
                <li class="nav-item"><a class="nav-link ${ menu eq 'uniformList'? 'active': '' }" href="/admin/uniformList">상품 구매내역</a></li>
            </ul>
        </div>
        <div class="col-lg-10">