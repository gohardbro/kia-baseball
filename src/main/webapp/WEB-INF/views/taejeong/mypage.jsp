<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/taejeong/include/top.jsp" />
<div class="contentMain">
	<div class="contentMain_main">
		<div class="contentMain_main_title">
			<span>주문목록</span>
		</div>
		<div class="contentMain_main_nav_area">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab"
						data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
						role="tab" aria-controls="nav-home" aria-selected="true">Home</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
						data-bs-target="#nav-profile" type="button" role="tab"
						aria-controls="nav-profile" aria-selected="false">Profile</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">Contact</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">...</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">...</div>
				<div class="tab-pane fade" id="nav-contact" role="tabpanel"
					aria-labelledby="nav-contact-tab">...</div>
			</div>s
		</div>
	</div>
</div>






<jsp:include page="/WEB-INF/views/taejeong/include/bottom.jsp" />