package com.moim.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.common.Search;
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

	
	public void onOff(String userId) throws Exception{
		
		sqlSession.update("UserMapper.onOff", userId);
	}
	
	public void addUser(User user) throws Exception {
		
		System.out.println(":::::DaoImpl");
		sqlSession.insert("UserMapper.addUser", user);
	}
	
	
	public User getUser(String userId) throws Exception {
		
		System.out.println(":::::DaoImpl :::: getUser                                                            "+userId);
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
	
	public void updateUser(User user) throws Exception{
		
		System.out.println(":::updqteUser dao imp "+user);
		sqlSession.update("UserMapper.updateUser", user);
		
	}

	
	public  List<User> getUserList(Search search) throws Exception{
		
		return sqlSession.selectList("UserMapper.getUserList", search);
	}

	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
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
