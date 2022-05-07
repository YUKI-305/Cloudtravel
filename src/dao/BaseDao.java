package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDao {
    private static Connection conn =null;
    //连接数据库
    public static Connection getConnection(){  
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");  
            conn = DriverManager.getConnection(//创建数据库连接
                    "jdbc:mysql://localhost:3306/db", "root", "123456");
            System.out.println("数据库连接正常");
        } catch (Exception e) {  
            System.out.println("数据库连接异常");
            e.printStackTrace();  
        }  
        return conn;  
    }  
    public static void closeConnection(Connection connection){   
        if(connection != null){  
            try {  
            	connection.close(); // 关闭数据库连接
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}
