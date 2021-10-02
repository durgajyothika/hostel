<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link href=
  'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
  		rel='stylesheet'>

  	<script src=
  "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" >
  	</script>

  	<script src=
  "https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" >
  	</script>
    <script defer src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      <script>
      $(document).ready(function() {

        $(function() {
          $( "#my_date_picker" ).datepicker();
        });
      })
         $(function() {

            $('#spinner').spinner({
               step: 100,
               min: 0,
               max: 200000
            });

           $("select").change(function(){
             var ctype=$("select")[0].value;
             if(ctype==="Online"){
                 $("#hide").css("display","block");
             }
         });
         });

      </script>
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
    .a{
      width: 230px;
      height: 30px;
    }
    .movedown{
      margin-top: 400px;
    }
      </style>
  </head>
  <body>
    <ul>

            <li > <a href="StudentDetails.jsp">StudentDetails</a> </li>
            <li > <a href="FurnitureDetails.html">FurnitureDetails</a></li>
            <li ><a href="RoomAllocation.jsp">RoomAllocation</a></li>
            <li > <a href="employee.jsp">EmployeeDetails</a>  </li>
      <li class="active">
        <a href="EmployeePay.html">FeePayment</a>
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
String sid=request.getParameter("sid");
session.setAttribute("studentid",sid);
int amount=0;
String status="";
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("select amount from studentbill where sid='"+sid+"'");
Statement st1=conn.createStatement();
ResultSet rs1=st1.executeQuery("select status from studentbill where sid='"+sid+"'");
if(rs.next()){
   amount=rs.getInt(1);
}
else{
  out.println("no");
}
if(rs1.next()){
 status=rs1.getString(1);
}
else{
  out.println("there is no status about this student");
}
if(status.equals("Paid")){%>
<center>
<h3 style="margin-top:30px;">You have Paid Your Total Fee</h3>
</center>


<%}
else{%>
<center>
<br>
  <br>

  <form class="" action="EmployeePay_next.jsp" method="post">
  <table>
    <tr>
      <td>Enter PaymentType:</td>
      <td>
        <select class="" name="ptype">
          <option value="cash">Cash</option>
          <option value="check">Check</option>
          <option value="Online">Card</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>Enter Amount:</td>
      <td><input type="number" id="spinner" name="Amount" value="<%=amount%>"></td>
    </tr>
    <tr>
      <td  class="movedown">Enter date:</td>
      <td  class="movedown">
        <input class="a"type="date" name="date" id="my_date_picker" value="">
      </td>
    </tr>
      </table>
      <br>
        <div id="hide" style="display:none;">

<table>

<tr>
  <td><label for="">Enter CardHolderName:</label></td>
  <td><input type="text" name="" value=""></td>
</tr>
<tr>
  <td>  <label for="">Enter CardNumber:</label></td>
  <td><input type="text"pattern="[0-9]{16}" title="Please Enter 16 digit number"name="" value=""></td>
</tr>
<tr>
  <td><label for="">Expiration(mm/yy)</label></td>
  <td><input type="text" name="" placeholder="MM/YY"value=""style="width:70px;"></td>
</tr>
<tr>
  <td> <label for="">SecurityCode(cvv)?:</label></td>
  <td> <input type="text" name="" value="" style="width:40px;"></td>
</tr>
  </table>
  </div>
  </center>

  <button type="submit"class="btn btn-primary"style="margin:20px 0 0 600px;width:150px;" name="button">PAY</button>
  </form>
<%}%>



  </body>
</html>
