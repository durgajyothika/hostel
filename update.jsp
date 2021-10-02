<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conu=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String empid=request.getParameter("empid");
String ename=request.getParameter("ename");
String job=request.getParameter("job");
String pass=request.getParameter("pwd");
String phoneno=request.getParameter("Phoneno");
PreparedStatement psu=conu.prepareStatement("update employee set empid=?,ename=?,designation=?,password=?,phoneno=? where empid=?");
psu.setString(1,empid);
psu.setString(2,ename);
psu.setString(3,job);
psu.setString(4,pass);
psu.setString(5,phoneno);
psu.setString(6,empid);
int ruu=psu.executeUpdate();
if(ruu!=0){%>
  <script type="text/javascript">
    alert("updation Successfull");
  </script>
  <%@ include file="employee.jsp"%>
<%}
else{%>
  <script type="text/javascript">
    alert("updation Not Successfull Try again");
  </script>
  <%@ include file="employee.jsp"%>
<%}
%>
