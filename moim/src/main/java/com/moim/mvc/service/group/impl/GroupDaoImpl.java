package com.moim.mvc.service.group.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.domain.Groups;
import com.moim.mvc.service.group.GroupDao;

@Repository("groupDaoImpl")
public class GroupDaoImpl implements GroupDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public String checkedGroupName(String groupName) throws Exception{
		return sqlSession.selectOne("GroupMapper.checkedGroupName", groupName);
	}
	
	public void addGroup(Groups groups) throws Exception{
		sqlSession.insert("GroupMapper.addGroups", groups);
	}
}
