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
	
	@RequestMapping( value="json/hashTagParsing", method=RequestMethod.POST )
	public String hashTagParsing(@RequestParam("hashTag") String hashTag)throws Exception{
		
		/*String[] checkHash = hashTag.split(" ");
		System.out.println("???");
		String completeTag = "";
		for(int i=0;i<=checkHash.length;i++) {
			if(checkHash[i].charAt(0)=='#') {
				completeTag = completeTag + checkHash[i]; 
				
				System.out.println(checkHash[i]);
				
				return checkHash[i];
			}
		}*/
		
		return "1";
		
	}
	
}