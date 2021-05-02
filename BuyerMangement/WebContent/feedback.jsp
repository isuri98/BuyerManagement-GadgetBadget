<%@page import="com.Feedback"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Page</title>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <link href="css/header_footer.css" rel="stylesheet" type="text/css">-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/feedback.js"></script>


<style>
body{
		background-color: #25274d;
	}
	.contact{
		padding: 4%;
		height: 400px;
	}
	.col-md-3{
		background: #ff9b00;
		padding: 4%;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	.contact-info{
		margin-top:10%;
	}
	.contact-info img{
		margin-bottom: 15%;
	}
	.contact-info h2{
		margin-bottom: 10%;
	}
	.col-md-9{
		background: #fff;
		padding: 3%;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	.contact-form label{
		font-weight:600;
	}
	.contact-form button{
		background: #25274d;
		color: #fff;
		font-weight: 600;
		width: 25%;
	}
	.contact-form button:focus{
		box-shadow:none;
	}

</style>
</head>
<body>







<div class="container contact">
<form id="formFeedback"  name="formFeedback">
	<div class="row">
		<div class="col-md-3">
			<div class="contact-info">
				<img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image"/>
				<h2>Feedback</h2>
				<h4>Give your feedback, we can give you to better service</h4>
			</div>
		</div>
		<div class="col-md-9">
			<div class="contact-form">
				<div class="form-group">
				  <label class="control-label col-sm-2" for="name"> Name:</label>
				  <div class="col-sm-10">          
					<input type="text" class="form-control" id="name" placeholder="Enter Name" pattern="[a-zA-Z][a-zA-Z ]{2,}"name="name" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="name">Contact No:</label>
				  <div class="col-sm-10">          
					<input type="text" class="form-control" id="contactNo"   pattern="[0-9]{10}" placeholder="1234567890" name="contactNo" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="email">Email:</label>
				  <div class="col-sm-10">
					<input type="email" class="form-control" id="email"  placeholder="abc@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}"name="email" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="comment">Comment:</label>
				  <div class="col-sm-10">
					<input type="text" class="form-control"  id="comment" name="comment">
				  </div>
			
				<div>
				<p><b>How do you rate for your overall experience?</b></p>
   <input type="radio" name="ratetype" value="Excellent">Excellent<br>
   <input type="radio" name="ratetype" value="good">good<br>
  <input type="radio" name="ratetype" value="average">average<br>
   <input type="radio" name="ratetype" value="disbled">Disabled<br>	</div>
   
 
				
				<div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				     <button type="submit" class="btn btn-default">Reset</button>
				  </div></div>
				 <input type="hidden" id="hidfedIDSave" name="hidfedIDSave" value="">
					
				  
				</div>
			</div>
		</div>
	</div>
</div>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divFeedbackGrid">
 <%
 Feedback feedbackObj = new Feedback(); 
 out.print(feedbackObj.readFeedback()); 
 %>
</div>
</div> </div> </div>
</body>
</html>