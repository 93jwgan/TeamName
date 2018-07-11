package com.moim.mvc.service.schedule.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moim.mvc.domain.Schedule;
import com.moim.mvc.service.schedule.ScheduleDao;
import com.moim.mvc.service.schedule.ScheduleService;

@Service("scheduleServiceImpl")
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	@Qualifier("scheduleDaoImpl")
	private ScheduleDao scheduleDao;
	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}

	public ScheduleServiceImpl() {
		System.out.println(this.getClass());
	}
	@Override
	public void addSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass().getName());
		scheduleDao.addSchedule(schedule);
	}

	@Override
	public List<Schedule> getScheduleList(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		return scheduleDao.getScheduleList(schedule);
	}


}
