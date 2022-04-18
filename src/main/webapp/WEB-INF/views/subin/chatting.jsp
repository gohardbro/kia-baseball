<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<div class="container">
	<div class="wrapper">
		<div id="total"></div>
		<div id="result"></div>
		<input type="text" id="msg"/>
	</div>
</div>

<script>
	var serverName = location.host;
	var ws = new WebSocket("ws://" + serverName + "/ws/alert"); // 소켓 생성

	ws.onopen = function() { // 소켓 연결
	}

	ws.onmessage = function(rst) { // 소켓을 통해 서버로부터 메시지를 전달받았을 때
		var recv = JSON.parse(rst.data);
		switch (recv.command) {
		case "join": // 입장
			$("#result").append("<div>[SERVER] "+recv.nickname+" 님이 참가하였습니다.</div>");
			$("#total").html(recv.total);
			break;
			
		case "chat": // 채팅
			$("#result").append("<div>[" + recv.nickname + "]" + recv.msg + "</div>");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			break;
			
		case "out": // 퇴장
			if ($('#alarm').is(':checked')) {
				$("#result").append("<div>[SERVER] "+recv.nickname+" 님이 나가셨습니다.</div>");
			}
			$("#total").html(recv.total);
			break;
		}
	}
	
	ws.onclose = function() { // 소켓 연결 종료
	}

	$("#msg").on("change", function() { // 메시지작성 후 작성란 초기화
		var msg = $(this).val();
		if (msg != "") {
			ws.send(msg);
			$(this).val("");
		}
	});
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />