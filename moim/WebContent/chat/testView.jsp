<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test Chat</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>

<a id="view-code" href="https://codepen.io/virgilpana/pen/ZYZXgP" target="_blank">VIEW CODE</a>

<div id="chatbox">
    <div id="friendslist">
        <div id="topmenu">
            <span class="friends"></span>
            <span class="chats"></span>
            <span class="history"></span>
        </div>
        
        <div id="friends">
            <div class="friend">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />
                <p>
                    <strong>Miro Badev</strong>
                    <span>mirobadev@gmail.com</span>
                </p>
                <div class="status available"></div>
            </div>
            
            <div id="search">
                <input type="text" id="searchfield" value="Search contacts..." />
            </div>
            
        </div>                
        
    </div>  
    
    <div id="chatview" class="p1">      
        <div id="profile">

            <div id="close">
                <div class="cy"></div>
                <div class="cx"></div>
            </div>
            
            <p>Miro Badev</p>
        </div>
        
        <div id="chat-messages">
            <label>Thursday 02</label>
            
            <div class="message">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />
                <div class="bubble">
                    Really cool stuff!
                    <div class="corner"></div>
                    <span>3 min</span>
                </div>
            </div>
            
            <div class="message right">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" />
                <div class="bubble">
                    Can you share a link for the tutorial?
                    <div class="corner"></div>
                    <span>1 min</span>
                </div>
            </div>        
        </div>
        
        <div id="sendmessage">
            <input type="text" value="Send message..." />
            <button id="send"></button>
        </div>
    
    </div>        
</div>  
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    
	  var preloadbg = document.createElement("img");
	  preloadbg.src = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/timeline1.png";
	  
	    $("#searchfield").focus(function(){
	        if($(this).val() == "Search contacts..."){
	            $(this).val("");
	        }
	    });
	    
	    $("#searchfield").focusout(function(){
	        if($(this).val() == ""){
	            $(this).val("Search contacts...");

	        }
	    });
	    
	    $("#sendmessage input").focus(function(){
	        if($(this).val() == "Send message..."){
	            $(this).val("");
	        }
	    });
	    $("#sendmessage input").focusout(function(){
	        if($(this).val() == ""){
	            $(this).val("Send message...");
	            
	        }
	    });
	        
	    
	    $(".friend").each(function(){       
	        $(this).click(function(){
	            var childOffset = $(this).offset();
	            var parentOffset = $(this).parent().parent().offset();
	            var childTop = childOffset.top - parentOffset.top;
	            var clone = $(this).find('img').eq(0).clone();
	            var top = childTop+12+"px";
	            
	            $(clone).css({'top': top}).addClass("floatingImg").appendTo("#chatbox");                                    
	            
	            setTimeout(function(){$("#profile p").addClass("animate");$("#profile").addClass("animate");}, 100);
	            setTimeout(function(){
	                $("#chat-messages").addClass("animate");
	                $('.cx, .cy').addClass('s1');
	                setTimeout(function(){$('.cx, .cy').addClass('s2');}, 100);
	                setTimeout(function(){$('.cx, .cy').addClass('s3');}, 200);         
	            }, 150);                                                        
	            
	            $('.floatingImg').animate({
	                'width': "68px",
	                'left':'108px',
	                'top':'20px'
	            }, 200);
	            
	            var name = $(this).find("p strong").html();
	            var email = $(this).find("p span").html();                                                      
	            $("#profile p").html(name);
	            $("#profile span").html(email);         
	            
	            $(".message").not(".right").find("img").attr("src", $(clone).attr("src"));                                  
	            $('#friendslist').fadeOut();
	            $('#chatview').fadeIn();
	        
	            
	            $('#close').unbind("click").click(function(){               
	                $("#chat-messages, #profile, #profile p").removeClass("animate");
	                $('.cx, .cy').removeClass("s1 s2 s3");
	                $('.floatingImg').animate({
	                    'width': "40px",
	                    'top':top,
	                    'left': '12px'
	                }, 200, function(){$('.floatingImg').remove()});                
	                
	                setTimeout(function(){
	                    $('#chatview').fadeOut();
	                    $('#friendslist').fadeIn();             
	                }, 50);
	            });
	            
	        });
	    });         
	});

</script>

</body>
</html>