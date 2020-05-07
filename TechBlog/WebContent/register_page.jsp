<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<!-- css -->
<%@include file="css_page.jsp" %>
</head>
<body>

<!-- navbar -->
<%@include file="normal_navbar.jsp" %>

<main class="primary-background p-5 banner-background" style="padding-bottom:50px;">
  <div class="container">
     <div class="col-md-6 offset-md-3">
     
         <div class="card">
            <div class="card-header text-center primary-background text-white">
            <span class="fa fa-3x fa-user-circle"></span>
             <br>
              Register here
            </div>
            <div class="card-body">
              <form id="reg-form" action="RegisterServlet" method="post">
                  <div class="form-group">
				    <label for="user_name">User Name</label>
				    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				  </div>
				  
				  <div class="form-group">
				    <label for="gender">Select Gender</label>
				    <br>
				    <input type="radio"  id="gender" name="gender" value="male">Male
				    <input type="radio"  id="gender" name="gender" value="female">Female
				  </div>
				  
				  <div class="form-group">
				    <textarea class="form-control" rows="5" name="about" placeholder="Enter somthing about yourself"></textarea>
				  </div>
				  
				  <div class="form-check">
				    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
				    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
				  </div>
				  <br/>
				  <div class="container text-center" id="loader" style="display: none;">
				   <span class="fa fa-refresh fa-spin fa-3x"></span>
				   <h4>Please wait...</h4>
				  </div>
				 
				  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
				</form>
            </div>
            
         </div>
       
     </div>
  </div>
</main>
</body>
<!-- Javascript -->
<%@include file="javascript_page.jsp" %>
<script>
  $(document).ready(function(){
	console.log("Loaded...");
	
	$('#reg-form').on('submit',function(event){
		
		//not going to servlet(prevent to servlet)
		event.preventDefault();
		
		let form=new FormData(this);
		
		$("#submit-btn").hide();
		$("#loader").show();
		
		//send register servlet
		$.ajax({
			
			url: "RegisterServlet",
			type: "POST",
			data: form,
			success: function(data, textStatus,jqXHR)
			{
				console.log(data);
				
				$("#submit-btn").show();
				$("#loader").hide();
				
				if(data.trim()==='done')
				{
				
				//sweet alert
				swal("Register successfully.. we are redirecting to login page")
				.then((value) => {
				  window.location="login_page.jsp";
				});
				
			 }
				else
					{
					//sweet alert
					swal("Something went wrong...try again");
					}
			},
			error: function(jqXHR, textStatus, errorThrown)
			{
				console.log(jqXHR);

				$("#submit-btn").show();
				$("#loader").hide();
				
				//sweet alert
				swal("Something went wrong...try again");
				
			},
			processData: false,
			contentType: false
			
		});
		
	});
	  
  });
</script>
</html>