package com.moim.mvc.service.user.impl;

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
	
	
}
