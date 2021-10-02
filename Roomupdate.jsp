<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conu=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conu1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conu2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String rid=request.getParameter("rid");
String rtype=request.getParameter("rtype");
String Capacity=request.getParameter("Capacity");
String status=request.getParameter("status");
int count=0;
String success="";
String success1="";
Statement str1=conu1.createStatement();
ResultSet rsr1=str1.executeQuery("select sid from roomdetails where roomid='"+rid+"'");
Statement str2=conu1.createStatement();
ResultSet rsr2=str2.executeQuery("select count(sid) from roomdetails where roomid='"+rid+"'");
if(rsr2.next()){
 count=rsr2.getInt(1);
}
int j=0;
String[] sid_table=new String[count];
while(rsr1.next()&&j<count){
  sid_table[j]=rsr1.getString(1);
  j++;
}
String sid[]=request.getParameterValues("sid");

for( int i=0;i<sid.length;i++){
  String query="update roomdetails set sid='"+sid[i]+"', roomstatus='"+status+"' where roomid='"+rid+"' and sid='"+sid_table[i]+"'";
  PreparedStatement ps=conu.prepareStatement(query);
  int r=ps.executeUpdate();
  if(r!=0){
  success="yes";
  }

}
PreparedStatement ps1=conu2.prepareStatement("update room set roomtype='"+rtype+"',roomcapacity='"+Capacity+"' where roomid='"+rid+"'");
int r1=ps1.executeUpdate();
if(r1!=0){
success1="yes";
}
if(success.equals("yes")&&success1.equals("yes")){
  %>
  <script type="text/javascript">
    alert("updation Successfull");
  </script>
  <%@ include file="RoomAllocation.jsp"%>
  <%
}
%>
