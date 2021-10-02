<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con4=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Statement st=con1.createStatement();

String roomstatus="";
int i=0;
int j=0;
int bill_amount=0;
String roomid="";
String rtype=request.getParameter("rtype");

if(rtype.equals("AC")){
roomid=request.getParameter("roomno");
}
else{
 roomid=request.getParameter("roomno1");
}

session.setAttribute("id",roomid);

session.setAttribute("rt",rtype);
String allocationdate=request.getParameter("allocationdate");
String sid=(String)session.getAttribute("sid");
PreparedStatement ps=con.prepareStatement("insert into roomdetails values(?,?,?,TO_DATE(?,'MM/DD/YYYY'))");
ps.setString(1,sid);
ps.setString(2,roomid);
ps.setString(3,"NOTFULL");
ps.setString(4,allocationdate);
int r=ps.executeUpdate();
ResultSet rs=st.executeQuery("select capacity from roomtype_capacity where roomtype='"+rtype+"'");
if(rs.next()){
   i=rs.getInt(1);

}

PreparedStatement ps1=con.prepareStatement("select count(*) from roomdetails where roomid=?");
ps1.setString(1,roomid);
ResultSet rs4=ps1.executeQuery();
if(rs4.next()){
  j=rs4.getInt(1);
}
if(i==j){
  roomstatus="Full";

}
else{
  roomstatus="NOTFULL";
}
PreparedStatement ps3=con3.prepareStatement("update roomdetails set roomstatus=? where roomid=?");
ps3.setString(1,roomstatus);
ps3.setString(2,roomid);
int r3=ps3.executeUpdate();
if(rtype.equals("AC")){
  bill_amount=100000;
}
else{
  bill_amount=75000;
}
PreparedStatement ps4=con4.prepareStatement("insert into studentbill values(?,?,?)");
ps4.setString(1,sid);
ps4.setInt(2,bill_amount);
ps4.setString(3,"Notpaid");
int r1=ps4.executeUpdate();
if(r!=0){
if(r1==0&&r3==0){
out.println("something went wrong");
}
else{%>
<jsp:forward page="furniture.jsp"></jsp:forward>
<%}
}
else{%>
  <jsp:forward page="student.jsp"></jsp:forward>
<%}
%>
