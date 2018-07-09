package com.moim.mvc.service.user;

import com.moim.mvc.domain.User;

public interface UserService {

	//회원가입
	public void addUser(User user) throws Exception;
	
	//ID중복체크
	public String checkId(String userId) throws Exception ;
	
}