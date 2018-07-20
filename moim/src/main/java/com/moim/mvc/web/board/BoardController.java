package com.moim.mvc.web.board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moim.mvc.common.Page;
import com.moim.mvc.common.Search;
import com.moim.mvc.domain.Board;
import com.moim.mvc.domain.User;
import com.moim.mvc.service.board.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public BoardController()
	{
		super();
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="listboardView")
	public String listboardView(@ModelAttribute("search") Search search,Model model) throws Exception {
		System.out.println(this.getClass()+".listboardView()");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println(search);
		Map<String,Object> map = boardService.getListBoard(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		
		return "forward:/board/listboard.jsp";
	}
	
	@RequestMapping(value="addBoardView")
	public String addBoardView() {
		System.out.println(this.getClass()+".addBoardView()");
		
		return "forward:/board/addBoard.jsp";
	}

	@RequestMapping(value="addBoard")
	public String addBoard(@ModelAttribute Board board,HttpSession session,Model model) throws Exception {
		System.out.println(this.getClass()+".addBoard()");
		
		board.setUserId(((User)session.getAttribute("user")).getUserId());
		
		long time = System.currentTimeMillis(); 

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		String str = dayTime.format(new Date(time));

		System.out.println("str : "+str);
		board.setRegDate(str);
		
		boardService.addBoard(board);
		
		
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		Map<String,Object> map = boardService.getListBoard(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return "forward:/board/listboard.jsp";
	}
	
	@RequestMapping(value="getBoard")
	public String getBoard(@RequestParam("boardNo") String boardNo,Model model) throws Exception{
		
		
		
		model.addAttribute("board",boardService.getBoard(Integer.parseInt(boardNo)));
		
		return "forward:/board/detailBoard.jsp";
	}
}