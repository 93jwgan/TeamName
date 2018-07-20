(function(){
	var i = 0;
	document.querySelector(".add").addEventListener("click", addMessage);

	document.querySelector(".input").onkeypress = function(e){
		if(e.key === "Enter"){
			addMessage();
		}
	}

	function addMessage(){
		var message = document.querySelector(".input input").value;

		if( message !== ""){
			var botText = [
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
