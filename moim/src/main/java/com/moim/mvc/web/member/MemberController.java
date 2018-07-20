package com.moim.mvc.web.member;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moim.mvc.domain.Groups;
import com.moim.mvc.domain.Member;
import com.moim.mvc.domain.User;
import com.moim.mvc.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@RequestMapping(value="addMemberView", method=RequestMethod.GET)
	public String addMemberView(Model model,HttpServletRequest request) throws Exception{
		model.addAttribute("groupNo",request.getParameter("groupNo"));
		return "/member/addMemberView.jsp";
	}
	
	@RequestMapping(value="addMember", method=RequestMethod.POST)
	public String addMember(@ModelAttribute Member member, @RequestParam("groupNo") String groupNo, HttpServletRequest request, HttpSession session) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		member.setGroupNo(Integer.valueOf(groupNo));
		member.setUserId(user.getUserId());
		
		memberService.addMember(member);
		
		return "/group/getGroup";
	}
	
	@RequestMapping(value="deleteMember", method=RequestMethod.GET)
	public String deleteMember(Model model,@RequestParam("groupNo") String groupNo, HttpSession session) throws Exception{
		
		Member member = new Member();
		User user = (User)session.getAttribute("user");
		
		member.setUserId(user.getUserId());
		member.setGroupNo(Integer.valueOf(groupNo));
		
		System.out.println(member);
		
		memberService.deleteMember(member);
		
		return "/group/getGroup";
	}
	
	@RequestMapping(value="acceptListMember", method=RequestMethod.GET)
	public String acceptListMember() throws Exception{
		return "/member/acceptListMember.jsp";
	}
	
	
	
	
}