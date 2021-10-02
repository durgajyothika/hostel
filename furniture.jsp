<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String roomid=(String)session.getAttribute("id");
String rtype=(String)session.getAttribute("rt");
PreparedStatement ps2=con.prepareStatement("insert into furniture values(?,?)");
PreparedStatement ps1=con1.prepareStatement("insert into furnituretype values(?,?)");
PreparedStatement ps3=con1.prepareStatement("insert into furnituretype values(?,?)");
PreparedStatement ps4=con1.prepareStatement("insert into furnituretype values(?,?)");
Statement st1=con2.createStatement();
ResultSet rs1=st1.executeQuery("select f_seq.NEXTVAL from dual");
String fid="";
if(rs1.next()){
  fid=rs1.getString(1);
  fid="f#"+fid;
}
ps2.setString(1,roomid);
ps2.setString(2,fid);
int r1=ps2.executeUpdate();
ps1.setString(1,fid);
ps1.setString(2,"1");
ps3.setString(1,fid);
ps3.setString(2,"3");
ps4.setString(1,fid);
if(rtype.equals("AC")){
  ps4.setString(2,"4");
}
else{
  ps4.setString(2,"2");
}
int r2=ps1.executeUpdate();
int r3=ps3.executeUpdate();
int r4=ps4.executeUpdate();
if(r1!=0&&r2!=0&&r3!=0&&r4!=0){%>
<jsp:forward page="RoomAllocated.html"></jsp:forward>
<%}
else{
  out.println("somethingwent wrong");
}%>
