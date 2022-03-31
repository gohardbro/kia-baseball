<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TeamInjung</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
section {
	margin-right: 15%;
	margin-left: 15%;
	padding-bottom: 40px;
	width: 980px;
}

ul {
	padding: 0;
	list-style: none;
}

.myMenu {
	padding: 10px 0;
	border: 1px solid rgb(225, 228, 230);
	width: 148px;
	float: left;
}

.myShopping, .myInfo, .myTicketing {
	padding: 15px 10px 16px 17px;
	border-bottom: 1px solid rgb(225, 228, 230);
	width: 121px;
	margin: 0;
	font-size: 12px;
}

a:link {
	text-decoration: none;
	color: #111111;
}
a:hover{
	color: #3d82f7;
}

.listContainer {
	margin-top: 11px;
}

.listTitle {
	font-size: 14px;
	font-weight: bold;
}

.contentMain {
	width: 830px;
	float: left;
}

.contentMain_main {
	margin-left: 30px;
}

.contentMain_main_title {
	margin-bottom: 16px;
}
</style>
</head>
<body>
	<section class="contents">
		<div class="myMenu">
			<nav>
				<div class="myShopping">
					<div class="listTitle">MY 예매</div>
					<div class="listContainer">
						<ul class="">
							<li id="" class=""><a href="/#" title="주문목록/배송조회"
								target="_self" class="">예매내역</a></li>
							<li id="" class=""><a href="/#" title="" target="_self"
								class="sc-1liba5b-10 dgvaTR">취소/반품/교환/환불내역</a></li>
							<li id="mc-receipt-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="영수증 조회/출력" target="_self"
								class="sc-1liba5b-10 dgvaTR">영수증 조회/출력<span
									id="subscribedLnbMenuBadge" class="sc-1liba5b-12 kYzstG"></span><span
									class="sc-1liba5b-13 gKlrLP"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="myInfo">
					<div class="listTitle">MY 굿즈</div>
					<div class="listContainer">
						<ul class="sc-1liba5b-8 eoSmRC">
							<li id="mc-discount-coupon-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="할인쿠폰" target="_self"
								class="sc-1liba5b-10 dgvaTR">굿즈예약내역</a></li>
							<li id="mc-discount-coupon-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="할인쿠폰" target="_self"
								class="sc-1liba5b-10 dgvaTR">찜리스트</a></li>
							<li id="mc-discount-coupon-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="할인쿠폰" target="_self"
								class="sc-1liba5b-10 dgvaTR">장바구니</a></li>
						</ul>
					</div>
				</div>
				<div class="myTicketing">
					<div class="listTitle">MY 활동</div>
					<div class="listContainer">
						<ul class="sc-1liba5b-8 eoSmRC">
							<li id="mc-cs-main-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="문의하기" target="_self"
								class="sc-1liba5b-10 dgvaTR">문의하기</a></li>
							<li id="mc-product-inquiry-list-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="문의내역 확인" target="_self"
								class="sc-1liba5b-10 dgvaTR">문의내역 확인</a></li>
							<li id="mc-product-review-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="리뷰관리" target="_self"
								class="sc-1liba5b-10 dgvaTR">리뷰관리<span
									id="productReviewLnbMenuBadge" class="sc-1liba5b-11 jeGEJq"></span></a></li>
							<li id="mc-product-wish-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="찜 리스트" target="_self"
								class="sc-1liba5b-10 dgvaTR">찜 리스트</a></li>
							<li id="mc-product-wish-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="찜 리스트" target="_self"
								class="sc-1liba5b-10 dgvaTR">포인트조회</a></li>
							<li id="mc-cs-main-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="문의하기" target="_self"
								class="sc-1liba5b-10 dgvaTR">신고내역</a></li>
							
						</ul>
					</div>
				</div>
				<div class="myInfo">
					<div class="listTitle">MY 정보</div>
					<div class="listContainer">
						<ul class="sc-1liba5b-8 eoSmRC">
							<li id="mc-cs-main-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="문의하기" target="_self"
								class="sc-1liba5b-10 dgvaTR">개인정보확인/수정</a></li>
							
							

							<li id="mc-cs-main-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="문의하기" target="_self"
								class="sc-1liba5b-10 dgvaTR">결제수단관리</a></li>
							<li id="mc-cs-main-page" class="sc-1liba5b-9 ekQhSz"><a
								href="/#" title="문의하기" target="_self"
								class="sc-1liba5b-10 dgvaTR">배송지 관리</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>