package com.moim.mvc.service.member.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moim.mvc.domain.Member;
import com.moim.mvc.service.member.MemberDao;
import com.moim.mvc.service.member.MemberService;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{

	@Autowired
	@Qualifier("memberDaoImpl")
	
	private MemberDao memberDao;
	
	public MemberServiceImpl() {	}
	
	public void setmemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void addMaster(HashMap<String, Object> map) {
		memberDao.addMaster(map);
	}
	
	public Member getMember(String userId, String groupNo) {
		
		return memberDao.getMember(userId, groupNo);
	}
	
	public String checkedGroupName(String nickName) {
		return memberDao.checkedGroupName(nickName);
	}
	
	public void addMember(Member member) {
		memberDao.addMember(member);
	}
	
	public void deleteMember(Member member) {
		memberDao.deleteMember(member);
	}
}
