$(document).ready(function() {

	var call_prompt = function() {
		var data = Object(null);
		data.question = prompt("votre question ?");
		data.name = prompt("nom de votre input ?");
		if($.trim(data.question) == "" || data.question == null ||
			$.trim(data.name) == "" || data.name == null) {
			return;
		}
		return data;
	}


	var radio_prompt = function(data, status) {
		if(status) {
			data.question = prompt("votre question ?");
		}

		var name = prompt("nom de votre input ?(laiser vide pour finir la question) ");
		if($.trim(data.question) == "" || data.question == null || name == null) {
			return;
		}
		if($.trim(name) == "") {
			return data;
		}
		else {
			data.name.push(name) 
			return radio_prompt(data, false);	
		}
	}

	var add_to_input = function() {
		$('#survey_html').val($('#question').html());
	}

	var add_to_html = function() {
		$('#question').html($('#survey_html').val());
	}


	add_to_html();
	
	$('#addquestion').on('click', function(event) {
		event.preventDefault();
		event.stopImmediatePropagation();

		switch ($('select#choice').val()) {






			case "1":
			data = call_prompt();
			if(data == undefined) {
				return;
			}
			$('#question').append($('<div></div>').append(
				$('<label>'+$.trim(data.question)+'</label>'),
				$('<input type="text" name="survey['+$.trim(data.name)+']">')));
				add_to_input();

				
			break;






			case "2":
			data = call_prompt();
			if(data == undefined) {
				return;
			}
			$('#question').append($('<div></div>').append(
				$('<label>'+$.trim(data.question)+'</label>'),
				$('<textarea type="text" name="survey['+$.trim(data.name)+']"></textarea>')));
				add_to_input();
			break;








			case "3":
			var obj = Object(null);
			obj.name = Array();
			data = radio_prompt(obj, true);
			if(data == undefined) {
				return;
			}

			mydiv = $('<div></div>');
			mydiv.append($('<label>'+$.trim(data.question)+'</label>'));

			$.each(data.name, function(index, val) {
				mydiv.append($('<div><span>'+$.trim(val)+'</span><input type="checkbox" value='+$.trim(val)+' name="survey['+$.trim(data.name)+']"></div>'));
			});
			$('#question').append(mydiv);
			add_to_input();
			break;




			case "4":
			var obj = Object(null);
			obj.name = Array();
			data = radio_prompt(obj, true);
			if(data == undefined) {
				return;
			}

			mydiv = $('<div></div>');
			mydiv.append($('<label>'+$.trim(data.question)+'</label>'));

			$.each(data.name, function(index, val) {
				mydiv.append($('<div><input type="radio" value='+$.trim(val)+' name="survey['+$.trim(data.question)+']"><span>'+$.trim(val)+'</span></div>'));
			});
			$('#question').append(mydiv);
			add_to_input();
			break;






			case "5":
			var obj = Object(null);
			obj.name = Array();
			data = radio_prompt(obj, true);
			if(data == undefined) {
				return;
			}

			mydiv = $('<div></div>');
			mydiv.append($('<label>'+$.trim(data.question)+'</label>'));

			myselect = $('<select name="survey['+$.trim(data.question)+']"></select>');
			mydiv.append(myselect);

			$.each(data.name, function(index, val) {
				myselect.append($('<option value="'+$.trim(val)+'">' + $.trim(val) + '</option>'));
			});
			$('#question').append(mydiv);
			add_to_input();
			break;



			default:
			return;
			break;

		};

	});
});