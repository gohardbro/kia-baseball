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
			prevDates.push('');
			// prevDates.unshift(PLDate - i);
		}
	}
	
	for (var i = 1; i <= TLDate; i++) { // 현재 달
		var gameDate = inputDate[0] + "-" + inputDate[1] + "-" + (i <= 9 ? '0' + i : i); // 경기일자 (yyyy-MM-dd)
		var text = "<span>" + i + "</span>"; // 날짜
		for (var j = 0; j < db.length; j++) {
			if (db[j].gameDate == gameDate) {
				text += "<p><img src='/images/Logo_Mini/" + db[j].teamImg + "' style='width:50px'><p>"
						+ "<p>" + db[j].gameTime + "</p>"
						+"<p>"+(db[j].home=='Y'? '챔피언스필드': db[j].field)+"</p>";
				break;
			}
		}
	
		thisDates.push(text);
	}
	for (var i = 1; i < 7 - TLDay; i++) { // 다음 달
		nextDates.push('');
	}
	
	dates = prevDates.concat(thisDates, nextDates); // 배열 합치기
	_html = "";
	for (var i = 0; i < dates.length; i++) {
		if (i % 7 == 0) {
			_html += "<tr>";
		}
		_html += "<td>" + dates[i] + "</td>";
		if (i % 7 == 6) {
			_html += "</tr>";
		}
	}
	return _html;
}