package com.moim.mvc.web.group;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moim.mvc.service.group.GroupService;


@Controller
@RequestMapping("/group/*")
public class GroupController {
	
	public GroupController() {
		
	}
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}
	
}