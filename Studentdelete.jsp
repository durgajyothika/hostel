<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection cond=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String u=(String)session.getAttribute("Username");
PreparedStatement psd=cond.prepareStatement("delete from student where sid='"+u+"'");
int rd=psd.executeUpdate();
if(rd!=0){%>
<script type="text/javascript">
  alert("deletion Successfull");
</script>
<%@ include file="StudentDetails.jsp"%>
<%}
else{%>
<script type="text/javascript">
  alert("deletion not Successfull try again");
</script>
<%@ include file="StudentDetails.jsp"%>
<%}
%>
