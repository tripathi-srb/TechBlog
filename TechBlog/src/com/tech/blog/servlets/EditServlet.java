package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//fetch all data
		String userEmail=request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userPassword=request.getParameter("user_password");
		String userAbout=request.getParameter("user_about");
		
		//for image
		Part part=request.getPart("image");
		String imageName=part.getSubmittedFileName();
		
		//get the user from the session
		
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile=user.getProfile();
		user.setProfile(imageName);
		
		
		
		//update database....
		UserDao userDao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=userDao.updateUser(user);
		if(ans)
		{
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			System.out.println(path +"= path.....................................");
			
			if(!oldFile.equals("default.png"))
			{
				//System.out.println("hii");
			    //delete code
			    String pathOldFile=request.getRealPath("/")+"pics"+File.separator+oldFile;
			    Helper.deleteFile(pathOldFile);
			    
			}  
			   //save code
				if(Helper.saveFile(part.getInputStream(), path))
				{
					Message msg=new Message("Profile updated....", "success", "alert-success");
					s.setAttribute("msg", msg);
					
					//out.println("profile updated....");
				}
				else
				{
					Message msg=new Message("Somthing Went Wrong....", "error", "alert-danger");
					s.setAttribute("msg", msg);
					//out.println("profile not updated....");
				}
			
			
		}
		else
		{
			Message msg=new Message("Somthing Went Wrong....", "error", "alert-danger");
			s.setAttribute("msg", msg);
		//out.println("Not updated");
		}
		
		response.sendRedirect("profile_page.jsp");
	}

}



	