<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "pc16";
	String pass = "java";
	conn = DriverManager.getConnection(url, user, pass);
	
	String sql = "select * from lprod";
	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
	
	while(rs.next()){
	out.println("ID : "+rs.getInt("lprod_id")+"<br>");
	out.println("GU : "+rs.getString("lprod_gu")+"<br>");
	out.println("NM : "+rs.getString("lprod_nm")+"<br>");
	out.println("<hr color=blue>");
	}
	
%>
</body>
</html>