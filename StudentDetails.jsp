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
.ss{
  margin-left: 30px;
}
</style>
  </head>
  <body>
    <ul>

      <li class="active"> <a href="StudentDetails.jsp">StudentDetails</a> </li>
      <li> <a href="FurnitureDetails.html">FurnitureDetails</a></li>
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

    <%-- <h3>Number Of Students In Hostel: <%=i%></h3> --%>
    <br>

      <center>
      <form class="" action="StudentDetails_next.jsp" method="post">
        <p> This form is used to view or update or delete student Details </p>
       <label for="">Enter Username:</label>
       <input type="text" name="uname" value="">
       <br>
       <br>
      <button type="submit" class="btn btn-primary ss"name="button">SUBMIT</button>
      </form>
      </center>
  </body>
</html>
