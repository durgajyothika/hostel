<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
String sid=request.getParameter("sid");
String sname=request.getParameter("sname");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String age=request.getParameter("age");
String address=request.getParameter("address");
String Phoneno=request.getParameter("phoneno");
String FatherPhoneno=request.getParameter("FatherPhoneno");
String dept=request.getParameter("dept");
String Yearofstudy=request.getParameter("yos");

String pass=request.getParameter("pwd");
int i=Integer.parseInt(age);

int k=Integer.parseInt(Yearofstudy);


  if(Phoneno.length()==10){
    if(FatherPhoneno.length()==10){
    PreparedStatement ps=conn.prepareStatement("update student set sid=?,sname=?,fathername=?,mothername=?,age=?,address=?,phoneno=?,password=?,dept=?,yearofstudy=?,fatherphoneno=? where sid=?");

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

   ps.setString(12,sid);
    int r=ps.executeUpdate();

    if(r!=0 ){%>

    <script type="text/javascript">
      alert("updation Successfull");
    </script>
   <%@ include file="StudentDetails.jsp"%>
    <%}
    else{%>
      <script type="text/javascript">
        alert("Updation not Successfull try again");
      </script>
      <%@ include file="StudentDetails.jsp"%>
    <%}
  }
  else{
    out.println("enter a 10 digit FatherPhoneno ");
  }

  }
  else{
    out.println("enter a 10 digit Phoneno");
  }



%>
