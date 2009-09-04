jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

$(document).ready(function() {
  
	// validate all forms
	$('form').validate();
	
	// lightbox thumbnails
  $('a.thumb').lightBox();

	// use markitup for editing textareas with a class of markup
	$('textarea.markup').markItUp(mySettings);
	
	/* ***
	** TABLE ROW ORDERING VIA DRAG AND DROP **
	** requires: 
	**  1) server_authenticity_token should be set to rails form auth token in the calling erb page.
	**  2) You need an update_position action and route on the controller for the object being re-ordered.
	**     This action should return a json object.
	**  3) There should be a header row (assumption is made that the first row is 1 and not 0).
	**  4) The table you want to sort should have a class assignment of "sortable".
	*/
  $("table.sortable").tableDnD({
		onDragClass: "row_drag",
    onDrop: function(table, row) {
			// figure out where the row moved to
      var position = 0;
      var rows = table.tBodies[0].rows;
      for (var i=0; i<rows.length; i++) {
        if (rows[i].id === row.id) {
          position = i;
        }
      }
      // submit the id and position to the server via ajax
      $.post(document.location + '/' + row.id + '/update_position', {_method:"put", authenticity_token:server_authenticity_token, position:position}, function(data) {
        json = eval('(' + data + ')');
				var icon = '/images/icons/notice.png';
				if (json.title === "Error") icon = '/images/icons/warning.png';
        // inform the user of success / fail via gritter (growl)
        $.gritter.add({
      		title: json.title,
      		text: json.message,
      		image: icon,
      		time: 3000
      	});
      });
    }
  });

});