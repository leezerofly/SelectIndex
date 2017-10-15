package com.vini.dao;

// Use the JDBC driver  
import java.sql.*;  
import com.microsoft.sqlserver.jdbc.*;  

import com.vini.config.SQLDatebase;

    public class SQLDatabaseConnection {  

        // Connect to your database.  
        // Replace server name, username, and password with your credentials  
        public static void main(String[] args) {  
           String connectionString =  
                "jdbc:sqlserver://localhost:1433;"  
                + "database=db_dell;"  
                + "user=sa;"  
                + "password=fly;"  
                //+ "encrypt=true;"  
                //+ "trustServerCertificate=false;"  
               // + "hostNameInCertificate=*.database.windows.net;"  
                + "loginTimeout=30;";  

            // Declare the JDBC objects.  
            Connection connection = null;  

            try {  
                connection = DriverManager.getConnection(connectionString);  
                System.out.println("连接数据库成功");
            }  
            catch (Exception e) {  
                e.printStackTrace();  
            }  
            finally {  
                if (connection != null) try { connection.close(); } catch(Exception e) {}  
            }  
        }  
    }  
