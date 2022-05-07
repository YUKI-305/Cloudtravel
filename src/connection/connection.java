package connection;

import java.sql.*;

public class connection {

	private final static String dbDriver="com.mysql.cj.jdbc.Driver";
	private final String url="jdbc:mysql://localhost/db?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC&useSSL=false";
	private final String user="root";
	private final String password="123456";
	protected Connection con=null;
	protected Statement stmt;
	protected ResultSet rs;

	public Connection getConnection()//请求连接数据库
	{
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(url,user,password);
			if(!con.isClosed())
				System.out.println("数据库连接成功！");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("1数据库连接成功！");
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("2数据库连接成功！");
		}

		return con;
	}

	public boolean executeUpdate(String sql) {//更新数据库
		int result = 0;
		if (con == null) {
			getConnection();
		}
		try {
			Statement stmt = con.createStatement();
			result = stmt.executeUpdate(sql);//执行的结果集
			if (result > 0)
				return true;
			else
				return false;
		} catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("executeUpdateerror!");
			return false;
		}

	}

	public ResultSet executeQuery(String sql) {
		try {
			if (con == null)
				getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			try {
				rs = stmt.executeQuery(sql);
			} catch (SQLException e) {
				System.out.print(e.getMessage());
				e.printStackTrace();
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
			System.out.print("exceuteQueryerrot");
		}
		return rs;
	}

	public void closeAll(Connection conn, Statement stmt, ResultSet rs) {
		// 若结果集对象不为空，则关闭
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 若Statement对象不为空，则关闭
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 若数据库连接对象不为空，则关闭
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
