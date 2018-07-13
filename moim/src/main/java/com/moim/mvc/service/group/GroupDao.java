package com.moim.mvc.service.group;

import java.util.Map;

import com.moim.mvc.common.Search;
import com.moim.mvc.domain.Groups;

public interface GroupDao {
	
	public String checkedGroupName(String GroupName) throws Exception;
	
	public void addGroup(Groups group) throws Exception;
	
	public Map<String, Object> getListGroupAdmin(Search search) throws Exception;
}
