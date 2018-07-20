package com.moim.mvc.web.board;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {
	
	
	public BoardRestController()
	{
		super();
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="/json/imgUpLoad")
	public String imgUpLoad(MultipartHttpServletRequest request) throws Exception{
		

		
		Iterator<String> itr = request.getFileNames();
		
		MultipartFile main = request.getFile(itr.next());
		
		String today = new java.text.SimpleDateFormat("yyMMddHHmmss").format(new java.util.Date());
		
		String path = request.getSession().getServletContext().getRealPath("/")+"images\\board\\";
		
		System.out.println("path : "+path);
		
		int pos = main.getOriginalFilename().lastIndexOf( "." );
		String ext = main.getOriginalFilename().substring( pos + 1 );
		
		String mainFileName = today + (int)(Math.random()*10000) + "." + ext;
		
		
		if(main.getOriginalFilename()!="") {
			File f= new File(path + mainFileName);
			main.transferTo(f);
		}
		
		
		String upload = mainFileName;
		return upload;
	}

	@RequestMapping(value="/json/mediaUpLoad")
	public String mediaUpLoad(MultipartHttpServletRequest request) throws Exception{
		
		Iterator<String> itr = request.getFileNames();
		
		MultipartFile main = request.getFile(itr.next());
		
		String today = new java.text.SimpleDateFormat("yyMMddHHmmss").format(new java.util.Date());
		System.out.println("today : "+today);
		String path = request.getSession().getServletContext().getRealPath("/")+"media\\";
		System.out.println("path : "+path);
				
		int pos = main.getOriginalFilename().lastIndexOf( "." );
		String ext = main.getOriginalFilename().substring( pos + 1 );
		
		String mainFileName = today + (int)(Math.random()*10000) + "." + ext;
		System.out.println("mainFileName : "+mainFileName);
		
		if(main.getOriginalFilename()!="") {
			File f= new File(path + mainFileName);
			main.transferTo(f);
		}
		
		
		String upload = mainFileName;
		return upload;
	}

}