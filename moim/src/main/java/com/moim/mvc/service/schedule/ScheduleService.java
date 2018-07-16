package com.moim.mvc.service.schedule;

import java.util.List;

import com.moim.mvc.domain.Schedule;
import com.moim.mvc.domain.User;

public interface ScheduleService {

	
	public void addSchedule(Schedule schedule) throws Exception;
	
	public List<Schedule> getScheduleList(Schedule schedule) throws Exception;
	
	public StringBuffer direction(Schedule schedule,User user) throws Exception;
	
}