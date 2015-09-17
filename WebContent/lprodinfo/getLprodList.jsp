<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
%>
<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "pc16";
	String pass = "java";
	conn = DriverManager.getConnection(url, user, pass);
	
	String sql = "select * from lprod";
	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
	}catch(SQLException e){
		e.printStackTrace();
	}
		
%> 

	{
		"state" : "success",
		"data" : [
		
		
<%
	while(rs.next()){	
		if(rs.getRow()>1) out.println(",");
%>


			{
			"lprod_id":"<%=rs.getInt("lprod_id") %>",
			"lprod_gu":"<%=rs.getString("lprod_gu") %>",
			"lprod_nm":"<%=rs.getString("lprod_nm") %>"
			}


<%
	}
%>
]
}