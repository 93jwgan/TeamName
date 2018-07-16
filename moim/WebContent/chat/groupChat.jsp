<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test Chat</title>
<link href="../css/chat/groupChatStyle.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

<div class="wrapper">
		<div class="chat">
			<div class="chat-left">
				<div class="input-wrap">
					<input type="text" name="" placeholder="seach">
					<i class="fa fa-search" aria-hidden="true"></i>
				</div>
				<div class="user">
					<img src="https://yt3.ggpht.com/-W8COuePR0sU/AAAAAAAAAAI/AAAAAAAAAAA/iAbnzA42vvY/s900-c-k-no-mo-rj-c0xffffff/photo.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Artem Grinberg</div>
						<i class="fa fa-circle"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NDg0MDU0NTIzODQwMDE1/steven-jobs-9354805-2-402.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Steve Jobs</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://cs8.pikabu.ru/post_img/big/2016/04/13/7/1460542975161293550.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Elon Musk</div>
						<i class="fa fa-circle"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://avatarfiles.alphacoders.com/792/79295.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Bugs Bunny</div>
						<i class="fa fa-circle"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://i.work.ua/sent_photo/9/8/3/983e03f616d55c1b67f9a01633e27e72.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Chybirka Victor</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="http://99px.ru/sstorage/1/2012/05/image_12605120347344938832.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Iron Man</div>
						<i class="fa fa-circle "></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://media1.popsugar-assets.com/files/thumbor/WjFR-_7dQ3eGnp_oHtDor3Au1gI/fit-in/550x550/filters:format_auto-!!-:strip_icc-!!-/2017/08/18/840/n/1922398/d06222d559973b8d6550b9.76731985_edit_img_image_43907487_1503079245/i/Leonardo-DiCaprio-Halloween-Costume-Ideas.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Leonardo Dicaprio</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/a1/a139201eecad23108dc4a2b1453ffa74a9e51387_full.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Donald Trump</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>

			</div>
			
<!-- 			///////// -->

			<div class="chat-right">
				<div class="chating">
					<img src="https://yt3.ggpht.com/-W8COuePR0sU/AAAAAAAAAAI/AAAAAAAAAAA/iAbnzA42vvY/s900-c-k-no-mo-rj-c0xffffff/photo.jpg">
					<div class="chating-with">
						<div class="name-chat"> <b> Chat with Sorax </b></div>
						<span class="status">already 1 902 messages</span>
					</div>
					<div class="like"><i class="fa fa-thumbs-up"></i></div>

				</div>
				<div class="message">
				
					<div class="solo-message">
						<li>Simon<div class="message-text left">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus rem aspernatur neque omnis nostrum voluptatem obcaecati natus. Deleniti, iusto, sed.
						</div>
					</div>
					
				</div>
				<form id="chat">
				<div class="line-input">
					<input id="chatmessage" type="text">
     	 			<input type="submit" class="chat" value="SEND"/>
				</div>
				</form>
			</div>
		</div>

	</div>
    
<script src="//code.jquery.com/jquery-1.11.1.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<script type="text/javascript">

var socket = io('http://localhost:3000/');

		$('#chat').on('submit', function(e)
	     {
	        socket.emit('send message', $("#chatmessage").val());
	        $("#chatmessage").val("");
	        $("#chatmessage").focus();
	        e.preventDefault();
	     });
	      
	      
		socket.on('saveContents', function(name,contents)
	    {
			$('.message').append
	        ('<div class="solo-message"><div><li>'+name+'</div><div class="message-text left">'+contents+'</div></div>')
	    	$('.message').scrollTop($('.message')[0].scrollHeight);
	    });
	      
     	socket.on('receive message', function(msg)
     	{
        	$('.message').append('<div class="solo-message"><div></div><div class="message-text right">'+msg+'</div></div>');
        	$('.message').scrollTop($('.message')[0].scrollHeight);
      	});
	      
	      
/* 
(function(){
	var i = 0;
	document.querySelector(".send").addEventListener("click", addMessage);

	document.querySelector(".input").onkeypress = function(e){
		if(e.key === "Enter"){
			addMessage();
		}
	}

	function addMessage(){
		var message = document.querySelector(".input input").value;

		if( message !== ""){
			/* var botText = [
				'Why did the web developer leave the restaurant? Because of the table layout.',
      			'How do you comfort a JavaScript bug? You console it.',
      			'An SQL query enters a bar, approaches two tables and asks: "May I join you?"',
      			'What is the most used language in programming? Profanity.',
      			'What is the object-oriented way to become wealthy? Inheritance.',
      			'An SEO expert walks into a bar, bars, pub, tavern, public house, Irish pub, drinks, beer, alcohol'
      		]; 


			var text = document.createElement("div");
			var bot = document.createElement("div");

			text.className = "message-text right";
			bot.className = "message-text left";

			text.innerHTML = message;
			append(text);
			
			setTimeout(function(){
				bot.innerHTML = botText[i];
				i++;
				append(bot);

			}, 1000);

		}
		
	}

	function append(child){
		var out = document.querySelector(".message");
		var innerDiv = document.createElement("div");

		innerDiv.className = "solo-message";

		innerDiv.appendChild(child);
		out.appendChild(innerDiv);

		out.scrollBy(0, 1000);
		document.querySelector(".input input").value = "";

	}

})();
 */

</script>

</body>
</html>