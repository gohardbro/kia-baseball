<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />


<div class="wrapper style1">

	<div class="container">
		<div class="goods">
			<div class="goods-thumbnail">
				<img src="/images/default-profile.png">
			</div>
			<div class="goods-info">
				<div class="goods-header">
					<div class="tit">
						<h2>[DIADORA] D2201MRS05 2022 KIA타이거즈 어센틱 아이싱 티셔츠</h2>
					</div>
				</div>

				<div class="items">
					<ul>
						<li><strong>짧은설명</strong>
							<div>사용연령 : 만 14세이상</div></li>
						<li><strong>정가</strong>
							<div>
								<span>89,000</span>"원"
							</div></li>
						<li class="price"><strong>판매가</strong>
							<div>
								<strong>89,000</strong><span>원</span>
							</div></li>
						<li><strong>구매제한</strong>
							<div>
								<span>최소 1개</span>
							</div></li>
						<li><strong>상품코드</strong>
							<div>1000003053</div></li>
						<li><strong>자체상품코드</strong>
							<div>DB225MPKAP010</div></li>
						<li><strong>제조사</strong>
							<div>(주)하나아이앤</div></li>
						<li><strong>원산지</strong>
							<div>대한민국</div></li>
						<li><strong>출시일</strong>
							<div>2022-03-10</div></li>
					</ul>
				</div>

				<div class="choice">
					<div>
						<strong>사이즈</strong>
						<div>
							<select>
								<option>= 욥션 : 가격 =</option>
								<option>FREE</option>
							</select>
						</div>
					</div>
				</div>

				<div class="option_total_display_area" style="display: block;">
					<div class="order-goods option_display_area">


						<div id="option_display_item_451401_1649386168751"
							style="border-top: 1px solid #dbdbdb;">
							<div class="check optionKey_451401">
								<input type="hidden" name="goodsNo[]" value="1000003053">
								<input type="hidden" name="optionSno[]" value="451401">
								<input type="hidden" name="goodsPriceSum[]" value="89000">
								<input type="hidden" name="addGoodsPriceSum[]" value="0">
								<input type="hidden" name="displayOptionkey[]"
									value="451401_1649386168751"> <input type="hidden"
									name="couponApplyNo[]" value=""> <input type="hidden"
									name="couponSalePriceSum[]" value=""> <input
									type="hidden" name="couponAddPriceSum[]" value=""> <span
									class="name"><strong>FREE</strong>
									<button type="button" class="btn-alert-login">
										<img src="/data/skin/front/gm_18/img/btn/coupon-apply.png"
											alt="쿠폰적용">
									</button> <span id="option_text_display_451401_1649386168751"></span></span>

								<div class="price">
									<span class="count"> <input type="text"
										class="text goodsCnt_451401_1649386168751" title="수량"
										name="goodsCnt[]" value="1" data-value="1" data-stock="194"
										data-key="451401_1649386168751"
										onchange="goodsViewController.input_count_change(this,'1');return false;">
										<span>
											<button type="button" class="up goods-cnt" title="증가"
												value="up^|^451401_1649386168751">증가</button>
											<button type="button" class="down goods-cnt" title="감소"
												value="dn^|^451401_1649386168751">감소</button>
									</span>
									</span> <em><input type="hidden" value="0"
										name="option_price_451401_1649386168751"><input
										type="hidden" value="0" name="optionPriceSum[]"><strong
										class="option_price_display_451401_1649386168751">89,000</strong>원</em>
								</div>
								<div class="del">
									<button type="button" class="delete-goods" title="삭제"
										data-key="option_display_item_451401_1649386168751">삭제</button>
								</div>
							</div>
						</div>
					</div>

					<div class="end-price" style="display: block;">
						<ul>
							<li class="price"><span>총 상품금액</span> <strong
								class="goods_total_price"> 89,000<b>원</b></strong></li>
							<li class="discount dn"><span>총 할인금액</span> <strong
								class="total_benefit_price"></strong></li>
							<li class="total"><span>총 합계금액</span> <strong
								class="total_price"> 89,000<b>원</b></strong></li>
						</ul>
					</div>

					<div class="btn">

						<a href="#" class="skinbtn point1 btn-add-cart"><em>장바구니</em></a>
						<a href="#" class="skinbtn point1 btn-add-wish"><em>찜하기</em></a> <a
							href="#" class="skinbtn point2 btn-add-order"><em>구매하기</em></a>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

<jsp:include page="/WEB-INF/views/yg/goods/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />