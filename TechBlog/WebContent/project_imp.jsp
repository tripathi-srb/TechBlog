<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Implementation</title>

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
             <h4 class="post-title">Project Implementation</h4>
           </div>
           
           <div class="card-body">
             <img src="img/pro_imp.png" class="card-img-top my-2" alt="Card image cap">
             
            <hr>
             
             <p class="post-content">
                   A project implementation plan is essentially a blueprint for project success. 
                   It is a plan setup to ensure the successful implementation of a project.
                    Project implementation plans are created to ensure projects are completed on time and on budget,
                     and then implemented correctly.
             </p>
             <br>
                 
                   

				<h5 class="post-title-heading">Project Implementation Planning</h5>
				<p class="post-content">Project managers who manage new implementations use project plans to document the project's tasks, the responsibility for each task and associated target dates and task dependencies on each other.
				 PMs use this document to gain awareness of what tasks need to be accomplished and the status of the project at any given time.
				  They are often responsible for the overall implementation and providing project status communication to stakeholders and team members.
				   This article will cover an implementation plan example explaining which components are necessary to ensure the success of your project.</p>
				<br>
				<h5 class="post-title-heading">Implementation Project Plan Structure</h5>
				<p class="post-content">The implementation project plan is a grid made up of columns and rows. 
				Each column represents a different area of information and each row lists the tasks or section header.</p>
				<br>
				<h5 class="post-title-heading">
                An example of a project implementation plan may have the following columns:</h5>
                <h5 class="post-title-heading">Task - </h5>
                <p class="post-content">list of project tasks</p>
                
                <h5 class="post-title-heading">Percentage Completed - </h5>
                 <p class="post-content">lists the percentage of each task completed</p>
                <h5 class="post-title-heading">Status - </h5>
                <p class="post-content">task status such as: completed, on schedule, behind schedule, cancelled</p>
                
               <h5 class="post-title-heading"> Day Started - </h5>
                <p class="post-content">date task begun</p>
                <h5 class="post-title-heading">Day to Be Complete - </h5>
                 <p class="post-content">estimated date of task completion</p>
               <h5 class="post-title-heading">Actual Completion Date - </h5>
                <p class="post-content">date task was completed</p>
               <h5 class="post-title-heading">Task Assignment - </h5>
                <p class="post-content">Name of task owner</p>
                <h5 class="post-title-heading">Priority - </h5>
                 <p class="post-content">task priority such as High, Medium or Low</p>
                <h5 class="post-title-heading">Milestone - </h5>
                 <p class="post-content">Yes or No to indicate if this is a milestone task</p>
                  <p class="post-content">Notes</p>
				
				
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