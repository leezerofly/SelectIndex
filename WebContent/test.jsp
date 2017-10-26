<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
        String DBDRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String DBURL="jdbc:jtds:sqlserver://localhost:1433/DB_DELL";
        String DBUSER="sa";
        String PASSWORD="fly";
        try{
        Class.forName(DBDRIVER);
        Connection cn=DriverManager.getConnection(DBURL,DBUSER,PASSWORD);
        Statement st=cn.createStatement();
        String sql="SELECT user_id,user_name,user_passwd from 表名";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next()){
            String sno=rs.getString("user_id");
            String sname=rs.getString("user_name");
            String passwd=rs.getString("user_passwd");
            //java.sql.Date birthday=rs.getDate("字段四");
            //String sd=rs.getString("字段5");
            out.print(sno+","+sname+","+passwd+"<br>");
            
        }
        rs.close();//关闭结果集
        cn.close();//关闭操作
        }
        catch(Exception ex){
        System.out.println(ex.getMessage());
        System.out.println("连接异常");
        ex.printStackTrace();
        }

     %>
    
</body>
</html>