package com.moim.mvc.service.member;

import java.util.HashMap;

import com.moim.mvc.domain.Member;

public interface MemberDao {
	
	public void addMaster(HashMap<String, Object> map);
	
	public Member getMember(String userId, String groupNo);
	
	public String checkedGroupName(String nickName);
	
	public void addMember(Member member);
	
	public void deleteMember(Member member);
}
