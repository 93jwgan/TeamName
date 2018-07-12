package com.moim.mvc.service.group;

import com.moim.mvc.domain.Groups;

public interface GroupDao {
	
	public String checkedGroupName(String GroupName) throws Exception;
	
	public void addGroup(Groups group) throws Exception;
}
