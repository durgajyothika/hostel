<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String sname=request.getParameter("name");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String age=request.getParameter("age");
String address=request.getParameter("address");
String Phoneno=request.getParameter("Phoneno");

String FatherPhoneno=request.getParameter("FatherPhoneno");
String dept=request.getParameter("Dept");
String Yearofstudy=request.getParameter("yearOfStudy");

String pass=request.getParameter("pwd");
String cpass=request.getParameter("cpwd");
String sid="";
String sid_sequence="";
int i=Integer.parseInt(age);

int k=Integer.parseInt(Yearofstudy);

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select sid_seq.NEXTVAL from DUAL");
if(rs.next()){
  sid_sequence=rs.getString(1);
  sid="s"+sid_sequence;

}
else{
  out.println("smtg wrong");
}
if(pass.equals(cpass)){
  if(Phoneno.length()==10){
    if(FatherPhoneno.length()==10){
    PreparedStatement ps=conn.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?)");

    ps.setString(1,sid);
    ps.setString(2,sname);
    ps.setString(3,fname);
    ps.setString(4,mname);
    ps.setInt(5,i);
    ps.setString(6,address);
    ps.setString(7,Phoneno);
    ps.setString(8,pass);
    ps.setString(9,dept);
    ps.setInt(10,k);
    ps.setString(11,FatherPhoneno);


    int r=ps.executeUpdate();

    if(r!=0 ){%>
      <h3 style="background: black;color: white;text-align:center; position:absolute;top:100px;left:630px;">Your ID is "<%=sid%>" </h3>

        <%-- <p style="text-align:center;">
         Login for Booking room,PayingBills,VacatingRoom
        </p> --%>
      <%@ include file="home.html"%>
    <%}
    else{%>

    <%}
  }
  else{
    out.println("enter a 10 digit FatherPhoneno");
  }

  }
  else{
    out.println("enter a 10 digit Phoneno");
  }

}
else{
  out.println("Passwords doesnot match");
}
%>
