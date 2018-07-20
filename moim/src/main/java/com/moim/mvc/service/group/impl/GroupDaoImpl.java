package com.moim.mvc.service.group.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.common.Search;
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
	
	public HashMap<String, Object> getListGroup(Search search) throws Exception{
		
		List<Groups> list= sqlSession.selectList("GroupMapper.getListGroup",search);
		int totalCount = sqlSession.selectOne("GroupMapper.getTotalCount",search);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public int deleteGroupAdmin(String groupName) throws Exception{
		return sqlSession.delete("GroupMapper.deleteGroupAdmin", groupName);
	}
	
	public Groups getGroup(String groupNo) throws Exception{
		return sqlSession.selectOne("GroupMapper.getGroup",groupNo);
	}
	
	public int updateGroup(Groups group) throws Exception{
		return sqlSession.update("GroupMapper.updateGroup", group);
	}
	
	public Groups getGroupMember(String groupName) throws Exception{
		return sqlSession.selectOne("GroupMapper.getGroupMember", groupName);
	}
}
