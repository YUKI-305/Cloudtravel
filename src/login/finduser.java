package login;

import connection.connection;

import java.sql.*;

public class finduser{

	public user usercheck(String email, String psw) //登录
	{
		connection Factory = new connection();
		Connection con = Factory.getConnection();
		user users = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "select * from user where email=? and password=?";
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);
			System.out.println(ps);
			rs = ps.executeQuery();
			if (rs.next()) {
				String username=rs.getString("username");
				String head=rs.getString("head");
				int id= Integer.parseInt(rs.getString("id"));
				users = new user(username,psw,email,head,id);
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   Factory.closeAll(con, ps, rs);
		}
	  return users;
	}
	
	
	@SuppressWarnings("resource")
	public int signInCheck(String username, String psw,String email) //注册
	{
		
		connection Factory = new connection();
		Connection con = Factory.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "select * from user where email=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (!rs.next()) {
				try{
					String sql2 = "insert into user(username,password,email,head)values(?,?,?,?)";
	            	ps = con.prepareStatement(sql2);
	            	ps.setString(1,username);
	            	ps.setString(2,psw);
	            	ps.setString(3,email);
	            	ps.setString(4,"./image/head.png");
				}catch (SQLException e) {
					e.printStackTrace();
				}
				int row = ps.executeUpdate();
		        if(row>0){
		        	System.out.println(username);
		            System.out.println("成功添加了" + row + "条数据！");
		        }
			}
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   Factory.closeAll(con, ps, rs);
		}
	  return 0;
	}
	
	public static void main(String[] args) {
		finduser check = new finduser();
		user user1=check.usercheck("821617233@qq.com", "123456");
		System.out.print(user1.getUserEmail());
	}

}