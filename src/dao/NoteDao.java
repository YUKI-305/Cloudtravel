package dao;

import java.sql.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import connection.connection;
import dao.BaseDao;
import entity.Note;

public class NoteDao {
	public static ArrayList<Note> showAll(){
		ArrayList<Note> list = new ArrayList<Note>();
		connection Factory = new connection();
		Connection conn = Factory.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
        	String sql="select * from note";
        	ps=conn.prepareStatement(sql);
        	rs = ps.executeQuery();
        	//DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        	while(rs.next()){
        		Note note=new Note(rs.getInt("number"),
        				rs.getString("name"),
        				rs.getString("title"),
        				rs.getString("texts"),
        				//dateFormat.format(rs.getDate("time")),
        				rs.getString("time"),
        				rs.getString("src"),
        				rs.getInt("llike"),
        				rs.getInt("collect")
        				);
        		list.add(note);
        	}
        }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeConnection(conn);
		}
        return list;
	}
	
	public static ArrayList<Note> selectByNumber(String number){
		ArrayList<Note> list = new ArrayList<Note>();
		connection Factory = new connection();
		Connection conn = Factory.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
        	String sql="select * from note where number = ?";
        	ps=conn.prepareStatement(sql);
        	ps.setString(1, number);
        	rs = ps.executeQuery();
        	while(rs.next()){
        		Note note=new Note(rs.getInt("number"),
        				rs.getString("name"),
        				rs.getString("title"),
        				rs.getString("texts"),
        				rs.getString("time"),
        				rs.getString("src"),
        				rs.getInt("llike"),
        				rs.getInt("collect")
        				);
        		list.add(note);
        	}
        }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeConnection(conn);
		}
        return list;
	}
	
	public static ArrayList<Note> selectByWord(String word){
		ArrayList<Note> list = new ArrayList<Note>();
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
        		Note note=new Note(rs.getInt("number"),
        				rs.getString("name"),
        				rs.getString("title"),
        				rs.getString("texts"),
        				rs.getString("time"),
        				rs.getString("src"),
        				rs.getInt("llike"),
        				rs.getInt("collect")
        				);
        		list.add(note);
        	}
        }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeConnection(conn);
		}
        return list;
	}
	public static int insertNote(Note note){
		connection Factory = new connection();
		Connection conn = Factory.getConnection();
        PreparedStatement ps = null;
        int flag=0;
		try{
        	String sql="insert into note(name,title,texts,time,src,llike,collect) values (?, ?, ?, ?, ?, 0,0)";
        	ps=conn.prepareStatement(sql);
        	ps.setString(1, "NEU");
        	ps.setString(2, note.getTitle());
        	ps.setString(3, note.getTexts());
        	ps.setString(4, note.getTime());
        	ps.setString(5, note.getSrc());
        	flag=ps.executeUpdate();
        }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			BaseDao.closeConnection(conn);
		}
		return flag;
	}
//	public static void main(String args[]){
//		Note note = new Note(
//				0,
//				"NEU",
//				"hah",	
//				"777",	
//				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")),
//    	        "",	
//    	        0,0
//				);
//		int f=insertNote(note);
//		if(f==0){
//			System.out.println("插入失败");
//		}
//		else{
//			System.out.println("插入成功");
//		}		
//	}
}
