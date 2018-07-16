package com.moim.mvc.web.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat/*")
public class ChattingController 
{
	
	@RequestMapping(value="joinChat" , method=RequestMethod.GET)
	public String joinChat() throws Exception 
	{
		
		return "forward:/chat/client.jsp";
		
	}
	
	@RequestMapping(value="joinGroupChat" , method=RequestMethod.GET)
	public String joinGroupChat() throws Exception 
	{
		
		return "forward:/chat/groupChat.jsp";
		
	}
	
	@RequestMapping(value="testChat" , method=RequestMethod.GET)
	public String testChat() throws Exception 
	{
		System.out.println("chat Cont");
		
		return "forward:/chat/testView.jsp";
		
	}

}