<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection con;
	PreparedStatement stmt;
	ResultSet rs;
%>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "pc16";
	String pass = "java";
	con = DriverManager.getConnection(url, user, pass);
	
	String sql = "select buyer_id, buyer_name from buyer";
	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
%>

{
	"state":"success",
	"data":[
<%
	while(rs.next()){
		if(rs.getRow()>1) out.println(",");
%>		
			{
			"buyer_id":"<%=rs.getString("buyer_id") %>",
			"buyer_name":"<%=rs.getString("buyer_name") %>"
			}
<%		
	}
%>
]}