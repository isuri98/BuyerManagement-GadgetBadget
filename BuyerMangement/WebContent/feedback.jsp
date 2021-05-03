<%@page import="com.Feedback"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Page</title>


<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/client.js"></script>



</head>
<body>

<% 
if (request.getParameter("fedID") != null) 
 { 
 Feedback feedbackObj = new Feedback(); 
 String stsMsg =  feedbackObj.deleteFeedback(request.getParameter("fedID")); 
 session.setAttribute("statusMsg", stsMsg); 
 } 

//Save---------------------------------
if (request.getParameter("fedID") != null)
{
	Feedback feedbackObj = new Feedback();
 String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidfedIDSave") == "")
 {
 stsMsg = feedbackObj.insertFeedback(request.getParameter("name"),
 request.getParameter("contactNo"),
 request.getParameter("email"),
 request.getParameter("comment"),
 request.getParameter("ratetype"));
 }



else//Update----------------------
 {
 stsMsg = feedbackObj.updateFeedback(request.getParameter("hidfedIDSave"),
 request.getParameter("name"),
 request.getParameter("contactNo"),
 request.getParameter("email"),
 request.getParameter("comment"),
 request.getParameter("ratetype"));
 }
 session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null)
{
Feedback feedbackObj = new Feedback();
 String stsMsg =
 feedbackObj.deleteFeedback(request.getParameter("hidfedIDDelete"));
 session.setAttribute("statusMsg", stsMsg);
}
 %>
<div class="container"><div class="row"><div class="col-6">   
<h1>Feedback Page</h1>
  <form id="formFeedback" name="formFeedback">
     Item code: 
 <input id="name" name="name" type="text" class="form-control form-control-sm">
 <br> Item name: 
 <input id="contactNo" name="contactNo" type="text" class="form-control form-control-sm">
 <br> Item price: 
 <input id="email" name="email" type="text" class="form-control form-control-sm">
 <br> Item description: 
 <input id="comment" name="comment" type="text" class="form-control form-control-sm">
 <br>
 <br>How do you rate for your overall experience:
   <input type="radio" name="ratetype" value="Excellent">Excellent<br>
   <input type="radio" name="ratetype" value="good">good<br>
  <input type="radio" name="ratetype" value="average">average<br>
   <input type="radio" name="ratetype" value="disbled">Disabled<br>	
   
 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
 <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divItemsGrid">
 <%
 Feedback feedbackObj = new Feedback(); 
 out.print(feedbackObj.readFeedback()); 
 %>
 
 
 


   


 
</div>
</body>
</html>