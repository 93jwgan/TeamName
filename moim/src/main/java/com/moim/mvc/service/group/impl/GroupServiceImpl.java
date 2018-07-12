package com.moim.mvc.service.group.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moim.mvc.domain.Groups;
import com.moim.mvc.service.group.GroupDao;
import com.moim.mvc.service.group.GroupService;

@Service("groupServiceImpl")
public class GroupServiceImpl implements GroupService{

	@Autowired
	@Qualifier("groupDaoImpl")
	
	private GroupDao groupDao;
	
	public GroupServiceImpl() {	}
	
	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}
	
	public String checkedGroupName(String GroupName) throws Exception{
		return groupDao.checkedGroupName(GroupName);
	}
	
	public void addGroup(Groups group) throws Exception{
		groupDao.addGroup(group);
	}
}
