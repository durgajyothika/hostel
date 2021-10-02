<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conu=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String fid=request.getParameter("fid");
String rid=request.getParameter("rid");
PreparedStatement psu=conu.prepareStatement("update furniture set roomid=?,furnitureid=? where furnitureid=?");
psu.setString(1,rid);
psu.setString(2,fid);
psu.setString(3,fid);
int ru=psu.executeUpdate();
if(ru!=0){%>
  <script type="text/javascript">
    alert("updation Successfull");
  </script>
  <%@ include file="FurnitureDetails.jsp"%>
<%}
else{%>
  <script type="text/javascript">
    alert("updation not Successfull try again");
  </script>
  <%@ include file="FurnitureDetails.jsp"%>
  <%
}
%>
