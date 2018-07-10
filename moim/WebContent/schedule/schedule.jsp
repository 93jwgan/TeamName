<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">


function calendar(options){
	var calendar = new tui.Calendar(document.getElementById('calendar'), {
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
			
			alert("aaaaaaaaaa");

		});
	
	$.ajax({
		type:"POST",
		dataType:"json",
		url:"/schedule/json/getScheduleList/0",
		success:function(JSONData,status){
			
			for(var i=0;i<JSONData.length;i++){
				calendar.createSchedules([
				    {			 
				        id: JSONData[i].gtoupNo,
				        calendarId: i,
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
	
	$( "button.btn.btn-info:contains('일정추가')" ).on("click" , function() {
		self.location = "/schedule/addScheduleView";
	})

	
	
})


</script>


</head>


<body>
	<button type="button" class="btn btn-info">Monthly</button>
	<button type="button" class="btn btn-info">Weekly</button>
	<button type="button" class="btn btn-info">Daily</button>

	<div id="calendar" style="height: 800px;"></div>
	
<button type="button" class="btn btn-info">일정추가</button>
</body>
</html>