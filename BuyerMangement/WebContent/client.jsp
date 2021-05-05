<%@page import="com.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buyer Details added</title>


<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/client.js"></script>

	
</head>
<body>



<div class="container"><div class="row"><div class="col-6"> 
<h1>Add Buyer Details</h1>
<form id="formClient" name="formClient">
 First Name: 
 <input id="fname" name="fname" type="text" class="form-control form-control-sm">
 <br> Last name: 
 <input id="lname" name="lname" type="text" class="form-control form-control-sm">
 <br> NIC: 
 <input id="NIC" name="NIC" type="text" class="form-control form-control-sm">
 <br> Address: 
 <input id="address" name="address" type="text" class="form-control form-control-sm">
 <br>
  <br> Contact number: 
 <input id="contactNumber" name="contactNumber" type="text" class="form-control form-control-sm">
 <br>
  <br> Email: 
 <input id="email" name="email" type="text" class="form-control form-control-sm">
 <br>
  <br> Username: 
 <input id="username" name="username" type="text" class="form-control form-control-sm">
 <br>
  <br> Password: 
 <input id="password" name="password" type="text" class="form-control form-control-sm">
 <br>
 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
 <input type="hidden" id="hidIDSave" name="hidIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divClientsGrid">
 <%
 Client clientObj = new  Client(); 
 out.print(clientObj.readClients()); 
 %>
 
 
 

</div>
</div> </div> </div>


      
     
        
        
       

</body>
</html>