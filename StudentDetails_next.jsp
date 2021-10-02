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
    </style>
  </head>
  <body>
    <ul>

      <li class="active"> <a href="StudentDetails.jsp">StudentDetails</a> </li>
      <li> <a href="FurnitureDetails.html">FurnitureDetails</a> </li>
      <li><a href="RoomAllocation.jsp">RoomAllocation</a> </li>
      <li > <a href="employee.jsp">EmployeeDetails</a>  </li>
      <li >
        <a href="EmployeePay.html">FeePayment</a>
      </li>
    </ul>
    <form class="" action="register.html" method="post">
     <button type="submit" class="btn btn-success new"name="button">New Student</button>
    </form>
    <form class="LogOut" action="home.html" method="post">
      <button type="submit" class="btn btn-danger" name="button">LogOut <i class="fas fa-power-off"></i></button>
    </form>
  <%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection cons1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
Connection cons=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");

String uname=request.getParameter("uname");
session.setAttribute("Username",uname);


  Statement sts=cons.createStatement();
  ResultSet rs=sts.executeQuery("select * from student where sid='"+uname+"'");
  if(rs.next()){%>
  <form class="" action="Studentupdate.jsp" method="post">


  <table>
    <tr>
      <td>SID:</td>
      <td> <input type="text" name="sid" value="<%=rs.getString(1)%>"> </td>
    </tr>
    <tr>
      <td>Name:</td>
      <td> <input type="text" name="sname" value="<%=rs.getString(2)%>"> </td>

    </tr>
    <tr>
      <td>Fathername:</td>
      <td> <input type="text" name="fname" value="<%=rs.getString(3)%>"> </td>

    </tr>
    <tr>
      <td>Mothername:</td>
      <td> <input type="text" name="mname" value="<%=rs.getString(4)%>"> </td>
    </tr>
    <tr>
      <td>Age:</td>
      <td> <input type="text" name="age" value="<%=rs.getString(5)%>"> </td>
    </tr>
    <tr>
      <td>address:</td>
      <td> <input type="text" name="address" value="<%=rs.getString(6)%>"> </td>
    </tr>
    <tr>
      <td>Phoneno:</td>
      <td> <input type="text" name="phoneno" value="<%=rs.getString(7)%>"> </td>
    </tr>
    <tr>
      <td>FatherPhoneno:</td>
      <td> <input type="text" name="FatherPhoneno" value="<%=rs.getString(11)%>"> </td>
    </tr>
    <tr>
      <td>Password:</td>
      <td> <input type="text" name="pwd" value="<%=rs.getString(8)%>"> </td>
    </tr>
    <tr>
      <td>Dept:</td>
      <td> <input type="text" name="dept" value="<%=rs.getString(9)%>"> </td>
    </tr>
    <tr>
      <td>Yearofstudy:</td>
      <td> <input type="text" name="yos" value="<%=rs.getString(10)%>"> </td>
    </tr>

    <tr>
      <td> <button type="submit" class="btn btn-success" name="button">Update</button>  </td>
      <td>
        <a href="Studentdelete.jsp">
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
  <%}


%>
</body>
</html>
