package com.moim.mvc.service.member.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.domain.Member;
import com.moim.mvc.service.member.MemberDao;

@Repository("memberDaoImpl")
public class MemberDaoImpl implements MemberDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void addMaster(HashMap<String, Object> map) {
		sqlSession.insert("MemberMapper.addMaster", map);
	}
	
	public Member getMember(String userId, String groupNo) {
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("userId", userId);
		map.put("groupNo", groupNo);
		
		return sqlSession.selectOne("MemberMapper.getMember", map);
	}
	
	public String checkedGroupName(String nickName) {
		return sqlSession.selectOne("MemberMapper.checkedNickName", nickName);
	}
	
	public void addMember(Member member) {
		sqlSession.insert("MemberMapper.addMember", member);
	}
	
	public void deleteMember(Member member) {
		sqlSession.delete("MemberMapper.deleteMember", member);
	}
}
