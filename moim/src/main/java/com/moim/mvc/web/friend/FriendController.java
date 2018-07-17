package com.moim.mvc.web.friend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moim.mvc.service.friend.FriendService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {

//	@Autowired 
//    @Qualifier("friendServiceImpl")	
//	private FriendService friendService;
	
	@RequestMapping( value="listFriend", method=RequestMethod.GET )
	public String listFriend() throws Exception{
		
		System.out.println("123");
		return "redirect:/friend/listFriend.jsp";
	}
	
}