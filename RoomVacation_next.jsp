<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con4=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String sid=(String)session.getAttribute("sid");
String roomid=(String)session.getAttribute("vrid");
String ridv="";
String roomstatus="";
int i=0;
int j=0;
String dt=request.getParameter("dt");
PreparedStatement ps1=conn1.prepareStatement("insert into roomvacation values(?,?,TO_DATE(?,'MM/DD/YYYY'))");
ps1.setString(1,roomid);
ps1.setString(2,sid);
ps1.setString(3,dt);
int r=ps1.executeUpdate();

PreparedStatement ps=conn.prepareStatement("delete from roomdetails where sid=?");
ps.setString(1,sid);
int r1=ps.executeUpdate();
Statement st4=con4.createStatement();
ResultSet rs5=st4.executeQuery("select roomcapacity from room where roomid='"+roomid+"'");
if(rs5.next()){
   i=rs5.getInt(1);

}
PreparedStatement ps3=con.prepareStatement("select count(*) from roomdetails where roomid=?");
ps3.setString(1,roomid);
ResultSet rs4=ps3.executeQuery();
if(rs4.next()){
  j=rs4.getInt(1);
}
if(i==j){
  roomstatus="Full";

}
else{
  roomstatus="NOTFULL";
}
PreparedStatement ps4=con3.prepareStatement("update roomdetails set roomstatus=? where roomid=?");
ps4.setString(1,roomstatus);
ps4.setString(2,roomid);
int r3=ps4.executeUpdate();

if(r!=0&&r1!=0&&r3!=0){%>
  <jsp:forward page="vacated.html"></jsp:forward>
<%}
else{
  out.println("No vacation ");
}
%>
