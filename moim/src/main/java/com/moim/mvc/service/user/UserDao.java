package com.moim.mvc.service.user;

import com.moim.mvc.domain.User;

public interface UserDao {
	
	public String checkId(String userId) throws Exception ;
	

	public void addUser(User user) throws Exception ;

	// ������Ȯ�� / �α���
	public User getUser(String userId) throws Exception;
	
	
	
}
