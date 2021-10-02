<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      <style media="screen">
      body{
        font-weight: bolder;
      }
      table{
        border: 3px solid  #046582;
        width: 400px;
      }
      td{
        border: 3px solid  #046582;

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

      <li> <a href="FeePay.jsp">FeePayment</a> </li>
      <li><a href="RoomVacation.jsp">RoomVacation</a> </li>
      <li class="active">
        <a href="Profile.jsp">Profile</a>
      </li>
    </ul>
    <form class="LogOut" action="home.html" method="post">
      <button type="submit" class="btn btn-danger" name="button">LogOut <i class="fas fa-power-off"></i></button>
    </form>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
    Connection conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
    String sid=(String)session.getAttribute("sid");
    Statement st=conn.createStatement();
    String sname="";
    ResultSet rs=st.executeQuery("select sname from student where sid='"+sid+"'");
    Statement st1=conn.createStatement();
    ResultSet rs1=st1.executeQuery("select * from student where sid='"+sid+"'");
    Statement st2=conn1.createStatement();
    ResultSet rs2=st2.executeQuery("select roomid from roomdetails where sid='"+sid+"'");
    if(rs.next()){
      sname=rs.getString(1);
    }
    %>
    <h3 style="text-align:center;"><%=sname%> Profile</h3>
    <br>
      <br />
    <%
    if(rs1.next()){%>
    <center>


    <table>
      <tr>
        <td>StudentId:</td>
        <td><%=rs1.getString(1)%></td>
      </tr>
      <tr>
        <td>FatherName:</td>
        <td><%=rs1.getString(3)%></td>
      </tr>
      <tr>
        <td>MotherName:</td>
        <td>
          <%=rs1.getString(4)%>
        </td>
      </tr>
      <tr>
        <td>Age:</td>
        <td>
          <%=rs1.getString(5)%>
        </td>
      </tr>
      <tr>
        <td>Address:</td>
        <td>
          <%=rs1.getString(6)%>
        </td>
      </tr>
      <tr>
        <td>PhoneNo:</td>
        <td>
          <%=rs1.getString(7)%>
        </td>
      </tr>
      <tr>
        <td>FatherPhoneno:</td>
        <td>
          <%=rs1.getString(11)%>
        </td>
      </tr>
      <tr>
        <td>Password:</td>
        <td>
          <%=rs1.getString(8)%>
        </td>
      </tr>
      <tr>
        <td>Dept:</td>
        <td>
          <%=rs1.getString(9)%>
        </td>
      </tr>
      <tr>
        <td>YearOfStudy:</td>
        <td>
          <%=rs1.getString(10)%>
        </td>
      </tr>
        <%}
        if(rs2.next()){%>


      <tr>
        <td>ROOMID:</td>
      <td><%=rs2.getString(1)%></td>
      </tr>
    </table>
<%}%>
    </center>
  </body>
</html>
