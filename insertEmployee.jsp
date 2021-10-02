<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");

String ename=request.getParameter("ename");
String job=request.getParameter("job");
String pass=request.getParameter("pwd");
String phoneno=request.getParameter("phoneno");
Statement stt=conn.createStatement();
String EMPID_SEQ="";
String empid="";
ResultSet rss=stt.executeQuery("select EMPID_SEQ.NEXTVAL from dual");
if(rss.next()){
  EMPID_SEQ=rss.getString(1);
  empid="emp"+EMPID_SEQ;
}
else{
  out.println("something wrong");
}
PreparedStatement pss=conn1.prepareStatement("insert into employee values(?,?,?,?,?) ");
pss.setString(1,empid);
pss.setString(2,ename);
pss.setString(3,job);
pss.setString(4,pass);
pss.setString(5,phoneno);
int rn=pss.executeUpdate();
if(rn!=0){%>
<script type="text/javascript">
  alert("Insertion Successfull ");
</script>
<%@ include file="employee.jsp"%>
<%}
else{%>
  <script type="text/javascript">
    alert("not Successfull ty again");
  </script>
  <%@ include file="employee.jsp"%>
<%}
%>
