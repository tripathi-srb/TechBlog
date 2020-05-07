<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Programming Language</title>

<!-- css -->
<%@include file="css_page.jsp" %>
<style>

	 .post-title
	{
		font-weight: 100;
		font-size: 30px;
	}
	 .post-title-heading
	{
		font-weight: 100;
		font-size: 25px;
	}
	
	.post-content
	{
		font-weight: 100;
		font-size: 20px;
	}
	
	.post-code
	{
		font-weight: 100;
	}
	.post-date
	{
	    font-style: italic;
	    font-weight: bold;
	}
	.post-user-info
	{
	    font-size: 17px;
	    font-weight: 300;
	}
	.row-user
	{
	    border: 1px solid #e2e2e2;
	    padding-top: 15px;
	}
	/* body{
	
	    background: url(img/bg1.png);
	    background-size: cover;
	    background-attachment: fixed;
	} */
</style>


</head>
<body>
<!-- profile navbar -->
   <%@include file="normal_navbar.jsp" %>
<!-- End Profile navbar -->

<!-- Main content of body -->

   <div class="container">
     <div class="row my-4">
       <div class="col-md-8 offset-md-2">
         <div class="card">
         
           <div class="card-header primary-background text-white">
             <h4 class="post-title">Pogramming Language</h4>
           </div>
           
           <div class="card-body">
             <img src="img/pro-img1.jpg" class="card-img-top my-2" alt="Card image cap">
             
            <hr>
             
             <p class="post-content">
                   Nowadays, there are numerous programming languages are becoming more general and all-purpose, 
                   but these languages have their specialties, and each language has its own advantages and disadvantages. 
                   Usually, programming languages can be classified into a few types, however, these languages support multiple programming style. 
                   Every year there are a number of programming languages are implemented, 
                   but few languages are becoming very popular which may used by a professional programmer in their career.
             </p>
             <br>
             <p class="post-content"> There's a more broad categorization:</p>     
                   

				<h5 class="post-title-heading">Functional Languages</h5>
				<p class="post-content">Lisp, Miranda, Gopher, Haskell. Bits of JavaScript
				A functional language defines every program as 1 function.</p>
				
				<h5 class="post-title-heading">Procedural Languages</h5>
				<p class="post-content">These are the most well known, like C, Pascal, C++, Basic, Java.
				All of these have multiple statements that are executed in order.
				A subset of these are Object Oriented, which means they work with classes and objects.</p>
				
				<h5 class="post-title-heading">Declarative Languages</h5>
				<p class="post-content">SQL is the most obvious example. Or Prolog.
				In these you define the output of you wish to receive and an internal 'engine' figures out how this can be achieved best. These languages are less general purpose, but very powerful in their field.
				
				In any of these languages you can have dynamic or static typing, and they can be either interpreted or compiled.</p>
             
             <br>
             <br>
             <div class="post-code">
             <!-- <pre>no</pre> -->
             </div>
           </div>
          
           
           
          
       </div>
     </div>
   </div>
<!-- End of Main content of body -->


</div>
</body>

<!-- Javascript -->
	<%@include file="javascript_page.jsp" %>	
		
		
<!--End Now add Post JS -->
</html>