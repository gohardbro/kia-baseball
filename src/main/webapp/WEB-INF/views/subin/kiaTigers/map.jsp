<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/subin/kiaTigers/include/top.jsp" />

<!-- Main -->
<div class="container">
	<div class="wrapper">
		<img src="/images/field.png" style="width: 100%">
			
		<div style="padding-top: 40px;" onclick="location.href='https://map.kakao.com/link/to/챔피언스필드,35.1682374, 126.8895655'">
			<div id="map" style="width: 100%; height: 800px;"></div>
		</div>
	</div>
</div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db557ee61fbfc37f16ab0133e3931909"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.1682374, 126.8895655), // 지도의 중심 좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(container, options); // 지도 생성

	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'; // 마커이미지의 주소입니다    
	var imageSize = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
	var imageOption = {
		offset : new kakao.maps.Point(27, 69)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption), markerPosition = new kakao.maps.LatLng(35.1682374,
			126.8895655); // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition,
		image : markerImage
	// 마커이미지 설정 
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>

<jsp:include page="/WEB-INF/views/subin/kiaTigers/include/bottom.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />