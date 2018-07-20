package com.moim.mvc.service.board.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moim.mvc.common.Search;
import com.moim.mvc.domain.Board;
import com.moim.mvc.service.board.BoardDao;
import com.moim.mvc.service.board.BoardService;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{

	
	@Autowired
	@Qualifier("boardDaoImpl")
	private BoardDao boardDao;
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public BoardServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		boardDao.addBoard(board);		
	}

	@Override
	public Map<String, Object> getListBoard(Search search) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.getListBoard(search);
	}

	@Override
	public Board getBoard(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.getBoard(boardNo);
	}




}
