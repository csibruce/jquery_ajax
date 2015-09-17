<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>









<%
	String name = request.getParameter("name");
	String gg = request.getParameter("gg");
	int g = Integer.parseInt(gg);
	String ee = request.getParameter("ee");
	int e = Integer.parseInt(ee);
	String mm = request.getParameter("mm");
	int m = Integer.parseInt(mm);
	String cc = request.getParameter("cc");
	int c = Integer.parseInt(cc);
	int total = g+e+m+c;
	double pp = total/4;
%>
이름:<%=name %><br>
국어:<%=gg %><br>
영어:<%=ee %><br>
수학:<%=mm %><br>
컴퓨터:<%=cc %><br>
총점:<%=total %><br>
평균:<%=pp%><br>