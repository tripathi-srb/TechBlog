<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<%

   PostDao d = new PostDao(ConnectionProvider.getConnection());
   List<Post> posts=d.getAllPostsUsingLimit();
   for(Post p : posts)
   {
%>
    <div class="col-md-4 mb-4">
    
      <div class="card">
			  <div class="card-body">
			    <h5 class="card-title"><%=p.getpTitle() %></h5>
			    <p class="card-text" style="height: 110px;overflow:hidden"><%=p.getpContent() %></p>
			    <a href="show_blog_page.jsp?post_id=<%=p.getpId() %>" class="btn primary-background text-white">Read more</a>
			  </div>
          </div>
    
    </div>


<%
   }
%>
</div>

  
   
   
    
   