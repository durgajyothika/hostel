<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String roomid=request.getParameter("roomid");
String rtype=request.getParameter("RoomType");
PreparedStatement ps=con.prepareStatement("insert into room values(?,?)");
ps.setString(1,roomid);
ps.setString(2,rtype);
int r=ps.executeUpdate();
if(r!=0){%>
<script type="text/javascript">
  alert("insertion Successfull")
</script>
  <%@ include file="RoomDetails.html"%>
<%}
else{%>
  <script type="text/javascript">
    alert("insertion failure Ty again");
  </script>
  <%@ include file="RoomDetails.html"%>
<%}
%>
