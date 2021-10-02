<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style media="screen">
  ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color:#548CA8;
  font-weight: bold;
  font-family: Arial, Helvetica, sans-serif;
  }
  li {
    float: left;
  }

  li a {
    display: block;
    color:white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
  }

  .active{
    border-bottom: 3px solid #046582;
    background-color:#8AB6D6;
  }
  li a:hover{
    background-color:#8AB6D6;
    text-decoration: none;
    color: #046582;
  }
  .LogOut{
    position: absolute;
    top:10px;
    left: 1200px;
  }

    </style>
  </head>
  <body>
    <ul>

      <li class="active"> <a href="FeePay.jsp">FeePayment</a> </li>
      <li><a href="RoomVacation.jsp">RoomVacation</a> </li>
      <li>
        <a href="Profile.jsp">Profile</a>
      </li>
    </ul>
    <form class="LogOut" action="home.html" method="post">
      <button type="submit" class="btn btn-danger" name="button">LogOut <i class="fas fa-power-off"></i></button>
    </form>
    <h3 style="text-align:center;">Payment Successfull</h3>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
    Statement st=conn.createStatement();
    String sid=(String)session.getAttribute("sid");
int i=0;

    int size_displaydue=0;
    ResultSet rs=st.executeQuery("select bill_due from bill where sid='"+sid+"'");
      Statement st1=conn.createStatement();
      ResultSet rs1=st1.executeQuery("select count(bill_due) from bill where sid='"+sid+"'");
      Statement st2=conn.createStatement();
      ResultSet rs2=st2.executeQuery("select amount from studentbill where sid='"+sid+"' ");
      if(rs1.next()){
      size_displaydue=rs1.getInt(1);

      int[] displaydue=new int[size_displaydue];
    while(rs.next()&&i<size_displaydue){
    displaydue[i]=Integer.parseInt(rs.getString(1));
    i++;
    }
    int max=displaydue[0];
      for(int j=0;j<size_displaydue;j++){
        if(displaydue[j]<max){
          max=displaydue[j];
        }
      }

if(max!=0){%><h3>Balance amount to be paid is <%=max%></h3><%}


}
else{
//dosomething
}
%>

  </body>
</html>
