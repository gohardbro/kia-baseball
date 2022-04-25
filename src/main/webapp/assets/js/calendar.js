function printDate(inputMonth, db){
	inputDate = inputMonth.split("-");
	var prevLast = new Date(inputDate[0], inputDate[1]-1, 0); // 지난 달 마지막 날짜
	var thisLast = new Date(inputDate[0], inputDate[1], 0); // 이번 달 마지막 날짜
	
	var PLDate = prevLast.getDate(); // 지난 달 마지막 날짜
	var PLDay = prevLast.getDay(); // 지난 달 마지막 날의 요일
	
	var TLDate = thisLast.getDate(); // 이번달 마지막 날짜
	var TLDay = thisLast.getDay(); // 이번달 마지막 날의 요일
	
	var prevDates = [];
	var thisDates = [];
	var nextDates = [];
	
	if (PLDay != 6) { // 지난 달 마지막 요일이 토요일이 아니라면
		for (var i = 0; i < PLDay + 1; i++) { // 이전 달
			prevDates.push('<td></td>');
			// prevDates.unshift(PLDate - i);
		}
	}
	
	for (var i = 1; i <= TLDate; i++) { // 현재 달
		var gameDate = inputDate[0] + "-" + inputDate[1] + "-" + (i <= 9 ? '0' + i : i); // 경기일자 (yyyy-MM-dd)
		var text; 
		
		if(db[gameDate] == undefined) {
			text = "<td><span>"+i+"</span>";
		} else {
			text = "<td data-toggle='modal' data-target='#popup' onclick='showPopup("+db[gameDate].scheduleNo+")'>" + "<span>" + i + "</span>"; // 날짜
			text += "<p><img src='/images/Logo_Mini/" + db[gameDate].teamImg + "' style='width:50px'><p>"
			+ "<p>" +db[gameDate].gameTime + "</p>"
			+"<p>"+(db[gameDate].home=='Y'? '챔피언스필드': db[gameDate].field)+"</p>";
		}
		text += "</td>";
		thisDates.push(text);
	}
	for (var i = 1; i < 7 - TLDay; i++) { // 다음 달
		nextDates.push('<td></td>');
	}
	
	dates = prevDates.concat(thisDates, nextDates); // 배열 합치기
	_html = "";
	for (var i = 0; i < dates.length; i++) {
		if (i % 7 == 0) {
			_html += "<tr>";
		}
		_html += dates[i];
		if (i % 7 == 6) {
			_html += "</tr>";
		}
	}
	return _html;
}

