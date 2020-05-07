<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! something went to wrong.....</title>
<!-- css -->
<%-- <%@include file="css_page.jsp" %> --%>
</head>
<body>
 <div class="container text-center">
   <img alt="error_image" src="img/error.png" class="img-fluid">
   <h3 class="display-3">Sorry ! Something went wrong....</h3>
   <%= exception %>
   <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
 </div>

</body>
</html>

