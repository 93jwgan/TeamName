package com.moim.mvc.service.user;

import com.moim.mvc.domain.User;

public interface UserService {

	//ȸ������
	public void addUser(User user) throws Exception;
	
	//ID�ߺ�üũ
	public String checkId(String userId) throws Exception ;
	
}
