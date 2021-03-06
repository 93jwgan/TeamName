package com.moim.mvc.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moim.mvc.domain.User;
import com.moim.mvc.service.user.UserDao;
import com.moim.mvc.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	//Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		
	}
	
	public String checkId(String userId) throws Exception {
		return userDao.checkId(userId);
	}
	

	public User getUser(String userId) throws Exception {
		
		System.out.println(":::::serviceImpl :::: getUser");
		return userDao.getUser(userId);
	}
	
	public String getId(String name, String phone) throws Exception {
		
		System.out.println(":::::serviceImpl :::: getId");
		return userDao.getId(name, phone);
	}
	public String getPassword(String userId, String name, String phone) throws Exception {
		
		System.out.println(":::::serviceImpl :::: getId");
		return userDao.getPassword(userId, name, phone);
	}

	
	public void addUser(User user) throws Exception {
		System.out.println("::::::::ServiceImpl");
		userDao.addUser(user);
	}
	
	
	/*
	public User getUserList() throws Exception{
		
		userDao.getUserList();
	}
	*/
	
}