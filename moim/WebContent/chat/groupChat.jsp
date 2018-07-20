<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat</title>
<link href="../css/chat/groupChatStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="wrapper">
		<div class="chat">
			<div class="chat-left">
		<!-- 		<div class="input-wrap">
					<input type="text" name="" placeholder="seach">
					<i class="fa fa-search" aria-hidden="true"></i>
				</div> -->
				<div class="user">
					<img src="https://yt3.ggpht.com/-W8COuePR0sU/AAAAAAAAAAI/AAAAAAAAAAA/iAbnzA42vvY/s900-c-k-no-mo-rj-c0xffffff/photo.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Artem Grinberg</div>
					</div>
				</div>
			</div>
			<div class="chat-right">
				<div class="chating">
					<img src="https://yt3.ggpht.com/-W8COuePR0sU/AAAAAAAAAAI/AAAAAAAAAAA/iAbnzA42vvY/s900-c-k-no-mo-rj-c0xffffff/photo.jpg">
					<div class="chating-with">
						<div class="name-chat"> <b>${group.groupName}</b></div>
						<span class="status">채팅방 입니다.</span>
					</div>
					<div class="like"><i class="fa fa-thumbs-up"></i></div>
				</div>
				<div class="message">
				</div>
				<div class="line-input">
					<div class="input"><input type="text"></div>
					<button class="add">Send</button>
				</div>
			</div>
		</div>
	</div>
	
	<button class="leave">나가기</button>
    
<script src="//code.jquery.com/jquery-1.11.1.js"></script>
<script src="http://192.168.0.25:3000/socket.io/socket.io.js"></script>
<script>

	var socket = io('http://192.168.0.25:3000/group');
	
		socket.on('connect', function()
		{
			socket.emit('user',"${user.name}","${user.profileImg}","${group.groupNo}");
		});
	
		$('.add').on('click', function(e)
		{
			socket.emit('send message', $('.input input').val());
			$('.input input').val("");
			$('.input input').focus();
			e.preventDefault();
		});
		
		$('.input').keypress(function(key){
			
			if(key.keyCode ==13)
			{
				socket.emit('send message', $('.input input').val());
				$('.input input').val("");
				$('.input input').focus();
				key.preventDefault();
			}
		});
		
		$('.leave').click(function(e){
			
			self.close();
			
			e.preventDefault();
			
		});
		
		
		
		socket.on('connect user',function(connectUser)
		{
			$('.message').append('<div class="solo-message"><div><img src="http://img.postshare.co.kr/images/2015/11/19150903/zt.jpg">SYSTEM</div><div class="message-text left">'+connectUser+'님이 입장하셨습니다.</div></div>');
			$('.message').scrollTop($('.message')[0].scrollHeight);
		});
		
		
     	socket.on('saveContents', function(profileImg,name,contents)
     	{
     	       $('.message').append('<div class="solo-message"><div><img src='+profileImg+'>'+name+'</div><div class="message-text left">'+contents+'</div></div>');
     	       $('.message').scrollTop($('.message')[0].scrollHeight);
     	});
	      
     	socket.on('receive message', function(profileImg,name,contents)
     	{
        	$('.message').append('<div class="solo-message"><div><img src="'+profileImg+'">'+name+'</div><div class="message-text left">'+contents+'</div></div>');
        	$('.message').scrollTop($('.message')[0].scrollHeight);
      	});
     	
     	socket.on('leave user',function(leaveUser)
     	{
     		$('.message').append('<div class="solo-message"><div><img src="http://img.postshare.co.kr/images/2015/11/19150903/zt.jpg">SYSTEM</div><div class="message-text left">'+leaveUser+'님이 퇴장하셨습니다.</div></div>');
     		$('.message').scrollTop($('.message')[0].scrollHeight);
     	});
    	
     	socket.on('userlist',function(profileImg,name,uni)
     	{
  
   			$('.chat-left').append('<div class="user" id='+uni+'><img src="'+profileImg+'" alt="" class="icon-user"><div class="user-status"><div class="name">'+name+'</div></div>');
     	});
     	
     	socket.on('deleteUserlist',function(uni)
     	{
     	     		$('#'+uni).remove(); 
     	   			
     	});   
	     
</script>

</body>
</html>