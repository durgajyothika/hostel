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

      <script type="text/javascript">
      $(function(){
      $("select").change(function(){
        var rtype=$("select")[0].value;
    if(rtype==="AC"){$("#AC").css("display","inline");
    $("#NONAC").css("display","none");
    }
    else{
    $("#AC").css("display","none");
    $("#NONAC").css("display","inline")
    }});

      $( "#my_date_picker" ).datepicker();

  });
    </script>
    <style media="screen">

      .form-group{
        margin-top:10px;
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
  .LogOut{
    position: absolute;
    top:10px;
    left: 1200px;
  }
  .aldate{
    margin:20px 0 0 0;
  }
  .sub{
    margin:20px 0 0 150px;
  }
  .move{
    margin:20px 0 0 500px;
  }
  .title{
    margin:0 0 20px 30px;
  }
  .smove{
    margin:0 0 0 25px;
  }
  label{
    font-weight: bolder;
  }
  .shmove{
  margin:0 0 0 43px;
  }
    </style>
  </head>
  <body>
    <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
        Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");
        Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jyoti","jyoti");

        String sid=(String)session.getAttribute("sid");
        String roomtype="";
        int size_AC=0;
        int i=0;
        int size_NONAC=0;
        int size_status=0;
        int status=0;
        int j=0;
        Statement st5=con1.createStatement();
    ResultSet rs5=st5.executeQuery("select roomid from roomdetails where sid='"+sid+"'");
    Statement st7=con2.createStatement();
    ResultSet rs7=st7.executeQuery("select roomid from room where roomtype='NONAC' minus select roomid from room where roomtype='NONAC' and roomid in(select roomid from roomdetails where roomstatus='Full')");
    Statement st8=con2.createStatement();
    ResultSet rs8=st8.executeQuery("select roomid from room where roomtype='NONAC' minus select roomid from room where roomtype='NONAC' and roomid in(select roomid from roomdetails where roomstatus='Full')");
    Statement st9=con2.createStatement();
    ResultSet rs9=st9.executeQuery("select roomid from room where roomtype='AC' minus select roomid from room where roomtype='AC' and roomid in(select roomid from roomdetails where roomstatus='Full')");
    Statement st10=con2.createStatement();
    ResultSet rs10=st10.executeQuery("select roomid from room where roomtype='AC' minus select roomid from room where roomtype='AC' and roomid in(select roomid from roomdetails where roomstatus='Full')");

    while(rs7.next()){
    size_NONAC++;
    }
    while(rs9.next()){
      size_AC++;
    }
    String[] rid_AC=new String[size_AC];
    String[] rid_NONAC=new String[size_NONAC];
    while(rs8.next()&&i<size_NONAC){
     rid_NONAC[i]=rs8.getString(1);
     i++;
    }
    while(rs10.next()&&j<size_AC){
      rid_AC[j]=rs10.getString(1);
      j++;
    }
        %>
        <ul>

      <li> <a href="FeePay.jsp">FeePayment</a> </li>
      <li><a href="RoomVacation.jsp">RoomVacation</a> </li>

    </ul>
        <form class="LogOut" action="home.html" method="post">
          <button type="submit" class="btn btn-danger" name="button">LogOut <i class="fas fa-power-off"></i></button>
        </form>


    <br>

    <%
   if(rs5.next()){%>
     <h3> Already Allocated Room (<%=rs5.getString(1)%>)</h3>
   <%}
   else{%>
   <form class="move" action="student_next.jsp" method="post">
    <h3 class="title">BOOK YOUR ROOM</h3>
<div class="">
  <label for="">Select RoomType:</label>
  <select id="change"class="smove" name="rtype">
    <option value="NONAC" >select</option>
    <option value="AC">AC</option>
    <option value="NONAC">NONAC</option>
  </select>
</div>
<br>
<div style="display:none;"id="AC">
 <label for="">Select RoomId:</label>
  <select class="shmove" name="roomno">
    <option value="">select</option>
    <%
         for(int k=0;k<size_AC;k++){%>
           <option value="<%=rid_AC[k]%>"><%=rid_AC[k]%></option>
         <%}%>

  </select>
</div>

<div style="display:none;"id="NONAC">
<label for="">Select RoomId:</label>
<select class="shmove" name="roomno1">
 <option value="">select</option>
 <%
         for(int l=0;l<size_NONAC;l++){%>
           <option value="<%=rid_NONAC[l]%>"><%=rid_NONAC[l]%></option>

        <%}%>

</select>
</div>

<div class="aldate">
  <label for="">Enter allocation date:</label>
  <input type="date" name="allocationdate" id="my_date_picker" value="" placeholder="Enter Date">
</div>
<div class="sub">
  <button type="submit" class="btn btn-primary"name="button">Submit</button>
</div>

</form>
<%}%>
  </body>
</html>
