package com.moim.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moim.mvc.domain.User;
import com.moim.mvc.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	
	private int randomNum;
	
	@Autowired
    @Qualifier("userServiceImpl")
	private UserService userService;
	
	
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public String login(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpSession session) throws Exception{
		System.out.println("User"+userId+password);
		
		User dbUser = userService.getUser(userId);
		
		System.out.println("dbUser 입니다"+dbUser);

	
		if(dbUser==null){	
			return "0";	
			}else {
				if( password.equals(dbUser.getPassword())){
					session.setAttribute("user", dbUser);
					return "2";
					
					}	else{
						return "1";
					}	
			}
		
		}
		
		
		//dbUser -- 값이 없으면 id가없는거 return "0";
		//dbUser에 값이 있어 User에 있는 password 비교해서 같으면 return "2" 로그인성공
		//틀리면 return "1" 비밀번호가 틀린거
		
	
	
	
	/*@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	
	*/
	
	@RequestMapping( value="json/searchId", method=RequestMethod.POST )
	public String findId(@RequestParam("phone") String phone, @RequestParam("name") String name)throws Exception{
		
	//	System.out.println("1111 ::: " + request.getParameter("phone") + request.getParameter("userName"));
		String userId = userService.getId(name, phone);
		return userId;
}
	
	@RequestMapping( value="json/searchPw", method=RequestMethod.POST )
	public String findId(@RequestParam("userId") String userId, @RequestParam("phone") String phone, @RequestParam("name") String name)throws Exception{
		
		String password = userService.getPassword(userId, name, phone);
		return password;
	}
	
	/*
	@RequestMapping( value="json/findPassword", method=RequestMethod.POST )
	public String findPassword(@RequestParam("userId") String userId, @RequestParam("phone") String phone, @RequestParam("userName") String userName)throws Exception{
		
		String password = userService.getPassword(userId, userName, phone);
		return password;
	}*/
	
	@RequestMapping( value="json/checkId", method=RequestMethod.POST )
	public String checkId(@RequestParam("userId") String userId)throws Exception{
		String result = userService.checkId(userId);
		return result;
	}
	

	
	
	/*@RequestMapping(value="json/checkPhone" )
	public String checkPhone(@RequestParam("phoneNumber") String phoneNumber) throws Exception{
		
			randomNum = (int)(Math.random()* 899999 + 100000);
		

		      String api_key = "NCSAWROPF4PC2YTR";
		        String api_secret = "HLUBBZTFKACN4TO9FMXSOWNCZIMIP2LJ";
		        Coolsms coolsms = new Coolsms(api_key, api_secret);
		    
		        HashMap<String, String> set = new HashMap<String, String>();
	
		        set.put("to", phoneNumber); //외우기 수신번호29793196
		        set.put("from", "01063387328"); // 발신번호 
		        set.put("text", "인증번호는" + randomNum + "입니다."); // 문자내용
		        set.put("type", "sms"); // 문자 타입

      
		        JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		        if ((Boolean)result.get("status") == true) {
		            // 메시지 보내기 성공 및 전송결과 출력
		            System.out.println("성공");            
		        } else {
		            // 메시지 보내기 실패
		            System.out.println("실패");
		        }      
		return null;
}

	
	@RequestMapping(value="json/confirm",  method=RequestMethod.POST )
	public String confirm(@RequestParam String inputNum)  throws Exception{
		
		System.out.println("들어옴 : "+inputNum + ":::::::" + randomNum);
		if(Integer.valueOf(inputNum) == randomNum) {
			return "1";
		}
		else {
			return "0";
			
		}
	}

*/
}