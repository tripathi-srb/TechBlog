package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	
	private Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}
	
	//fetch category
	public ArrayList<Category> getAllCategories()
	{
		ArrayList<Category> list=new ArrayList<>();
		
		try {
			
			String q = "select * from categories";
			Statement st=this.con.createStatement();
			ResultSet rs=st.executeQuery(q);
			while(rs.next())
			{
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				
				Category c = new Category(cid, name, description);
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	
	//save post
	public boolean savePost(Post p)
	{
		boolean f = false;
		try {
			
			String q="insert into posts(pTitle,pContent,pCode,pPic,cID,userId) values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
            ps.setString(4, p.getpPic());
            ps.setInt(5, p.getcId());
            ps.setInt(6, p.getUserId());
			
			ps.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

    
	
	//get all the posts
	
	public List<Post> getAllPosts()
	{
		List<Post> list = new ArrayList();
		
		//fetch all the post
		try {
			
			PreparedStatement ps = con.prepareStatement("select * from posts order by pID desc");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				int pId=rs.getInt("pID");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String pCode=rs.getString("pCode");
				String pPic=rs.getString("pPic");
				Timestamp pDate=rs.getTimestamp("pDate");
				int cId=rs.getInt("cID");
				int userId=rs.getInt("userId");
				
				Post post=new Post(pId, pTitle, pContent, pCode, pPic, pDate, cId, userId);
				list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	//get the posts based on category id
	public List<Post> getPostByCatId(int cid)
	{
        List<Post> list = new ArrayList();
		
		//fetch all the post based on category id
      
      		try {
      			
      			PreparedStatement ps = con.prepareStatement("select * from posts where cID=?");
      			ps.setInt(1, cid);
      			ResultSet rs=ps.executeQuery();
      			while(rs.next())
      			{
      				int pId=rs.getInt("pID");
      				String pTitle=rs.getString("pTitle");
      				String pContent=rs.getString("pContent");
      				String pCode=rs.getString("pCode");
      				String pPic=rs.getString("pPic");
      				Timestamp pDate=rs.getTimestamp("pDate");
      				int userId=rs.getInt("userId");
      				
      				Post post=new Post(pId, pTitle, pContent, pCode, pPic, pDate,cid, userId);
      				list.add(post);
      			}
      			
      		} catch (Exception e) {
      			e.printStackTrace();
      		}
        
		
		return list;
	}

	
	// get the posts based on p
	public Post getPostByPostId(int postId) 
	{
		Post post = null;
		String q="select * from posts where pID=? ";
		try {
			
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, postId);
	      	ResultSet rs = p.executeQuery();
	      	
	      	if(rs.next())
	      	{
	      		int pId=rs.getInt("pID");
  				String pTitle=rs.getString("pTitle");
  				String pContent=rs.getString("pContent");
  				String pCode=rs.getString("pCode");
  				String pPic=rs.getString("pPic");
  				Timestamp pDate=rs.getTimestamp("pDate");
  				int userId=rs.getInt("userId");
  				int cid=rs.getInt("cID");
  				post=new Post(pId, pTitle, pContent, pCode, pPic, pDate,cid, userId);
  				
	      		
	      	}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
		
	}



	//get all the posts using limit
	
	public List<Post> getAllPostsUsingLimit()
	{
		List<Post> list = new ArrayList();
		
		//fetch all the post
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * FROM posts ORDER BY pID LIMIT 0, 6");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				int pId=rs.getInt("pID");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String pCode=rs.getString("pCode");
				String pPic=rs.getString("pPic");
				Timestamp pDate=rs.getTimestamp("pDate");
				int cId=rs.getInt("cID");
				int userId=rs.getInt("userId");
				
				Post post=new Post(pId, pTitle, pContent, pCode, pPic, pDate, cId, userId);
				list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}








}     