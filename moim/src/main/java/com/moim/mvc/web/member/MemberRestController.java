package com.moim.mvc.web.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moim.mvc.service.member.MemberService;

@RestController
@RequestMapping("/member/*")
public class MemberRestController {
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@RequestMapping(value="json/checkedMemberName", method=RequestMethod.POST)
	public String checkNickName(@RequestParam("nickName") String nickName) throws Exception{
		String result = memberService.checkedGroupName(nickName);
		if(result == null)
			return "1";
		else 
			return "2";
	}
}