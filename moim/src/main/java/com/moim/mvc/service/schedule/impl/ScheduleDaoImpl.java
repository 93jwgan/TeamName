package com.moim.mvc.service.schedule.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.domain.Schedule;
import com.moim.mvc.service.schedule.ScheduleDao;

@Repository("scheduleDaoImpl")
public class ScheduleDaoImpl implements ScheduleDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ScheduleDaoImpl() {
		System.out.println(this.getClass());
	}
	@Override
	public void addSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(this.getClass().getName());
		sqlSession.insert("ScheduleMapper.addSchedule",schedule);
		
	}

	@Override
	public List<Schedule> getScheduleList(String groupNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ScheduleMapper.getScheduleList",groupNo);
	}


}
