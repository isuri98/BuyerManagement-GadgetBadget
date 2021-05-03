<%@page import="com.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buyer Details added</title>


<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/client.js"></script>

<style>





body {
     
      /*background:linear-gradient(to bottom, #1c1182, #a442f5);*/
      background-color:lightblue;
        background-size:1500px 1200px;
  background-repeat:no-repeat;
      
   
}



*[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 0 auto;
    border-radius: 0.3em;
    background-color:#808080;
    
}

*[role="form"] h2 { 
    font-family: 'Open Sans' , sans-serif;
    font-size: 40px;
    font-weight: 600;
    color: black;
    margin-top: 5%;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 4px;
}




</style>

<script>

	function checkPassword(){
	if(document.getElementById("pwd").value != document.getElementById("cnfrmpwd").value){
        alert("Password Mismatch!");
		return false;
    }else{
        alert("Success!");
		return true;
    }	
}

</script>	</div>
</head>
<body>



<div class="container">
 
            <form class="form-horizontal" method="POST" action=".//CustomerInsertServlet"role="form">
                <h2>Sign Up for New Account </h2>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="First Name" pattern="[a-zA-Z][a-zA-Z ]{2,}"class="form-control" name="fname" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">Last Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="lastName" placeholder="Last Name"  pattern="[a-zA-Z][a-zA-Z ]{2,}"class="form-control" name="lname" autofocus>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="NIC" class="col-sm-3 control-label">NIC </label>
                    <div class="col-sm-9">
                        <input type="NIC" id="NIC"   pattern="[0-9]{10}" placeholder="1117891239"  class="form-control" name= "NIC">
                    </div>
                </div>
                
                
                 <div class="form-group">
                  <label for="Address" class="col-sm-3 control-label"> Address</label>
    
                           <div class="col-sm-9">
                         
                             <input type =" address" rows="5" placeholder="type your address..."  class="form-control"  name="address" autofocus >
                  </div>
                    </div>
        
         <div class="form-group">
                    <label for="contactNumber" class="col-sm-3 control-label">Contact number </label>
                    <div class="col-sm-9">
                        <input type="contactNumber" id="contactNumber"  pattern="[0-9]{10}" placeholder="1234567890" class="form-control" name="contactNumber">
                        
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email* </label>
                    <div class="col-sm-9">
                        <input type="email" id="email"  placeholder="abc@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" class="form-control" name= "email">
                    </div>
                </div>
                 
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Username*</label>
                    <div class="col-sm-9">
                        <input type="username" id="username" placeholder="Username" name="username" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label"> Password*</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" placeholder="Password"  name="password"class="form-control">
                    </div>
                </div>
                
              
                <div class="form-group">
                   
                       <center><h6>By signing up I accept the Terms & privacy policies</h6></center>
                    </div>
                
                <div>
                <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                 <button type="Reset" class="btn btn-primary btn-block">Reset</button>
                  <input type="hidden" id="hidfedIDSave" name="hidfedIDSave" value="">
            </form> <!-- /form -->
            
            <div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divClientGrid">
 <%
 Client clientObj = new Client(); 
 out.print(clientObj.readClient()); 
 %>
</div>
        </div> <!-- ./container -->
        
       

      
        <script>
        
        
        $(function(){
        	$.validator.setDefaults({
        		highlight: function(element){
        			$(element)
        			.closest('.form-group')
        			.addClass('has-error')
        		},
        		unhighlight: function(element){
        			$(element)
        			.closest('.form-group')
        			.removeClass('has-error')
        		}
        	});
        	
        	$.validate({
        		rules:
        		{	
        			 password: "required",
        			birthDate: "required",
        			
        			},
        			email: {
        				required: true,
        				email: true
        			}
        		}
        			messages:{			
        				email: {
        				required: true,
        				email: true
        			}
        		},
        		     NIC: {
					required: " Please enter NIC"
				      },
        				
        				phoneNumber: {
        					required: " Please enter contact no"
        				},
        				email: {
        					required: ' Please enter email',
        					email: ' Please enter valid email'
        				},
        				
        	password: {
				required: " Please enter password"
			},	
        	});
        });
        </script>


</body>
</html>