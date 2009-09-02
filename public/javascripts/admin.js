jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

// specified what functions are called before and after our forms are submitted
var options = {
	dataType: 'json',
  success: postSubmit  // post-submit callback 
};

// post-submit callback for notifications. Expects a json object for responseText
function postSubmit(json, statusText)  {
	// setup our defaults
	var icon = '/images/icons/tick.png';
	var title = 'Success';
	var message = 'Successfully saved.';
	var timeout = 2000;
	
	if (json.icon != null) icon = '/images/icons/' + json.icon + '.png';
	if (json.title != null) title = json.title;
	if (json.message != null) message = json.message;
	if (json.timeout != null) timeout = json.timeout;
	
	$.gritter.add({
		title: title,
		text: message,
		image: icon,
		time: timeout
	});
}

$(document).ready(function() {
  
	$('form').validate();
  $('a.thumb').lightBox();
 
	// bind all forms on the page
	$('form.ajax').ajaxForm(options);
	
});