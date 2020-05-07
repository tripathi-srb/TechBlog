<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<%
    //fetch user
    User user=(User)session.getAttribute("currentUser");


      Thread.sleep(1000); //for 1second sleeping(after 1 sc wait )
      PostDao d = new PostDao(ConnectionProvider.getConnection());
      
      int cid=Integer.parseInt(request.getParameter("cId"));
      List<Post> posts=null;
      
       if(cid==0)
      { 
    	  posts=d.getAllPosts();
      }
      else
      {
    	  posts=d.getPostByCatId(cid);  
      }
      
      if(posts.size()==0)
      {
    	  out.println("<h3 class='display-3 text-center'>No post in this category...</h3>");
    	  return;
      }
      for(Post p:posts)
      {
     %>
    	 <div class="col-md-6 mt-2">
    	   <div class="card">
    	      <img src="blog_pics/<%=p.getpPic() %>" class="card-img-top" alt="Card image cap">
    	      <div class="card-body">
    	         <b><%=p.getpTitle() %></b>
    	         <p><%=p.getpContent() %></p>
    	         <%-- <pre><%=p.getpCode() %></pre> --%>
    	         
    	      </div>
    	      
    	       <%
              LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
           
           %>
    	      
    	      <div class="card-footer primary-background text-center">
    	       <a href="#!" onclick="doLike(<%=p.getpId() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getpId()) %></span></a>
    	        <a href="show_blog_page.jsp?post_id=<%=p.getpId() %>" class="btn btn-outline-light btn-sm">Read More...</a>
    	        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
    	      </div>
    	   
    	   </div>
    	 
    	 </div> 
    	  
    	  
    	  
    <%
      }


%>
</div>