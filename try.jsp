  <%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
int am=100000;
String amount="100000";
int Actualdue_amount=0;
Actualdue_amount=Actualdue_amount+Integer.parseInt(amount);

out.println(Actualdue_amount);
int[] some={1,2,3,4};
int max=some[0];
for (int i = 0; i < 4; i++) {
            if ( some[i]> max) {
                max = some[i];
            }
        }
out.println(max);
%>
