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
    </style>
  </head>
  <body>
    <ul>

      <li > <a href="FeePay.jsp">FeePayment</a> </li>
      <li class="active"><a href="RoomVacation.jsp">RoomVacation</a> </li>
      <li>
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

    String sid=(String)session.getAttribute("sid");
    String ridv="";

    Statement st=conn.createStatement();
    ResultSet rs=st.executeQuery("select roomid from roomdetails where sid='"+sid+"'");
    if(rs.next()){
      ridv=rs.getString(1);
    }

    else{
      out.println("you have not selected a room");
    }
    session.setAttribute("vrid",ridv);
    %>
    <form class="" action="RoomVacation_next.jsp" method="post">
     <center>
       <table>
         <tr>
           <td>Roomid:</td>
           <td>
             <input style="cursor:not-allowed;"type="text" name="roomid" value="<%=ridv%>" >
           </td>
         </tr>
         <tr>
           <td>Enter Date:</td>
           <td>
             <input type="date" name="dt" id="my_date_picker" value="">
           </td>
         </tr>

         <tr>
           <td></td>
           <td>
             <button type="submit" class="btn btn-primary"name="button">Submit</button>
           </td>
         </tr>
       </table>
     </center>
    </form>

  </body>
</html>
