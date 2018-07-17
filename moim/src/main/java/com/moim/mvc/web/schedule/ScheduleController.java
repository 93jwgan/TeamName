package com.moim.mvc.web.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moim.mvc.domain.Schedule;
import com.moim.mvc.domain.User;
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
		System.out.println("addScheduleView Navigation");
		return "forward:/schedule/addschedule.jsp";
	}
	
	@RequestMapping(value="addSchedule")
	public String addSchedule(@ModelAttribute("schedule")Schedule schedule) throws Exception {
		System.out.println(this.getClass()+".addSchedule()");
		
		System.out.println(schedule);
		
		scheduleService.addSchedule(schedule);
		
		return "redirect:/schedule/schedule.jsp";
	}
	
	@RequestMapping(value="detailSchedule")
	public String detailSchedule(@ModelAttribute("schedule")Schedule schedule,
								 @ModelAttribute("users")User user,Model model) throws Exception{
		System.out.println("detailScheduleView Navigation");
		
		System.out.println(schedule);
		
		List<Schedule> list =scheduleService.getScheduleList(schedule);
		
		
//		StringBuffer response = scheduleService.direction(list.get(0), user);
	
//		model.addAttribute("direction",response);
		model.addAttribute("list",list);
		model.addAttribute("users",user);
		
		return "forward:/schedule/detailSchedule.jsp";


//		
//		return "forward:/schedule/googledirection.jsp";
	}
	
	@RequestMapping(value="updateSchedule")
	public String updateSchedule(@ModelAttribute("schedule")Schedule schedule) throws Exception{
		System.out.println(this.getClass()+".updateSchedule()");
		
		System.out.println(schedule);
		
		scheduleService.updateSchedule(schedule);
		
		return "redirect:/schedule/schedule.jsp";
	}
	
	@RequestMapping(value="deleteSchedule/{scheduleNo}")
	public String deleteSchedule(@PathVariable String scheduleNo) throws Exception{
		System.out.println(this.getClass()+".deleteSchedule()");
		
		scheduleService.deleteSchedule(Integer.parseInt(scheduleNo));
		
		return "redirect:/schedule/schedule.jsp";
	}
	
}