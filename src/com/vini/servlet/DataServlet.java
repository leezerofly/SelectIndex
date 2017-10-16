package com.vini.servlet;

import java.sql.*;  
import com.microsoft.sqlserver.jdbc.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vini.dao.JDBConnection;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import com.vini.servlet.CreateJsonServlet;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataServlet() {
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
	 * @return 
	 * @return 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.setContentType ( "text/html;charset=UTF-8" ) ;
		
		JDBConnection con=new JDBConnection();
		if(con.createConnection()) {
			try {  
	        	String sql = "SELECT * FROM project;";
	        	ResultSet rs=con.executeQuery(sql); 
	  
	            JsonObject object = new JsonObject();  
	            JsonArray array = new JsonArray();  
	            
	            if(rs != null ) {
	            	while (rs.next()) {  
	            		  
	                    JsonObject ob = new JsonObject();  
	      
	                    ob.addProperty("id", rs.getInt("id"));  
	                    ob.addProperty("projectNo", rs.getString("project_no"));  
	                    ob.addProperty("projectName", rs.getString("project_name"));  
	                    ob.addProperty("projectProvince", rs.getString("project_province"));  
	                    ob.addProperty("projectCity", rs.getString("project_city"));  
	                    ob.addProperty("projectArea", rs.getString("project_area"));
	                    ob.addProperty("cityLevel", rs.getString("city_level"));
	                    ob.addProperty("trareType", rs.getInt("trare_type"));
	                    ob.addProperty("bidUnit", rs.getString("bid_unit"));
	                    ob.addProperty("bidConcatTel", rs.getString("bid_concat_tel"));
	                    ob.addProperty("fixBidDate", rs.getString("fix_bid_date"));
	                    ob.addProperty("widbidAmount", rs.getString("widbid_amount"));
	                    ob.addProperty("widbidConcatTel", rs.getString("widbid_concat_tel"));
	                    ob.addProperty("widbidProduct", rs.getString("widbid_product"));
	                    
	                    array.add(ob);  
	      
	                }  
	            	
	            	PrintWriter out = response.getWriter();
	                object.add("rows", array);  
	                out.print(object.toString()); 
	                
	                CreateJsonServlet cre = new CreateJsonServlet();
	                cre.createJsonFile(object.toString(),"/workspace/Eclipse/SelectIndex/WebContent","dbData");
	            }else {
	            	System.out.print("≤È—Ø ß∞‹");
	            }
	  
	        } catch (Exception e) {  
	        	e.printStackTrace();
	        	 System.out.print("you are wrong");
	        } finally {  
	            try {  
	                con.closeConnection();  
	            } catch (Exception e) {  
	            }   
	        }  

		}
   	
	}
}
