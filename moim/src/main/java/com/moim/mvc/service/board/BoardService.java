package com.moim.mvc.service.board;

import java.util.Map;

import com.moim.mvc.common.Search;
import com.moim.mvc.domain.Board;

public interface BoardService {

	public void addBoard(Board board) throws Exception;
	
	public Map<String, Object> getListBoard(Search search) throws Exception;
	
	public Board getBoard(int boardNo) throws Exception;
}