<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style media="screen">
    table, th, td{
      border:1px solid black;
    }
    table{
      margin:100px 0 20px 350px;
      border-collapse: collapse;


    }
th, td{
padding-right: 30px;
width: 300px;
text-align: left;
padding-left: 15px;
}
input{
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
.es{
  margin-left: 30px;
}
    </style>
  </head>
  <body>

    <ul>

      <li> <a href="StudentDetails.jsp">StudentDetails</a> </li>
      <li> <a href="FurnitureDetails.html">FurnitureDetails</a> </li>
      <li  class="active"><a href="RoomDetails.html">RoomDetails</a> </li>
      <li> <a href="employee.jsp">EmployeeDetails</a>  </li>
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
      <%@ page import="java.io.*" %>
      <%@ page import="java.sql.*" %>
      <%
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection conr=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
      Connection conr1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
        Connection conr2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
        Connection conr3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
        Connection conr4=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");

      String rid=request.getParameter("rid");
      session.setAttribute("RID",rid);
      int c=0;
      int i=0;
      Statement str=conr.createStatement();
      ResultSet rsr=str.executeQuery("select * from room where roomid='"+rid+"'");
      Statement str4=conr4.createStatement();
      ResultSet rsr4=str4.executeQuery("select capacity from roomtype_capacity where roomtype=(select roomtype from room where roomid='"+rid+"')");
      Statement str2=conr2.createStatement();
      ResultSet rsr2=str2.executeQuery("select count(sid) from roomdetails where roomid='"+rid+"'");
      Statement str1=conr1.createStatement();
      ResultSet rsr1=str1.executeQuery("select sid from roomdetails where roomid='"+rid+"'");
      Statement str3=conr3.createStatement();
      ResultSet rsr3=str3.executeQuery("select distinct(roomid),roomstatus from roomdetails where roomid='"+rid+"'");
      if(rsr.next()){%>
      <form class="" action="Roomupdate.jsp" method="post">


      <table>
        <tr>
          <td>RoomID:</td>
          <td> <input type="text" name="rid" value="<%=rsr.getString(1)%>" style="cursor:not-allowed;"> </td>
        </tr>
        <tr>
          <td>RoomType:</td>
          <td> <input type="text" name="rtype" value="<%=rsr.getString(2)%>"> </td>

        </tr>
        <tr>
          <%if(rsr4.next()){%>
          <td>Capacity:</td>
          <td> <input type="text" name="Capacity" value="<%=rsr4.getString(1)%>"> </td>
<%}%>
        </tr>
        <%
        while(rsr1.next()){%>
        <tr>
          <td>SID:</td>
          <td> <input type="text" name="sid" value="<%=rsr1.getString(1)%>"> </td>
        </tr><%}
        if(rsr3.next()){%>

        <tr>
          <td>Status:</td>
          <td>
            <input type="text" name="status" value="<%=rsr3.getString(2)%>">
          </td>
        </tr>
      <%}
    }

        else{%>
          <script type="text/javascript">
            alert("enter vallid room id");
          </script>
          <%@ include file="RoomDetails.html"%>
        <%
        while(rsr2.next()){
           c=rsr2.getInt(1);
        }
}
      %>

        <tr>
          <td> <button type="submit" class="btn btn-success" name="button">Update</button>  </td>
          <td>
            <a href="Roomdelete.jsp">
              <button type="button" class="btn btn-danger" name="button">Delete</button>
            </a>
            <%-- <form class="" action="delete.jsp" method="post">
              <button type="submit" class="btn btn-danger"name="button">Delete</button>
            </form> --%>
          </td>
          <%-- <td> <a href="delete.jsp"> <button type="button" name="button">Delete</button> </a> </td> --%>
        </tr>
      </table>
      </form>




    </body>
    </html>
