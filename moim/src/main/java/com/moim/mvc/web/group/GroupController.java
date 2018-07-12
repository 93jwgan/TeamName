package com.moim.mvc.web.group;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moim.mvc.domain.Groups;
import com.moim.mvc.service.group.GroupService;

@Controller
@RequestMapping("/group/*")
public class GroupController {
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@RequestMapping(value="addGroupView", method=RequestMethod.GET)
	public String addGroupView() throws Exception{
		return "/group/addGroupView.jsp";
	}
	
	@RequestMapping(value="addGroup", method=RequestMethod.POST)
	public String addGroup(@ModelAttribute Groups groups, @RequestParam("mainImgFile") MultipartFile main, HttpServletRequest request) throws Exception{
		
		String today = new java.text.SimpleDateFormat("yyMMddHHmmss").format(new java.util.Date());
		String path = request.getSession().getServletContext().getRealPath("/")+"images\\group\\";
		
		String mainFileName = today + (int)(Math.random()*10000);
	
		if(main.getOriginalFilename()!="") {
			File f= new File(path + mainFileName);
			main.transferTo(f);
		}
							 
		groups.setMainImg(mainFileName);				 
		
		groupService.addGroup(groups);
		
		return "/index.jsp";
	}
	
}