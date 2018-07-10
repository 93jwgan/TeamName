package com.moim.mvc.web.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moim.mvc.domain.Schedule;
import com.moim.mvc.service.schedule.ScheduleService;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;
	
	
	public ScheduleController() {
		super();
		System.out.println(this.getClass());
	}


	@RequestMapping(value="addScheduleView")
	public String addScheduleView() {	
		System.out.println("Navigation");
		return "forward:/schedule/addschedule.jsp";
	}
	
	@RequestMapping(value="addSchedule")
	public String addSchedule(@ModelAttribute("schedule")Schedule schedule) throws Exception {
		System.out.println(this.getClass()+".addSchedule()");
		
		System.out.println(schedule);
		
		scheduleService.addSchedule(schedule);
		
		return "forward:/schedule/schedule.jsp";
	}
	
}