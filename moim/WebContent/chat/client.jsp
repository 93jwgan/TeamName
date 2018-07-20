<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Chat</title>
    <style>
      .chat_log{ width: 95%; height: 200px; }
      .name{ width: 10%; }
      .message{ width: 70%; }
      .chat{ width: 10%; }
    </style>
  </head>
  <body>
    <div>
      <input type="text" id="room" class="room" readonly>
    </div>

    <div>

     <textarea id="chatLog" class="chat_log" readonly></textarea>

    </div>
    <form id="chat">
      <input id="name" class="name" type="text" readonly>
      <input id="message" class="message" type="text">
      <input type="submit" class="chat" value="입력"/>
    </form>

    <script src="http://localhost:3000/socket.io/socket.io.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.js"></script>
    <script>
    
      var socket = io('http://localhost:3000/');
      
      $('#chat').on('submit', function(e)
      {
        socket.emit('send message', $('#name').val(), $('#message').val());
        $('#message').val("");
        $("#message").focus();
        e.preventDefault();
      });

      socket.on('saveContents', function(saveContents)
      {
        $('#chatLog').append(saveContents+'\n');
        $('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
      })

      socket.on('change name', function(name){
        $('#name').val(name);

      });

      socket.on('receive message', function(msg){
        $('#chatLog').append(msg+'\n');
        $('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
      });
      
    </script>
  </body>
</html>
