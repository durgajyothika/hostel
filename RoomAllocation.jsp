<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      <style media="screen">
      <style media="screen">

table, td, th{
  border:2px solid #046582;
}
  th, td{
  padding-right: 30px;
  width: 300px;
  text-align: left;
  padding-left: 15px;
  border: 3px solid #046582;
  }
  .sid{
  border:none;
  background:transparent ;
  width: 110%;

  font-size: 1.3rem;
  }

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
      .ss{
      margin-left: 30px;
      }
      .div{
        width: 500px;
        border: 2px solid #046582;
      }
      .anotherform{
        border: 3px groove grey;
        margin:30px 0 0 500px;
        width: 300px;
      }
      </style>
  </head>
  <body>
    <ul>

      <li > <a href="StudentDetails.jsp">StudentDetails</a> </li>
      <li> <a href="FurnitureDetails.html">FurnitureDetails</a></li>
      <li  class="active"><a href="RoomAllocation.jsp">RoomAllocation</a> </li>
      <li > <a href="employee.jsp">EmployeeDetails</a>  </li>

      <li >
        <a href="EmployeePay.html">FeePayment</a>
      </li>
    </ul>
    <form class="" action="AddRoom.html" method="post">
     <button type="submit" class="btn btn-success new"name="button">New Room</button>
    </form>
    <form class="LogOut" action="home.html" method="post">
      <button type="submit" class="btn btn-danger" name="button">LogOut <i class="fas fa-power-off"></i></button>
    </form>
    <br>
      <br>
        <br>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select sid from student minus select sid from roomdetails ");
    %>
   <center>

<div class="div">


    <form class="" action="RoomAllocation1.jsp" method="post">
  <table>
    <%
    while(rs.next()){%>

        <tr>
          <td><strong>Sid:</strong></td>
          <td>
            <input class="sid" type="text" name="sid" value="<%=rs.getString(1)%>">
          </td>
          <td>
            <button type="submit"class="btn btn-info" name="button">Allocate</button>
          </td>


        </tr>
        <%  }

          %>
  </table>
    </form>
</div>
    </center>

    <br>
      <br>

    <div class="anotherform">


      <center>
      <form class="" action="RoomDetails.jsp" method="post">
        <p> This form is used to update or delete room</p>
       <label for="">Enter Roomid:</label>
       <input type="text" name="rid" value="">
       <br>
       <br>
      <button type="submit" class="btn btn-primary ss"name="button">SUBMIT</button>
      </form>
      <br>
        
      </center>
    </div>
  </body>
</html>
