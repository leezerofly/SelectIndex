package com.vini.dao;

// Use the JDBC driver  
import java.sql.*;  
import com.microsoft.sqlserver.jdbc.*;  

public class JDBConnection {  
//	private final String dbDriver="com.mysql.jdbc.Driver";
//	private final String url="jdbc:sqlserver://localhost:1433";
//	private final String dbName="db_dell";
//	private final String userName="sa";
//	private final String password="fly";
	private ResultSet rs=null;
	private Statement stmt=null;
	private Connection con=null;
    String connectionString =  
            "jdbc:sqlserver://localhost:1433;"  
            + "database=db_dell;"  
            + "user=sa;"  
            + "password=fly;"  
            //+ "encrypt=true;"  
            //+ "trustServerCertificate=false;"  
            // + "hostNameInCertificate=*.database.windows.net;"  
            + "loginTimeout=30;";
	
    // Connect to your database.  
    // Replace server name, username, and password with your credentials  
    public JDBConnection() {    
       try {  
    	   con = DriverManager.getConnection(connectionString);
    	   System.out.println("连接数据库成功");
       }  
       catch (Exception e) {  
    	   e.printStackTrace();  
       }  
       finally {  
    	   if (con != null) try { con.close(); } catch(Exception e) {}  
       } 
    }
    
    public boolean createConnection(){
		try{
			con = DriverManager.getConnection(connectionString);
			con.setAutoCommit(true);
			return true;
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	}
    
	public ResultSet executeQuery(String sql){
		try{
			if(null == con){
				createConnection();
			}
			stmt = con.createStatement();
			try{
				rs = stmt.executeQuery(sql);
				return rs;
			}catch(SQLException e){
				System.out.println(e.getMessage());
				return null;
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public boolean executeUpdate(String sql){
		if(null == con){
			createConnection();
		}
		try{
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			return true;
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public void closeResultSet(ResultSet r){
		if(null != r){
			try{
				r.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public void closeConnection(){
		if(null != rs){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(null!=stmt){
			try{
				stmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(null!=con){
			try{
				con.close();
			}catch(SQLException e){
			}finally{
				con=null;
			}
		}
	}
}  
