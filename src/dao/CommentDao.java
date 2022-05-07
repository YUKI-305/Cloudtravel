package dao;

import java.sql.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import dao.BaseDao;
import entity.Comment;
import connection.connection;
public class CommentDao {
	public static ArrayList<Comment> showAll(){
		ArrayList<Comment> list = new ArrayList<Comment>();
		connection Factory = new connection();
		Connection conn = Factory.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
        	String sql="select * from comment";
        	ps=conn.prepareStatement(sql);
        	rs = ps.executeQuery();
        	while(rs.next()){
        		Comment comment=new Comment(rs.getInt("number"),
        				rs.getString("username"),
        				rs.getString("content"),
        				rs.getString("time"),
        				rs.getInt("anonymity")
        				);
        		list.add(comment);
        	}
        }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeConnection(conn);
		}
        return list;
	}
	
	public static ArrayList<Comment> selectByNumber(String number){
		ArrayList<Comment> list = new ArrayList<Comment>();
		connection Factory = new connection();
		Connection conn = Factory.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
        	String sql="select * from comment where number = ?";
			System.out.println(sql);
        	ps=conn.prepareStatement(sql);
        	ps.setString(1, number);
        	rs = ps.executeQuery();
        	while(rs.next()){
        		Comment comment=new Comment(rs.getInt("number"),
        				rs.getString("username"),
        				rs.getString("content"),
        				rs.getString("time"),
        				rs.getInt("anonymity")
        				);
        		list.add(comment);
        	}
        }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeConnection(conn);
		}
        return list;
	}
	
	public static ArrayList<Comment> selectByWord(String word){
		//Comment comment=new Comment();
		ArrayList<Comment> list = new ArrayList<Comment>();
		connection Factory = new connection();
		Connection conn = Factory.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
        	String sql="select * from note where title like ? or texts like ?";
        	ps=conn.prepareStatement(sql);
        	ps.setString(1, "%"+word+"%");
        	ps.setString(2, "%"+word+"%");
        	rs = ps.executeQuery();
        	while(rs.next()){
        		Comment comment=new Comment(rs.getInt("number"),
        				rs.getString("username"),
        				rs.getString("content"),
        				rs.getString("time"),
        				rs.getInt("anonymity")
        				);
        		list.add(comment);
        	}
        }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeConnection(conn);
		}
        return list;
	}
	public static void main(String args[]){
		ArrayList<Comment> li=CommentDao.selectByNumber("三亚");
		System.out.println(li.get(0).getTime());
	}
	
}
