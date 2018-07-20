package com.moim.mvc.web.group;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moim.mvc.common.Page;
import com.moim.mvc.common.Search;
import com.moim.mvc.service.group.GroupService;

@RestController
@RequestMapping("/group/*")
public class GroupRestController {
	
	@Autowired
    @Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
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
	
	
	@RequestMapping( value="json/listGroup", method=RequestMethod.GET )
	public HashMap<String, Object> listGroup(@RequestParam("currentPage") String currentPage, @RequestParam("pageSize") String reqpageSize) throws Exception{
		
		Search search = new Search();
		
		search.setCurrentPage(Integer.valueOf(currentPage));
		
		search.setPageSize(Integer.valueOf(reqpageSize));
		
		HashMap<String,Object> map = groupService.getListGroup(search);	

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
		
	}
	
}