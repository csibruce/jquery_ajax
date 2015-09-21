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
	String id = request.getParameter("id");
	//String id = "P10101";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "pc16";
	String pass = "java";
	con = DriverManager.getConnection(url, user, pass);
	
	String sql = "select * from buyer where buyer_id = ?";
	stmt = con.prepareStatement(sql);
	stmt.setString(1, id);
	rs = stmt.executeQuery();
	
%>

{
	"state":"success",
	"data":{
<%
	if(rs.next()){
%>		
			
			"buyer_id"      : "<%=rs.getString("buyer_id") %>"               ,
			"buyer_name"    : "<%=rs.getString("buyer_name") %>"			 ,
			"buyer_lgu"     : "<%=rs.getString("buyer_lgu") %>"				 ,
			"buyer_bank"    : "<%=rs.getString("buyer_bank") %>"			 ,
			"buyer_bankno"  : "<%=rs.getString("buyer_bankno") %>"			 ,
			"buyer_bankname": "<%=rs.getString("buyer_bankname") %>"		 ,
			"buyer_zip"     : "<%=rs.getString("buyer_zip") %>"				 ,
			"buyer_add1"    : "<%=rs.getString("buyer_add1") %>"			 ,
			"buyer_add2"    : "<%=rs.getString("buyer_add2") %>"			 ,
			"buyer_comtel"  : "<%=rs.getString("buyer_comtel") %>"			 ,
			"buyer_fax"     : "<%=rs.getString("buyer_fax") %>"				 ,
			"buyer_mail"    : "<%=rs.getString("buyer_mail") %>"			 ,
			"buyer_charger" : "<%=rs.getString("buyer_charger") %>"				
			}
<%		
}
%>
}
