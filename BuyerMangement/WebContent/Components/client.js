/**
 * 
 */



$(document).on("click", "#btnSave", function(event)
		{ 
		// Clear alerts---------------------
		 $("#alertSuccess").text(""); 
		 $("#alertSuccess").hide(); 
		 $("#alertError").text(""); 
		 $("#alertError").hide(); 
		// Form validation-------------------
		var status = validateClientForm(); 
		if (status != true) 
		 { 
		 $("#alertError").text(status); 
		 $("#alertError").show(); 
		 return; 
		 } 
		// If valid------------------------
		var type = ($("#hidIDSave").val() == "") ? "POST" : "PUT"; 
		 $.ajax( 
		 { 
		 url : "ClientAPI", 
		 type : type, 
		 data : $("#formClient").serialize(), 
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 onFeedbackSaveComplete(response.responseText, status); 
		 } 
		 }); 
		});


function onClientSaveComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divClientsGrid").html(resultSet.data); 
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
$("#formClient")[0].reset(); 
}





$(document).on("click", ".btnUpdate", function(event)
		{ 
		$("#hidIDSave").val($(this).data("id")); 
		 $("#fname").val($(this).closest("tr").find('td:eq(0)').text()); 
		 $("#lname").val($(this).closest("tr").find('td:eq(1)').text()); 
		 $("#NIC").val($(this).closest("tr").find('td:eq(2)').text()); 
		 $("#address").val($(this).closest("tr").find('td:eq(3)').text()); 
		 $("#contactNumber").val($(this).closest("tr").find('td:eq(4)').text()); 
		 $("#email").val($(this).closest("tr").find('td:eq(5)').text()); 
		 $("#username").val($(this).closest("tr").find('td:eq(6)').text()); 
		 $("#password").val($(this).closest("tr").find('td:eq(7)').text()); 
		});





$(document).on("click", ".btnRemove", function(event)
		{ 
		 $.ajax( 
		 { 
		 url : "ClientAPI", 
		 type : "DELETE", 
		 data : "id=" + $(this).data("id"),
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 onItemDeleteComplete(response.responseText, status); 
		 } 
		 }); 
		});



function onClientDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divClientsGrid").html(resultSet.data); 
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