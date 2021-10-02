<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection cond=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String roomid=(String)session.getAttribute("RID");
PreparedStatement psd=cond.prepareStatement("delete from room where roomid='"+roomid+"'");
int rd=psd.executeUpdate();
if(rd!=0){%>
<script type="text/javascript">
  alert("deletion Successfull");
</script>
<%@ include file="RoomAllocation.jsp"%>
<%}
else{%>
<script type="text/javascript">
  alert("deletion not Successfull try again");
</script>
<%@ include file="RoomDetails.html"%>
<%}
%>
