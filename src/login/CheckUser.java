package login;

import connection.connection;

import java.sql.*;

public class CheckUser{
	public void changePic(int u_id, String url_pic)//修改头像
	{
		connection Factory = new connection();
		Connection con = Factory.getConnection();
		PreparedStatement ps = null;
		try {
			String sql = "UPDATE user Set head=? where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, url_pic);
			ps.setInt(2, u_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Factory.closeAll(con, ps, null);
		}
	}

	public void addToWishList(int u_id, int p_id,int pt_id)
	{
		connection Factory = new connection();
		Connection con = Factory.getConnection();
		PreparedStatement ps = null;
		try {
			String sql2 = "insert into wishlist(w_userid,w_productid,w_typeid)values(?,?,?)";
	        ps = con.prepareStatement(sql2);
	        ps.setInt(1,u_id);
	        ps.setInt(2,p_id);
	        ps.setInt(3,pt_id);
	        ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Factory.closeAll(con, ps, null);
		}
	}
	public void addToCart(int u_id, int p_id,int pt_id)
	{
		connection Factory = new connection();
		Connection con = Factory.getConnection();
		PreparedStatement ps = null;
		try {
			String sql2 = "insert into cart(c_userid,c_productid,c_typeid)values(?,?,?)";
			ps = con.prepareStatement(sql2);
			ps.setInt(1,u_id);
			ps.setInt(2,p_id);
			ps.setInt(3,pt_id);
			System.out.println(ps);
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Factory.closeAll(con, ps, null);
		}
	}
	
	public static void main(String[] args) {
		CheckUser check = new CheckUser();
		check.addToCart(3,4,5);
	}

}
