package com.moim.mvc.service.schedule.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.domain.Schedule;
import com.moim.mvc.domain.User;
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
	public List<Schedule> getScheduleList(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ScheduleMapper.getScheduleList",schedule);
	}

	@Override
	public StringBuffer direction(Schedule schedule, User user) throws Exception {
		// TODO Auto-generated method stub

      String daumOpenAPIURL = "https://maps.googleapis.com/maps/api/directions/json?origin="+user.getMyLat()+","+user.getMyLng()+"&destination="+schedule.getLat()+","+schedule.getLng()+"&language=en&mode=transit&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY";
      // java API 를 이용 HttpRequest
      URL url = new URL(daumOpenAPIURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      
      
      // Response Code GET
      int responseCode = con.getResponseCode();
      
      BufferedReader br = null;
      
      if(responseCode==200) { 
          br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
          br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      
      //JSON Data 읽기
      String jsonData = "";
      StringBuffer response = new StringBuffer();
      
      while ((jsonData = br.readLine()) != null) {
//      	System.out.println(jsonData);
          response.append(jsonData);
      }
      
      br.close();
		
		return response;
	}


}
