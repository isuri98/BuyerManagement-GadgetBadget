



$(document).on("click", "#btnSave", function(event)
		{ 
		// Clear alerts---------------------
		// $("#alertSuccess").text(""); 
		// $("#alertSuccess").hide(); 
		// $("#alertError").text(""); 
		// $("#alertError").hide(); 
		// Form validation-------------------
		var status = validateFeedbackForm(); 
		//if (status != true) 
		// { 
		// $("#alertError").text(status); 
		// $("#alertError").show(); 
		// return; 
		// } 
		// If valid------------------------
		var type = ($("#hidIDSave").val() == "") ? "POST" : "PUT"; 
		 $.ajax( 
		 { 
		 url : "FeedbackAPI", 
		 type : type, 
		 data : $("#formFeedback").serialize(), 
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 onFeedbackSaveComplete(response.responseText, status); 
		 } 
		 }); 
		});


function onFeedbackSaveComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divFeedbacksGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 } 
$("#hidIDSave").val(""); 
$("#formFeedback")[0].reset(); 
}





$(document).on("click", ".btnUpdate", function(event)
		{ 
		$("#hidIDSave").val($(this).closest("tr").find('#hidIDUpdate').val());
		 $("#name").val($(this).closest("tr").find('td:eq(0)').text()); 
		 $("#contactNo").val($(this).closest("tr").find('td:eq(1)').text()); 
		 $("#email").val($(this).closest("tr").find('td:eq(2)').text()); 
		 $("#comment").val($(this).closest("tr").find('td:eq(3)').text()); 
		 $("#ratetype").val($(this).closest("tr").find('td:eq(4)').text()); 
		 
		});





$(document).on("click", ".btnRemove", function(event)
		{ 
		 $.ajax( 
		 { 
		 url : "FeedbackAPI", 
		 type : "DELETE", 
		 data : "fedID=" + $(this).data("fedID"),
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 onItemDeleteComplete(response.responseText, status); 
		 } 
		 }); 
		});



function onFeedbackDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divFeedbacksGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}




// CLIENTMODEL=========================================================================

function validateForm() {
	
	if ($("#name").val().trim() == "") {
		return "Insert name.";
	}
	
	if ($("#contactNo").val().trim() == "") {
		return "Insert contactNo.";
	}
	if ($("#email").val().trim() == "") {
		return "Insert email .";
	}
	

	
	if ($("#comment").val().trim() == "") {
		return "Insert a comment.";
	}
	
	
	if ($("#ratetype").val().trim() == "") {
		return "Insert a ratetype.";
	}
	

	return true;
}