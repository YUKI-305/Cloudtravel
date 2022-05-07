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

	public Connection getConnection()//�����������ݿ�
	{
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(url,user,password);
			if(!con.isClosed())
				System.out.println("���ݿ����ӳɹ���");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("1���ݿ����ӳɹ���");
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("2���ݿ����ӳɹ���");
		}

		return con;
	}

	public boolean executeUpdate(String sql) {//�������ݿ�
		int result = 0;
		if (con == null) {
			getConnection();
		}
		try {
			Statement stmt = con.createStatement();
			result = stmt.executeUpdate(sql);//ִ�еĽ����
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
		// �����������Ϊ�գ���ر�
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// ��Statement����Ϊ�գ���ر�
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// �����ݿ����Ӷ���Ϊ�գ���ر�
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
