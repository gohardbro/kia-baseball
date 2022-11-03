function getInputDayLabel(v) {
    
    var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
    

    var today = new Date(v).getDay();
    var todayLabel = week[today];
    
    return todayLabel;
}

