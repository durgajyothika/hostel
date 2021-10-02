<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String uname=request.getParameter("uname");
String pass=request.getParameter("pwd");
if(uname.startsWith("s")){
  session.setAttribute("sid",uname);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from student where sid='"+uname+"' and password='"+pass+"'");
if(rs.next()){%>
  <jsp:forward page="FeePay.jsp"></jsp:forward>
<%}

else{%>

  <h1 style="color: red;text-align:center;position:absolute;top:100px;left:620px;">Login Failure </h1>
  <%@ include file="home.html"%>
<%}
}
else{
  Statement st1=con1.createStatement();
  ResultSet rs1=st1.executeQuery("select * from employee where empid='"+uname+"' and password='"+pass+"'");
  session.setAttribute("empid",uname);
  if(rs1.next()){%>
    <jsp:forward page="employee.jsp"></jsp:forward>
  <%}
else{%>
  <h1 style="text-align:center;">Enter a valid details</h1>
  <%@ include file="login.html"%>
<%}
}
%>
