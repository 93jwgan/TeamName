package com.moim.mvc.web.group;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moim.mvc.service.group.GroupService;

@RestController
@RequestMapping("/group/*")
public class GroupRestController {
	
	@Autowired
    @Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	public GroupRestController() {}
	
	@RequestMapping( value="json/checkedGroupName", method=RequestMethod.POST )
	public String checkGroupName(@RequestParam("groupName") String groupName)throws Exception{
		String result = groupService.checkedGroupName(groupName);
		if(result == null)
			return "1";
		else 
			return "2";
	}
	
	@RequestMapping( value="json/deleteGroupAdmin", method=RequestMethod.POST )
	public String deleteGroupAdmin(@RequestParam("groupNo") String groupNo)throws Exception{;

		return Integer.toString(groupService.deleteGroupAdmin(groupNo));
		
	}
	
}