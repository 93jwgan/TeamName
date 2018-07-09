package com.moim.mvc.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moim.mvc.service.user.UserService;

//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	
	private int randomNum;
	
	@Autowired
    @Qualifier("userServiceImpl")
	private UserService userService;
	
	/*@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	@RequestMapping( value="json/findId", method=RequestMethod.POST )
	public String findId(@RequestParam("phone") String phone, @RequestParam("userName") String userName)throws Exception{
		
	//	System.out.println("1111 ::: " + request.getParameter("phone") + request.getParameter("userName"));
		String userId = userService.getId(userName, phone);
		return userId;
}
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
	
		        set.put("to", phoneNumber); //�ܿ�� ���Ź�ȣ29793196
		        set.put("from", "01063387328"); // �߽Ź�ȣ 
		        set.put("text", "������ȣ��" + randomNum + "�Դϴ�."); // ���ڳ���
		        set.put("type", "sms"); // ���� Ÿ��

      
		        JSONObject result = coolsms.send(set); // ������&���۰���ޱ�
		        if ((Boolean)result.get("status") == true) {
		            // �޽��� ������ ���� �� ���۰�� ���
		            System.out.println("����");            
		        } else {
		            // �޽��� ������ ����
		            System.out.println("����");
		        }      
		return null;
}

	
	@RequestMapping(value="json/confirm",  method=RequestMethod.POST )
	public String confirm(@RequestParam String inputNum)  throws Exception{
		
		System.out.println("���� : "+inputNum + ":::::::" + randomNum);
		if(Integer.valueOf(inputNum) == randomNum) {
			return "1";
		}
		else {
			return "0";
			
		}
	}

*/
}