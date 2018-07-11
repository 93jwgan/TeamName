package com.moim.mvc.service.user;

import com.moim.mvc.domain.User;

public interface UserDao {
	
	public String checkId(String userId) throws Exception ;
	

	public void addUser(User user) throws Exception ;

	// 내정보확인 / 로그인
	public User getUser(String userId) throws Exception;
	
	
	
}
