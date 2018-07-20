package com.moim.mvc.service.group;

import java.util.HashMap;
import java.util.Map;

import com.moim.mvc.common.Search;
import com.moim.mvc.domain.Groups;

public interface GroupDao {
	
	public String checkedGroupName(String GroupName) throws Exception;
	
	public void addGroup(Groups group) throws Exception;
	
	public int deleteGroupAdmin(String groupName) throws Exception;
	
	public Groups getGroup(String groupNo) throws Exception;
	
	public Groups getGroupMember(String groupName) throws Exception;
	
	public int updateGroup(Groups group) throws Exception;
	
	public HashMap<String, Object> getListGroup(Search search) throws Exception;
	
}
