window.onload = function(){ 
	//차트 x축 날짜 계산 함수
	function dates(sub) { //오늘 일자에서 sub인자 값을 빼서 최근 7일 계산
    	var today = new Date();
    	new Date(today.setDate(today.getDate()-sub));

    	var month = today.getMonth() + 1; //getMonth() 리턴 값 0~11이라 +1 처리
    	// month = month < 10 ? '0' + month.toString() : month.toString();

    	//월 string 처리
    switch(month) {
        case 1:
            month = "January";
            break;
        case 2:
            month = "February";
            break;
        case 3:
            month = "March";
            break;
        case 4:
            month = "April";
            break;
        case 5:
            month = "May";
            break;
        case 6:
            month = "June";
            break;
        case 7:
            month = "July";
            break;
        case 8:
            month = "August";
            break;
        case 9:
            month = "September";
            break;
        case 10:
            month = "October";
            break;
        case 11:
            month = "November";
            break;
        case 12:
            month = "December";
            break;
    }

    //일 0# 꼴 형식 처리
    var day = today.getDate();
    day = day < 10 ? '0' + day.toString() : day.toString();

    return month + " " + day ;
}

//차트 색상 변경
Chart.defaults.borderColor = 'rgb(255, 255, 255, 0.6)';

//차트 생성, 설정
var ctx = document.getElementById('mainChart'); //html <canvas>태그 id로 가져옴
var myChart = new Chart(ctx, {
    type: 'line', //차트 타입 설정
    data: { //차트 데이터 설정
        labels: [ //차트 x축 (위에 만든 dates 함수 써서 날짜로 넣음)
            dates(6),
            dates(5),
            dates(4),
            dates(3),
            dates(2),
            dates(1),
            dates(0),
        ],
        datasets: [ //차트 y축 설정 (다중 데이터 설정 가능)
            {
                label: 'visit',
                borderColor: 'rgb(204, 51, 0)',
                data: ['${visitsPerDay}']
            },
            {
                label: 'post',
                borderColor: 'rgb(0, 0, 255)',
                data: ['${postsPerDay}']
            }
        ]
    },
    options: { //추가설정 (필요시, 라이브러리 참고)
    //     scales: {
    //         x: {
    //             type: 'time',
    //             time: {
    //                 unit: 'day'
    //             }
    //         }
    //     }
    }
});
	
}
