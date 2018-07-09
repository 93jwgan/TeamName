package com.moim.mvc.service.group.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moim.mvc.service.group.GroupDao;
import com.moim.mvc.service.group.GroupService;

@Service("groupServiceImpl")
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	@Qualifier("groupDaoImpl")
	private GroupDao dao;

	public GroupServiceImpl() {	}
	
}
