package com.vini.servlet;

import java.sql.*;  
import com.microsoft.sqlserver.jdbc.*; 

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vini.dao.JDBConnection;

import com.vini.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType ( "text/html" ) ; 
        
        String message="";
		boolean isRight=false;
        
        // get username  
        String getUserName = request.getParameter("userName") ;   
        // get password  
        String getPasswd = request.getParameter("userPasswd") ;    
        
        //test  
        //System.out.println("username:"+sUserName+"\r\n"+"password:"+sPasswd);  
        
        request.getSession().setAttribute ( "UserName" , getUserName ) ;   
        request.getSession().setAttribute("password", getPasswd); 
        
        User user=new User();
        
        if(getUserName.equals("")||getPasswd.equals(""))
			message="用户名或密码不能为空";
		else{
			JDBConnection con=new JDBConnection();
			if(con.createConnection()){
				String sql="SELECT * FROM user_info WHERE user_name='"+getUserName+"';";
				ResultSet rs=con.executeQuery(sql);
				
		        if(rs != null ) {
		        	try{
						if(rs.next()){
							user.setUsername(rs.getString("user_name"));
							user.setPassword(rs.getString("user_passwd"));
							
							if(getPasswd.equals(user.getPassword())) {
								isRight = true;
							}
							else {
								System.out.println("密码错误！");
							}
						}
						else
							message="没有该登录名";
					}catch(SQLException e){e.printStackTrace();}
		        }
		        else
		        	message="没有该登录名";		     
			}
		}
		
		if(isRight){
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else{
			request.setAttribute("loginfail", message);
			request.getRequestDispatcher("loginFail.jsp").forward(request, response);
		}
	}

}
