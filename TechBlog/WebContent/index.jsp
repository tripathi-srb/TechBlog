<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>

	<!-- css -->
	<%@include file="css_page.jsp" %>
	
   
</head>
<body>
   <!-- navbar -->
   <%@include file="normal_navbar.jsp" %>
   <!-- End navbar -->
   
   <!-- bannerchnage -->
   <div class="container-fluid p-0 m-0">
       
       <div class="jumbotron primary-background text-white banner-background">
          <div class="container">
           <h3 class="display-3">Welcome to TechBlog</h3>
           <p>A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
           <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>
           
            <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start ! its Free</button>
            
            <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
          </div> 
       </div>
       
   </div>
   
   <!-- cards -->
   
   <div class="container" id="post-container">
     <!-- loading index page -->
   </div>
 
</body>

	<!-- Javascript -->
	<%@include file="javascript_page.jsp" %>
	
	
	<!-- loading post using ajax -->
<script> 

 $(document).ready(function(e) {
	 //alert("hiii");
	 
	 $.ajax({
		  
		  url: "load_index.jsp",
		  
		  success: function(data, textStatus,jqXHR)
		  {
			  console.log(data);
			  
			  $('#post-container').html(data);
			  
		  }
		  
	  }) 
 })
	

</script>
	
	
	
</html>