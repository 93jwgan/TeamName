package com.moim.mvc.service.schedule;

import java.util.List;

import com.moim.mvc.domain.Schedule;

public interface ScheduleDao {
	

	public void addSchedule(Schedule schedule) throws Exception;
	
	public List<Schedule> getScheduleList(Schedule schedule) throws Exception;
}
