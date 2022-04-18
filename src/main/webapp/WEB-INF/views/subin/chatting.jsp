<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<div class="container">
	<div class="wrapper">
	<article id="main" class="special">
		<header>
			<h2>실시간 채팅</h2>
			<p style="font-size: 14px;">동시 접속자 수 <strong id="total"></strong></p>
		</header>
	
		<form>
			<div class="custom-control custom-switch">
				<input type="checkbox" class="custom-control-input" id="alert" checked>
				<label class="custom-control-label" for="alert">입장/퇴장 알림</label>
			</div>
			<div style="list-style: none;" id="result"></div>
			<div style="display: flex; margin: 5px;">
				<input type="text" class="form-control form-control" style="width: 80%; margin: 5px;" id="msg">
				<button type="button" class="btn btn-light" style="width: 20%; margin: 5px;">보내기</button>
			</div>
		</form>
	</article>
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
			if ($('#alert').is(':checked')) {
				$("#result").append("<div id='chat'><small>[알림]</small><p>"+recv.nickname+" 님이 참가하였습니다.</p></div>");
			}
			$("#total").html(recv.total);
			break;
			
		case "chat": // 채팅
			
			if (recv.sender) { // 내가 쓴 글 일때
				$("#result").append("<div class='d-flex justify-content-end'><div id='chat'><small>" + recv.nickname + "</small><p>" + recv.msg + "</p></div></div>");
				
			} else {
				$("#result").append("<div id='chat'><small>" + recv.nickname + "</small><p>" + recv.msg + "</p></div>");
			}
			$("#result").scrollTop($("#result")[0].scrollHeight);
			break;
			
		case "out": // 퇴장
			if ($('#alert').is(':checked')) {
				$("#result").append("<div id='chat'><small>[알림]</small><p>"+recv.nickname+" 님이 나가셨습니다.</p></div>");
			}
			$("#total").html(recv.total);
			break;
		}
	}
	
	ws.onclose = function() { // 소켓 연결 종료
	}

	$(".btn").on("click", function() { // 메시지작성 후 작성란 초기화
		sendMsg();
	});
	
	$("#msg").on("keydown", function(e){ // 메시지 입력란에서 엔터 누른 경우
		var code = e.keyCode || e.which;
		if (code == 13) { // 엔터 입력 시 
			sendMsg();
			return false;
		}
	}); 
	
	function sendMsg(){ // 메시지 전송
		var msg = $("#msg").val();
		if (msg != "") {
			ws.send(msg);
			$("#msg").val("");
		}
	}
</script>

<style>
#result {
	margin: 20px;
    height:500px;
    overflow-y:scroll;
} 

#result #chat {
	background-color: #f0f1f4;
	border-radius: 10px;
	padding: 10px;
	padding-left: 30px;
	margin: 10px;
	width: 30%;
}

#result div p {
	margin: 0px;
}
</style>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />