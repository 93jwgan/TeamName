package com.moim.mvc.service.user;

import java.util.List;

import com.moim.mvc.common.Search;
import com.moim.mvc.domain.User;

public interface UserDao {
	
	public String checkId(String userId) throws Exception ;
	
	public void addUser(User user) throws Exception ;

	public void updateUser(User user) throws Exception;
	
	// 내정보확인 / 로그인
	public User getUser(String userId) throws Exception;
	
	public String getId(String name, String phone) throws Exception;
	
	public String getPassword(String userId, String name, String phone) throws Exception;
	
	public void onOff(String userId) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception ;
	public int getTotalCount(Search search) throws Exception ;
	
//	public User getUserList() throws Exception;
	
}
