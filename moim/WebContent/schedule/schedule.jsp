<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<script src="../javascript/calendar.js"></script>
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

var calendar;


function calendar(options){
		calendar = new tui.Calendar(document.getElementById('calendar'), {
	    defaultView: 'month',
	    taskView: true,    // can be also ['milestone', 'task']
	    scheduleView: true,  // can be also ['allday', 'time']
	    template: {
	        milestone: function(schedule) {
	            return '<span style="color:red;"><i class="fa fa-flag"></i> ' + schedule.title + '</span>';
	        },
	        milestoneTitle: function() {
	            return 'Milestone';
	        },
	        task: function(schedule) {
	            return '&nbsp;&nbsp;#' + schedule.title;
	        },
	        taskTitle: function() {
	            return '<label><input type="checkbox" />Task</label>';
	        },
	        allday: function(schedule) {
	            return schedule.title + ' <i class="fa fa-refresh"></i>';
	        },
	        alldayTitle: function() {
	            return 'All Day';
	        },
	        time: function(schedule) {
	            return schedule.title + ' <i class="fa fa-refresh"></i>' + schedule.start;
	        }
	    },
	    month: {
	        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
	        startDayOfWeek: 0,
	        narrowWeekend: true
	    },
	    week: {
	        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
	        startDayOfWeek: 0,
	        narrowWeekend: true
	    }
	});
	
	calendar.on('clickSchedule', function(event) {
		 var schedule = event.schedule;

		 self.location="/schedule/detailSchedule?groupNo="+schedule.id+"&scheduleNo="+schedule.calendarId;
	});
	
	
	
	$.ajax({
		type:"POST",
		dataType:"json",
		url:"/schedule/json/getScheduleList/0",
		success:function(JSONData,status){
// 			alert("JSONData.length : "+JSONData.length);
// 			alert("JSONData.toString : "+JSON.stringify(JSONData) );
			for(var i=0;i<JSONData.length;i++){
				
				
				calendar.createSchedules([
				    {			 
				        id: String(JSONData[i].groupNo),
				        calendarId: String(JSONData[i].scheduleNo),
				        title: JSONData[i].title,
				        location : 'Incheon',
				        category: 'time',
				        dueDateClass: '',
				        start: JSONData[i].startDay,
				        end: JSONData[i].endDay
				    }
				]);
			}
		}
	})

	
}
$(function(){

	
	calendar();
	
	setRenderRangeText();
	
	$( "button.btn.btn-info:contains('일정추가')" ).on("click" , function() {
		self.location = "/schedule/addScheduleView";
	})
	
	$( "button.btn.btn-info:contains('Weekly')" ).on("click" , function() {
		calendar.setOptions({week: {startDayOfWeek: 1}}, true);
		calendar.changeView('week', true);
	})
	$( "button.btn.btn-info:contains('Daily')" ).on("click" , function() {
		calendar.changeView('day', true);
	})
	$( "button.btn.btn-info:contains('Monthly')" ).on("click" , function() {
		calendar.changeView('month', true);
	})	
	$('#prev').on('click',function(){
		calendar.prev();
		setRenderRangeText()
	})
	$('#next').on('click',function(){
		calendar.next();
		setRenderRangeText()
	})
		$('#toDay').on('click',function(){
		calendar.today();
		setRenderRangeText()
	})
})



function setRenderRangeText() {
    var renderRange = $('#time');
    var options = calendar.getOptions();
    
    var viewName = calendar.getViewName();
    var html = [];
    if (viewName === 'day') {
        html.push(moment(calendar.getDate().getTime()).format('YYYY.MM.DD'));
    } else if (viewName === 'month' &&
        (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
        html.push(moment(calendar.getDate().getTime()).format('YYYY.MM'));
    } else {
        html.push(moment(calendar.getDateRangeStart().getTime()).format('YYYY.MM.DD'));
        html.push(' ~ ');
        html.push(moment(calendar.getDateRangeEnd().getTime()).format(' MM.DD'));
    }
    
    renderRange.val(html);
}

</script>


</head>


<body>
	<span id="menu-navi">
	
	<button type="button" class="btn btn-info">Monthly</button>
	<button type="button" class="btn btn-info">Weekly</button>
	<button type="button" class="btn btn-info">Daily</button>
		<button type="button" id="toDay">ToDay</button>
		<button type="button" id="prev" >
        	<img src="../images/ic-arrow-line-left.png">
	 	</button>
		<button type="button" id="next" >
			<img src="../images/ic-arrow-line-right.png">
        </button>
	</span>
	<input type="text" id="time" name="time" value="">

	<div id="calendar" style="height: 800px;"></div>
	
<button type="button" class="btn btn-info">일정추가</button>
</body>
</html>