<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	



%>