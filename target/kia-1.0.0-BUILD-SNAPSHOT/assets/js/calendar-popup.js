function showPopup(scheduleNo){ // 팝업
	$.ajax({
		url: "/kiaTigers/calendar/popup",
		data: {
			"scheduleNo": scheduleNo
		},
		async: false
		
	}).done(function(data){
		$(".modal-title").html(data["schedule"].gameDate);

		var _score;
		if (data["score"] == undefined) {
			_score = "<p>데이터 수신 시 기록이 업데이트 됩니다.</p>";
			$('.score-table').css('display', 'none');
			$(".score-msg").css('display', '');
			$(".score-msg").html(_score);
			
		} else {
			if (data["schedule"].home == 'Y') { // 후공
				_score = "<tr><td>"+data["schedule"].rival+"</td>";
				for (var i = 1; i <= 12; i++) {
					_score += "<td>"+data["score"].rivalArray[i]+"</td>";
				}
				_score += "<td>"+data["score"].rivalArray[0]+"</td></tr>";
				_score += "<tr><td>KIA</td>";
				for (var i = 1; i <= 12; i++) {
					_score += "<td>"+data["score"].kiaArray[i]+"</td>";
				}
				_score += "<td>"+data["score"].kiaArray[0]+"</td></tr>";
				
			} else { // 선공
				_score = "<tr><td>KIA</td>";
				for (var i = 1; i <= 12; i++) {
					_score += "<td>"+data["score"].kiaArray[i]+"</td>";
				}
				_score += "<td>"+data["score"].kiaArray[0]+"</td></tr>";
				_score += "<tr><td>"+data["schedule"].rival+"</td>";
				for (var i = 1; i <= 12; i++) {
					_score += "<td>"+data["score"].rivalArray[i]+"</td>";
				}
				_score += "<td>"+data["score"].rivalArray[0]+"</td></tr>";
			}
			$('.score-table').css('display', '');
			$(".score-msg").css('display', 'none');
			$(".score-tbody").html(_score);
			
		}
		
		var _lineup;
		if (data["lineup"] == undefined) {
			_lineup = "<p>출전 선수 명단이 확정되면 업데이트 됩니다.</p>";
			$('.lineup-msg').css('display', '');
			$(".lineup-ul").css('display', 'none');
			$(".lineup-msg").html(_lineup);
			
		} else {
			$('.lineup-msg').css('display', 'none');
			$(".lineup-ul").css('display', '');
			
			$(".pitcher").html(data["lineup"].pitcher);
			for (var i = 0; i <= data["lineup"].hitterList.length; i++) {
				$(".hitter_"+(i+1)).html(data["lineup"].hitterList[i]);
			}
		}
		
		
	});
}
