package com.moim.mvc.service.user;

import com.moim.mvc.domain.User;

public interface UserService {

	//ȸ������
	public void addUser(User user) throws Exception;
	
	//ID�ߺ�üũ
	public String checkId(String userId) throws Exception ;
	
	public User getUser(String userId) throws Exception ;

	public String getId(String name, String phone) throws Exception ;
	
	public String getPassword(String userId, String name, String phone) throws Exception;

	//public User getUserList() throws Exception;
	
	
}
