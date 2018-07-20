package com.moim.mvc.service.user;

import java.util.Map;

import com.moim.mvc.common.Search;
import com.moim.mvc.domain.User;

public interface UserService {

	//회원가입
	public void addUser(User user) throws Exception;

	public void updateUser(User user) throws Exception;
	
	//ID중복체크
	public String checkId(String userId) throws Exception ;
	
	public User getUser(String userId) throws Exception ;

	public String getId(String name, String phone) throws Exception ;
	
	public String getPassword(String userId, String name, String phone) throws Exception;
	
	public void onOff(String userId) throws Exception;

	public Map<String, Object> getUserList(Search search) throws Exception ;

	//public User getUserList() throws Exception;
	
	
}
