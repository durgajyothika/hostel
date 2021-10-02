<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection cond=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String u=(String)session.getAttribute("fidu");
PreparedStatement psd=cond.prepareStatement("delete from furniture where furnitureid='"+u+"'");
int rd=psd.executeUpdate();
if(rd!=0){%>
<script type="text/javascript">
  alert("deletion Successfull");
</script>
<%@ include file="FurnitureDetails.jsp"%>
<%}
else{%>
<script type="text/javascript">
  alert("deletion not Successfull try again");
</script>
<%@ include file="FurnitureDetails.jsp"%>
<%}
%>
