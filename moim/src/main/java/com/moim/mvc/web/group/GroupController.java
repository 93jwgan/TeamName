package com.moim.mvc.web.group;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moim.mvc.common.Page;
import com.moim.mvc.common.Search;
import com.moim.mvc.domain.Groups;
import com.moim.mvc.domain.User;
import com.moim.mvc.service.group.GroupService;

@Controller
@RequestMapping("/group/*")
public class GroupController {
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addGroupView", method=RequestMethod.GET)
	public String addGroupView() throws Exception{

		return "/group/addGroupView.jsp";
	}
	
	@RequestMapping(value="addGroup", method=RequestMethod.POST)
	public String addGroup(@ModelAttribute Groups groups, @RequestParam("mainImgFile") MultipartFile main, HttpServletRequest request, HttpSession session) throws Exception{
		
		User user = (User)session.getAttribute("user");
		String groupMaster = user.getUserId();
		
		String today = new java.text.SimpleDateFormat("yyMMddHHmmss").format(new java.util.Date());
		String path = request.getSession().getServletContext().getRealPath("/")+"images\\group\\";		
		
		int pos = main.getOriginalFilename().lastIndexOf( "." );
		String ext = main.getOriginalFilename().substring( pos + 1 );
		
		String mainFileName = today + (int)(Math.random()*10000) + "." + ext;
	
		if(main.getOriginalFilename()!="") {
			File f= new File(path + mainFileName);
			main.transferTo(f);
		}
		
		groups.setGroupMaster(groupMaster);
		groups.setMainImg(mainFileName);				 
		
		groupService.addGroup(groups);
		
		return "/index.jsp";
	}
	
	
	@RequestMapping(value="listGroupAdmin")
	public String getGroupAdmin(Model model, @ModelAttribute("search") Search search) throws Exception{

		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = groupService.getListGroupAdmin(search);	

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "/group/listGroupAdmin.jsp";
		
	}
	
	@RequestMapping(value="updateGroupAdmin")
	public String updateGroupAdmin(@RequestParam("groupNo") String groupNo, Model model) throws Exception{
		
		Groups group = groupService.getGroup(groupNo);
		model.addAttribute("group", group);
		
		return "/group/updateGroupAdmin.jsp";
	}

	
	@RequestMapping(value="getGroup")
	public String getGroupAdmin(@RequestParam("groupNo") String groupNo, Model model) throws Exception{

		Groups group = groupService.getGroup(groupNo);
		model.addAttribute("group", group);
		
		return "/group/GroupIndex.jsp";
	}
	
	@RequestMapping(value="updateGroup")
	public String updateGroup(@ModelAttribute("group") Groups groups, @RequestParam("mainImgFile") MultipartFile main, HttpServletRequest request) throws Exception{
		
		System.out.println(groups);
		
		String today = new java.text.SimpleDateFormat("yyMMddHHmmss").format(new java.util.Date());
		String path = request.getSession().getServletContext().getRealPath("/")+"images\\group\\";		
		
		int pos = main.getOriginalFilename().lastIndexOf( "." );
		String ext = main.getOriginalFilename().substring( pos + 1 );
		
		String mainFileName = today + (int)(Math.random()*10000) + "." + ext;
	
		if(main.getOriginalFilename()!="") {
			File f= new File(path + mainFileName);
			main.transferTo(f);
		}
		
		groups.setMainImg(mainFileName);					
		
		System.out.println(groups);
		
		groupService.updateGroup(groups);
		
		return "/group/listGroupAdmin.jsp";
	}
	
}