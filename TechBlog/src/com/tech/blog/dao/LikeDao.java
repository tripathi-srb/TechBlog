package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {
	
	Connection con;
	
	public LikeDao(Connection con)
	{
		this.con = con;
	}
	
	//insert like
	public boolean insertLike(int pid,int uid)
	{
		boolean f = false;
		try {
			
			String q = "insert into likes (pid,uid)values(?,?)";
			PreparedStatement ps =this.con.prepareStatement(q);
			
			//value set....
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	//count like on post
	public int countLikeOnPost(int pid)
	{
		int count = 0;
		
		try {

			String q="select count(*) from likes where pid=?";
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, pid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				count=rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
		
	}

    
	
	//get know user is liked or not
	public boolean isLikedByUser(int pid,int uid)
	{
		boolean f=false;
		
		try {
			PreparedStatement p=this.con.prepareStatement("select * from likes where pid=? AND uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet rs=p.executeQuery();
			if(rs.next())
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	//dislike 
	public boolean deleteLike(int pid,int uid)
	{
		boolean f=false;
		try {
			
			PreparedStatement p=this.con.prepareStatement("delete from likes where pid=? AND uid=? ");
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
}
