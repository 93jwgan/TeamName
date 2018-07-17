package com.moim.mvc.service.user.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.domain.User;
import com.moim.mvc.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public UserDaoImpl() {
		
	}
	
	public String checkId(String userId) throws Exception {
		
		String check=sqlSession.selectOne("UserMapper.checkId", userId);
		return check;	
	}

	
	public void addUser(User user) throws Exception {
		
		System.out.println(":::::DaoImpl");
		sqlSession.insert("UserMapper.addUser", user);
	}
	
	
	public User getUser(String userId) throws Exception {
		
		System.out.println(":::::DaoImpl :::: getUser");
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	public String getId(String name, String phone) throws Exception {
		
	Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("phone", phone);
	
		String a = sqlSession.selectOne("UserMapper.getId", map);
		
		
		return sqlSession.selectOne("UserMapper.getId", map);
	}
	
	public String getPassword(String name, String phone, String userId) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("phone", phone);
		map.put("userId", userId);
		
	 System.out.println(map.get("name"));
	 System.out.println(map.get("phone"));
	 System.out.println(map.get("userId"));
	 String a = sqlSession.selectOne("UserMapper.getPassword", map);
	 System.out.println(a);
	 
		return sqlSession.selectOne("UserMapper.getPassword", map);
	}
	/*
	public User getUserList() throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(key, value);
		map.put(key, value);
		map.put(key, value);
		
		return user;
		
		
		
	}
	
	
//mapper로 갈때 map으로 넣어줘야함
	
	*/
	
}
