package com.moim.mvc.web.chatting;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moim.mvc.domain.Groups;
import com.moim.mvc.domain.User;
import com.moim.mvc.service.group.GroupService;
import com.moim.mvc.service.user.UserService;

@Controller
@RequestMapping("/chat/*")
public class ChattingController 
{
	
	@Autowired 
    @Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@RequestMapping(value="joinChat" , method=RequestMethod.GET)
	public String joinChat() throws Exception 
	{
		
		return "forward:/chat/client.jsp";
		
	}
	
	@RequestMapping(value="joinGroupChat" , method=RequestMethod.GET)
	public String joinGroupChat(Model model,HttpSession session,@RequestParam("groupNo") String groupNo) throws Exception 
	{
		
//		User user = new User();
//		
//		user.setProfileImg("aaaaaa");
//		user.setUserId("user01");
//		user.setName("³ªÀÓ");

		Groups group = groupService.getGroup(groupNo);

		User user = (User)session.getAttribute("user");
		
		model.addAttribute("user", user);
		model.addAttribute("group", group);
		
		return "forward:/chat/groupChat.jsp";
		
	}
	
	@RequestMapping(value="testChat" , method=RequestMethod.GET)
	public String testChat() throws Exception 
	{
		System.out.println("chat Cont");
		
		return "forward:/chat/testView.jsp";
		
	}
	
}