<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
ul {
	padding: 0;
	list-style: none;
}

li {
	padding: 3px 0;
}

.myMenu {
	padding: 10px 0;
	border: 1px solid rgb(225, 228, 230);
	width: 148px;
	float: left;
}

.navTab {
	padding: 15px 10px 16px 17px;
	border-bottom: 1px solid rgb(225, 228, 230);
	width: 121px;
	font-size: 12px;
}

.myInfo {
	border: none;
}

a:link {
	text-decoration: none;
	color: #111111;
}

a:hover {
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

<div class="myMenu">
	<nav class="sideTab">
		<div class="navTab ticketing">
			<div class="listTitle">MY 예매</div>
			<div class="listContainer">
				<ul class="">
					<li id="" class=""><a href="/mypage" title="주문목록/배송조회"
						target="_self" class="">예매내역</a></li>
					<li id="" class=""><a href="/#" title="" target="_self"
						class="">취소/반품/교환/환불내역</a></li>
					<li id="" class=""><a href="/#" title="영수증 조회/출력"
						target="_self" class="">영수증 조회/출력<span id="" class=""></span><span
							class=""></span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="navTab goods">
			<div class="listTitle">MY 굿즈</div>
			<div class="listContainer">
				<ul class="">
					<li id="" class=""><a href="/#" title="" target="_self"
						class="">굿즈예약내역</a></li>
					<li id="" class=""><a href="/#" title="" target="_self"
						class="">찜리스트</a></li>
					<li id="" class="\"><a href="/#" title="" target="_self"
						class="">장바구니</a></li>
				</ul>
			</div>
		</div>
		<div class="navTab activity">
			<div class="listTitle">MY 활동</div>
			<div class="listContainer">
				<ul class="">
					<li id="" class=""><a href="/#" title="문의하기" target="_self"
						class=" ">문의하기</a></li>
					<li id="" class=""><a href="/#" title="문의내역 확인" target="_self"
						class="">문의내역 확인</a></li>
					<li id="" class=""><a href="/#" title="리뷰관리" target="_self"
						class=" ">리뷰관리<span id="" class=""></span></a></li>
					<li id="" class=""><a href="/#" title="찜 리스트" target="_self"
						class=" ">찜 리스트</a></li>
					<li id="" class=""><a href="/#" title="찜 리스트" target="_self"
						class=" ">포인트조회</a></li>
					<li id="" class=""><a href="/#" title="문의하기" target="_self"
						class=" ">신고내역</a></li>

				</ul>
			</div>
		</div>
		<div class="navTab myInfo">
			<div class="listTitle">MY 정보</div>
			<div class="listContainer">
				<ul class="">
					<li id="" class=""><a href="/account" title="개인정보확인/수정" target="_self"
						class=" ">개인정보확인/수정</a></li>
					<li id="" class=""><a href="/#" title="문의하기" target="_self"
						class=" ">결제수단관리</a></li>
					<li id="" class=""><a href="/#" title="문의하기" target="_self"
						class=" ">배송지 관리</a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>


