package com.moim.mvc.web.rest.schedule;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moim.mvc.domain.Schedule;
import com.moim.mvc.service.schedule.ScheduleService;

@RestController
@RequestMapping("/schedule/*")
public class ScheduleRestController {

	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;
	
	
	public ScheduleRestController() {
		super();
		System.out.println(this.getClass());
	}

	@RequestMapping(value="/json/getScheduleList/{groupNo}")
	public List<Schedule> getScheduleList(@PathVariable String groupNo) throws Exception {
		System.out.println(this.getClass()+".getSchedulList()");
		System.out.println("groupNo = "+groupNo);
		
		Schedule schedule = new Schedule();
		schedule.setGroupNo(Integer.parseInt(groupNo));
		
		return scheduleService.getScheduleList(schedule);
	}
	
}