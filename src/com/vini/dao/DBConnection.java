package com.vini.dao;

import java.sql.*;
import com.microsoft.sqlserver.jdbc.*;

public class DBConnection {

	 public static void main(String [] args)
	 {
	  String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	  String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=db_dell";
	  String userName="sa";
	  String userPwd="fly";
	  try
	  {
	   Class.forName(driverName);
	   Connection dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
	    System.out.println("连接数据库成功");
	  }
	  catch(Exception e)
	  {
	   e.printStackTrace();
	   System.out.print("连接失败");
	  }    
	 }
}
