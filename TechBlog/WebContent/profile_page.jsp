<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.entities.User" %>
<%

User user=(User)session.getAttribute("currentUser");
if(user==null)
{
	response.sendRedirect("login_page.jsp");
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<!-- css -->
<%@include file="css_page.jsp" %>
<style type="text/css">

  /*  body{
	
	    background: url(img/bg1.png);
	    background-size: cover;
	    background-attachment: fixed;
	} */
</style>
</head>
<body>

 <!-- navbar -->
   <nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>LearnCode with Surabhi <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-check-square-o"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="programming_lang.jsp">Programming Language</a>
          <a class="dropdown-item" href="project_imp.jsp">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
     <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-sticky-note-o"></span> Do Post</a>
      </li>
      
    </ul>
    
    <ul class="navbar-nav mr-right">
      <li class="nav-item">
        <a class="nav-link" href="!#" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
      </li>
    </ul>
  </div>
</nav>
  
<!-- End Navbar -->

    <!--Alert Message -->
    
      <!-- alert message --> 
                <%
                  Message m=(Message)session.getAttribute("msg");
                  if(m!=null)
                  {
                	  %>
                	  
                	    <div class="alert <%=m.getCssClass() %>" role="alert">
                	      <%= m.getContent() %>
						  
						</div>
                	  
                	  <% 
                	  
                	  session.removeAttribute("msg");
                  }
                
                
                %>
                
    
    <!-- End Alert Message -->
    
    <!-- Main body of the page -->
     
     <main>
       <div class="container">
         <div class="row mt-4">
         
           <!--First col  -->
           <div class="col-md-4">
               <!-- List of categories -->
               <div class="list-group">
				  <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active1">
				    All Posts
				  </a>
				  
				  <!-- Categories -->
				  <%
				       PostDao d = new PostDao(ConnectionProvider.getConnection());
				       ArrayList<Category> list1 = d.getAllCategories();
				       for(Category cc:list1)
				       {
				    	   %>
				    	      <a href="#" onclick="getPosts(<%=cc.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"><%=cc.getName() %></a>
				    	   <% 
				       }
				  %>
				  
				  
				</div>
               
           </div>
           
           <!--Second col  -->
           <div class="col-md-8">
             <!-- Posts -->
             
             <div class="container text-center" id="loader">
               <i class="fa fa-refresh fa-4x fa-spin"></i>
               <h3 class="mt-2">Loading...</h3>
             </div>
             
             <div class="container-fluid" id="post-container">
             </div>
             
           </div>
           
         </div>
       </div>
     </main>
      
    <!-- End Main body of the page -->
		
		
		<!-- Profile Modal -->
		
		<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header primary-background text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="container text-center">
		        <img  src="pics/<%=user.getProfile() %>" class="img-fluid" style="border-radius:50%;max-width:150px">
		           <br>
		          <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h5>
		          
		          <!-- Details table -->
		          
		          <div id="profile-details">
		            <table class="table">
						 <tbody>
						    <tr>
						      <th scope="row">ID</th>
						      <td><%= user.getId() %></td>
						    </tr>
						    <tr>
						     <th scope="row">Email</th>
						      <td><%= user.getEmail() %></td>
						    </tr>
						    <tr>
						     <th scope="row">Gender</th>
						      <td><%= user.getGender() %></td>
						    </tr>
						    <tr>
						     <th scope="row">Status</th>
						      <td><%= user.getAbout() %></td>
						    </tr>
						    <tr>
						     <th scope="row">Register Date</th>
						      <td><%= user.getDateTime().toString() %></td>
						    </tr>
						  </tbody>
					</table>
		          </div>
		          <!-- End Details table -->
		          
		          <!-- profile Edit -->
		          
		          <div id="profile-edit" style="display:none">
		             <h3 class="mt-2">Please Edit carefully</h3>
		             <form action="EditServlet" method="post" enctype="multipart/form-data">
		               <table class="table">
		                 <tr>
		                   <td>ID :</td>
		                   <td><%= user.getId() %></td>
		                 </tr>
		                 <tr>
		                   <td>Email :</td>
		                   <td><input class="form-control" type="email" name="user_email" value="<%= user.getEmail() %>"></td>
		                 </tr>
		                 <tr>
		                   <td>Name :</td>
		                   <td><input class="form-control" type="text" name="user_name" value="<%= user.getName() %>"></td>
		                 </tr>
		                 <tr>
		                   <td>Password :</td>
		                   <td><input class="form-control" type="password" name="user_password" value="<%= user.getPassword() %>"></td>
		                 </tr>
		                 <tr>
		                   <td>Gender :</td>
		                   <td><%= user.getGender().toUpperCase() %></td>
		                 </tr>
		                <tr>
		                   <td>Status :</td>
		                   <td><textarea rows="3" class="form-control" name="user_about"><%= user.getAbout() %></textarea></td>
		                 </tr>
		                 <tr>
		                   <td>New Profile:</td>
		                   <td><input type="file" name="image" class="form-control"/></td>
		                 </tr>
		               </table>
		               
		                <div class="container">
		                  <button type="submit" class="btn btn-outline-primary1">Save</button>
		                </div>
		               
		             </form>
		          </div>
		          
		          <!-- End Profile Edit -->
		          
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button id="edit-profile-button" type="button" class="btn primary-background text-white">Edit</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- End Profile Modal -->
		
		
		
		
		<!-- do post modal -->
		
		
			
			<!-- Modal -->
			<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Provide Post Detail</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      
			        <form action="AddPostServlet" method="post" id="add-post-form">
			              
			              <div class="form-group">
			                <select class="form-control" name="cid">
			                   <option selected disabled>---Select Category---</option>
			                   <%
			                     PostDao postd=new PostDao(ConnectionProvider.getConnection());
			                     ArrayList<Category> list=postd.getAllCategories();
			                     for(Category c:list)
			                     {
			                   %>
			                   <option value="<%=c.getCid()%>"><%=c.getName() %></option>
			                   <%
			                     }
			                   %>
			                </select>
						    
						  </div>
			              
						  <div class="form-group">
						    <input name="pTitle" type="text" class="form-control" placeholder="Enter Post Title">
						  </div>
						  
						  <div class="form-group">
						    <textarea name="pContent" style="height:200px" cols="" class="form-control" placeholder="Enter your content"></textarea>
						  </div>
						  
						  <div class="form-group">
						    <textarea name="pCode" style="height:200px" cols="" class="form-control" placeholder="Enter your programme(if any)"></textarea>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1">Select your pic</label>
						    <input type="file" class="form-control" name="pic">
						  </div>
						  
						  <div class="container text-center">
						   <button type="submit" class="btn primary-background text-white">Submit</button>
						  </div>
					</form>
					
			      </div>
			      
			    </div>
			  </div>
			</div>
		
		<!-- End post modal -->
</body>
<!-- Javascript -->
<%@include file="javascript_page.jsp" %>




<!-- Show the model -->

<script type="text/javascript">
$(document).ready(function() {
	// alert("testing");

	let editStatus = false;
	$('#edit-profile-button').click(function() {
		// alert("hi");

		if (editStatus == false) {
			$('#profile-details').hide();
			$('#profile-edit').show();
			editStatus = true;
			$(this).text("Back");
		} else {

			$('#profile-details').show();
			$('#profile-edit').hide();
			editStatus = false;
			$(this).text("Edit");
		}

	});

});
</script>
<!--End Show the model -->






<!-- Now add Post JS -->

<script type="text/javascript">
  $(document).ready(function(e){
	
	  // alert("loaded..")
	  $('#add-post-form').on("submit",function(event){
		  // this code gets called when form is submitted...
		// alert("loaded..")
		event.preventDefault();
		// console.log("you have submitted form..") ;
		let form = new FormData(this);
		
		// now requesting to server
		
		$.ajax({
			
			url: "AddPostServlet",
			type: 'POST',
			data: form,
			success: function(data, textStatus, jqXHR)
			{
				// success..
				console.log(data);
				if(data.trim()=='done')
					{
					swal("Good job!", "Saved Successfully!", "success")
					.then((value) => {
				  window.location="profile_page.jsp";
				});
					// $("#add-post-modal").hide();
					}
				else
					{
					swal("Error!", "Somthing went wrong try again....!", "error");
					}
			},
			error: function(jqXHR, textStatus, errorThrown )
			{
				// error...
				// console.log("error");
				swal("Error!", "Somthing went wrong try again....!", "error");
			},
			
			processData: false,
			contentType: false
			
		})
	  });
	  
	  
  });

</script>
<!--End Now add Post JS -->


<!-- loading post using ajax -->
<script> 


 function getPosts(cId,temp)
 {
	 //alert("hi ="+cId)
	 $("#loader").show();
	 $('#post-container').hide();
	 $(".c-link").removeClass("active1");
	 $.ajax({
		  
		  url: "load_post.jsp",
		  data: "cId=" +cId,
		  success: function(data, textStatus,jqXHR)
		  {
			  console.log(data);
			  $('#loader').hide();
			  $('#post-container').show();
			  $('#post-container').html(data);
			  $(temp).addClass("active1");
		  }
		  
	  }) 
 }
 
 $(document).ready(function() {
	 
	 let allPostRef=$(".c-link")[0]
	 getPosts(0,allPostRef);
 })

</script>
<!-- End Loading post using ajax -->
</html>