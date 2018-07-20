package com.moim.mvc.web.user;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moim.mvc.common.Page;
import com.moim.mvc.common.Search;
import com.moim.mvc.domain.User;
import com.moim.mvc.service.user.UserService;

//컨트롤러 시작
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	//필드
	@Autowired 
    @Qualifier("userServiceImpl")
	private UserService userService;
	
//	@Value("#{commonProperties['interest]}")
//	String interest;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="addUserView", method=RequestMethod.GET )
	public String addUserView() throws Exception{
		
		return "redirect:/user/addUser.jsp";
	}
	
	
	/*@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser(@ModelAttribute("user") User user,  @RequestParam("profileImg") MultipartFile profileImg, HttpServletRequest request) throws Exception {
		
		String today = new java.text.SimpleDateFormat("yyMMddHHmmss").format(new java.util.Date());
		String path = request.getSession().getServletContext().getRealPath("/")+"images\\user\\";
		
		String profileImgName = today + (int)(Math.random()*10000);
	
		if(profileImg.getOriginalFilename()!="") {
			File f= new File(path + profileImgName);
			profileImg.transferTo(f);
		}
	
		System.out.println(today);
		System.out.println(path);
		System.out.println(profileImg);
		return "/index.jsp";
		
		
		

		//userService.addUser(user);
	 
		
	}*/
	

	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser(@ModelAttribute("user") User user, HttpServletRequest request) throws Exception {
	
		userService.addUser(user);
		return "/index.jsp";
		
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser(@ModelAttribute("user") User user,  @RequestParam("profileImgName") MultipartFile profileImg, HttpServletRequest request,  HttpSession session) throws Exception {
		System.out.println("::::::::::::" + user);
		System.out.println(profileImg);
		String today = new java.text.SimpleDateFormat("yyMMddHHmmss").format(new java.util.Date());
		String path = request.getSession().getServletContext().getRealPath("/")+"images\\user\\";		
	
		int pos = profileImg.getOriginalFilename().lastIndexOf( "." );
		String ext = profileImg.getOriginalFilename().substring( pos + 1 );
		
		String profileFileName = today + (int)(Math.random()*10000) + "." + ext;
	
		if(profileImg.getOriginalFilename()!="") {
			File f= new File(path + profileFileName);
			profileImg.transferTo(f);
		}
		System.out.println(profileImg+"profile");
		System.out.println("profileFileName"+profileFileName);

		if (ext == null) {
			user.setProfileImg("profileDefault.png");
		}
		
		else {
		user.setProfileImg(profileFileName);
		}
		System.out.println(user);
		userService.updateUser(user);
		session.setAttribute("user", user);
		
		return "forward:/index.jsp";
		
	}
/*	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser(@ModelAttribute("user") User user, @RequestParam("file") MultipartFile profileImg, HttpServletRequest request) throws Exception {
		
		
		System.out.println(user);
		System.out.println("오리지널 파일이름"+profileImg.getOriginalFilename());
		System.out.println("addUser컨트롤러들어옴");
		
		String path = request.getSession().getServletContext().getRealPath("/")+"images\\user\\";
		
		if(profileImg.getOriginalFilename()!="") {
			File f= new File(path + profileImg.getOriginalFilename());
			profileImg.transferTo(f);
		}
		
		userService.addUser(user);
		return "/index.jsp";
		
		
	}
*/	
	
	
	@RequestMapping( value="listUserAdmin" )
	public String listUserAdmin( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/listUserAdmin.jsp";
	}
	
	
	
	/*@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
	*/
	
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{

		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session)  throws Exception{
		
		System.out.println("ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅇㅁㄹ" + user);
		User dbUser=userService.getUser(user.getUserId());
		
		System.out.println("가지온온 user :::: " + dbUser);
		
		
		if( user.getPassword().equals( dbUser.getPassword() ))
		{
			session.setAttribute("user", dbUser);
		}
		
		System.out.println("user"+user);
		
		return "redirect:/index.jsp";
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session) throws Exception{
	
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping( value="getMyInfo", method=RequestMethod.GET )
	public String getMyInfo(@RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("userId"+userId);
		System.out.println("왜안됨?");
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		System.out.println("user"+user);
		return "forward:/user/getMyInfo.jsp";
	}
	
	/*@RequestMapping( value="getMyInfo", method=RequestMethod.GET )
	public String getMyInfo(@RequestParam("groupMaster") String groupMaster) throws Exception {
		
		@RequestParam("userId") String userId , Model model 
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		 
		System.out.println("123");
		return "forward:/user/getMyInfo.jsp";
		
	}*/
	@RequestMapping( value="getMyGroup", method=RequestMethod.GET )
	public String getMyGroup( ) throws Exception {
	
		System.out.println("getMyGroup");
		return "forward:/user/getMyGroup.jsp";
		
	}
	
	@RequestMapping(value="searchId", method=RequestMethod.GET)
	public String searchId() throws Exception{
		
		System.out.println("searchId");
		return "forward:/user/searchId.jsp";
	}
	
	@RequestMapping(value="searchPw", method=RequestMethod.GET)
	public String searchPw() throws Exception{
		
		System.out.println("searchPw");
		return "forward:/user/searchPw.jsp";
	}
	

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser(@RequestParam("userId") String userId , Model model ) throws Exception{

		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	
/*	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		userService.addUser(user);
		
		return "redirect:/user/loginView.jsp";
	}
	

	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	

	

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/index.jsp";
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
		
		System.out.println("/user/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplication.jsp";
	}

	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
	
*/	
	
	
	

} // 클래스 끝