
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
.link {
	color: black;
}
.link:hover{
	color: #007BFF;
}
</style>

<div class="myMenu">
	<nav class="sideTab">
		<div class="navTab ticketing">
			<div class="listTitle">MY 예매</div>
			<div class="listContainer">
				<ul >
					<li id="" ><a class="link" href="/mypage" title="주문목록/배송조회"
						target="_self" >예매내역</a></li>
					<li id="" ><a class="link" href="/#" title="" target="_self"
						>취소/반품/교환/환불내역</a></li>
					<li id="" ><a class="link" href="/#" title="영수증 조회/출력"
						target="_self" >영수증 조회/출력<span id="" ></span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="navTab goods">
			<div class="listTitle">MY 굿즈</div>
			<div class="listContainer">
				<ul >
					<li id="" ><a class="link" href="/cart" title="" target="_self">장바구니</a></li>
					<li id="" ><a class="link" href="/purchaseHistory" title="" target="_self">구매내역</a></li>
				</ul>
			</div>
		</div>
		<div class="navTab activity">
			<div class="listTitle">MY 활동</div>
			<div class="listContainer">
				<ul >
					<li id="" ><a class="link" href="/inquiry" title="문의하기" target="_self">문의하기</a></li>
					<li id="" ><a class="link" href="/inquiry/history" title="문의내역 확인" target="_self">문의내역 확인</a></li>
					<li id="" ><a class="link" href="/#" title="찜 리스트" target="_self">포인트조회</a></li>
					<li id="" ><a class="link" href="/#" title="문의하기" target="_self">신고내역</a></li>

				</ul>
			</div>
		</div>
		<div class="navTab myInfo">
			<div class="listTitle">MY 정보</div>
			<div class="listContainer">
				<ul >
					<li id="" ><a class="link" href="/account" title="개인정보확인/수정" target="_self">개인정보확인/수정</a></li>
					<li id="" ><a class="link" href="/#" title="문의하기" target="_self">결제수단관리</a></li>
					<li id="" ><a class="link" href="/#" title="문의하기" target="_self">배송지 관리</a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>


