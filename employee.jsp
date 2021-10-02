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
}
.a1{
  margin: 20px;

}
.a2{
  margin: 20px;

}
.a3{
  margin: 20px;

}
a{
  text-decoration: none;

}
button{
  cursor: pointer;
}
.LogOut{
  position: absolute;
  top:10px;
  left: 1200px;
}
.new{
  position: absolute;
  top:10px;
  left: 1050px;
}
.es{
  margin-left: 30px;
}
    </style>
  </head>
  <body>

    <ul>

      <li> <a href="StudentDetails.jsp">StudentDetails</a> </li>
      <li> <a href="FurnitureDetails.html">FurnitureDetails</a> </li>
            <li ><a href="RoomAllocation.jsp">RoomAllocation</a></li>
      <li class="active"> <a href="employee.jsp">EmployeeDetails</a>  </li>
      <li >
        <a href="EmployeePay.html">FeePayment</a>
      </li>

    </ul>
    <form class="" action="insertEmployee.html" method="post">
     <button type="submit" class="btn btn-success new"name="button">New Employee</button>
    </form>
    <form class="LogOut" action="home.html" method="post">
      <button type="submit" class="btn btn-danger" name="button">LogOut <i class="fas fa-power-off"></i></button>
    </form>
    <br>
      <%@ page import="java.io.*" %>
      <%@ page import="java.sql.*" %>
      <%
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
      Statement st=con.createStatement();
      Statement st1=con.createStatement();
      ResultSet rs=st.executeQuery("select count(*) from employee where designation='warden'");
      ResultSet rs1=st1.executeQuery("select count(*) from employee where designation='worker'");
      int a=0;
      int b=0;
      if(rs.next()){
        a=rs.getInt(1);
      }
      else{
        out.println("something wrong");
      }
      if(rs1.next()){
        b=rs1.getInt(1);
      }
      else{
        out.println("something wrong");
      }
    %>
     <%-- <h3>Number of Wardens: <%=a%></h3>
     <h3>Number of Workers: <%=b%></h3> --%>
     <br>

       <center>
       <form class="" action="employee_next.jsp" method="post">
         <p> This form is used to view or update or delete Employee Details </p>
        <label for="">Enter Username:</label>
        <input type="text" name="uname" value="">
        <br>
        <br>
        <button type="submit" class="btn btn-primary es" name="button">SUBMIT</button>
       </form>
       </center>
  </body>
</html>
