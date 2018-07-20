package com.moim.mvc.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.moim.mvc.common.Search;
import com.moim.mvc.domain.Board;
import com.moim.mvc.service.board.BoardDao;

@Repository("boardDaoImpl")
public class BoardDaoImpl implements BoardDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public BoardDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("BoardMapper.addBoard",board);
	}

	@Override
	public Map<String, Object> getListBoard(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		List<Board> list = sqlSession.selectList("BoardMapper.getListBoard",search);
		int totalCount = sqlSession.selectOne("BoardMapper.getTotalCount",search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public Board getBoard(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BoardMapper.getBoard",boardNo);
	}




}
