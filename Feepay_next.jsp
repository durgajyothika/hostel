<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String sid=(String)session.getAttribute("sid");
String Amount=request.getParameter("Amount");
session.setAttribute("at",Amount);
String dt=request.getParameter("date");
String full="";
int due=0;
String status="";
String roomtype="";
int Paid_Amount=Integer.parseInt(Amount);
int am=0;
String bid="";
int size_dueamount=0;

int Actualdue_amount=0;
Statement st1=conn2.createStatement();
ResultSet rs1=st1.executeQuery("select roomtype from room where roomid=(select roomid from roomdetails where sid='"+sid+"')");
if(rs1.next()){
 roomtype=rs1.getString(1);
}
else{
  out.println("U have not booked your room ");
}
if(roomtype.equals("AC")){
  am=100000;
}
else{
  am=75000;
}
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("select bill_seq.NEXTVAL from dual");
if(rs.next()){
   bid=rs.getString(1);
   bid="Bill"+bid;
}
else{
  out.println("no");
}
Statement st2=conn1.createStatement();
ResultSet rs2=st2.executeQuery("select bill_due from bill where sid='"+sid+"'");
Statement st3=conn1.createStatement();
ResultSet rs3=st3.executeQuery("select count(bill_due) from bill where sid='"+sid+"'");
if(rs3.next()){
size_dueamount=rs3.getInt(1);
String[] dueamount=new String[size_dueamount];
int i=0;
while(rs2.next()){
dueamount[i]=rs2.getString(1);
i++;
}
for (int j=0;j<size_dueamount ;j++ ) {
Actualdue_amount=Actualdue_amount+Integer.parseInt(dueamount[j]);
}
}
else{
  Actualdue_amount=0;
}

if(Paid_Amount==am){
  due=0;
}
else{
  due=am-(Paid_Amount+Actualdue_amount);
}
if(due==0){
  status="FullyPaid";
}
else{
  status="NotFullypaid";
}
PreparedStatement ps=conn1.prepareStatement("insert into bill values(?,?,?,TO_DATE(?,'MM/DD/YYYY'),?,?) ");
PreparedStatement ps3=conn3.prepareStatement("update studentbill set status=? where sid=? ");
ps.setString(1,bid);
ps.setString(2,sid);
ps.setInt(3,Paid_Amount);
ps.setString(4,dt);
ps.setInt(5,due);
ps.setString(6,"Online");
ps3.setString(1,status);
ps3.setString(2,sid);

int r=ps.executeUpdate();
int r1=ps3.executeUpdate();
if(r!=0&&r1!=0){%>
<jsp:forward page="payed.jsp"></jsp:forward>
<%}
else{
  out.println("no");
}
%>
