<%-- 
    Document   : findfriends
    Created on : 5 Mar, 2016, 12:59:47 PM
    Author     : ssrahul96
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../WEB-INF/jspf/logoutheader.jspf" %>

<%ResultSet rs =null;%>
<%ResultSet rs1 =null;%>
<%Statement st=null;%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newbee</title>
    </head>
    <body><center>
        <h1>Find Friends</h1>
        <%
            HttpSession ses=request.getSession();
            String uname=(String)ses.getAttribute("uname");
            String fname=(String)ses.getAttribute("fname");
            
            String query="select firstname,userid from userinfo";
            ArrayList<String> al = new ArrayList<String>();
            ArrayList<String> al1 = new ArrayList<String>();
            
            
            Connection con=null;

		try
		{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newbee","ssrahul96","rahul1234");
                    st=con.createStatement();
                    rs= st.executeQuery(query);
			while(rs.next())
                            {
				//out.println(rs.getString(1)+"<br>");
                                al.add(rs.getString(1));
                                al1.add(rs.getString(2));
                            }
				
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			catch(Exception e)
			{
			}
                %>
                <form action="../newfriend.do" method="get">
                    <% for(int i=0;i<al.size();i++){
                        String s=al.get(i);
                        String s1=al1.get(i);
                    %> 
                    <%=s%><input type="radio" name="nf" value="<%=s1%>"><br>
                <% } %>
                <input type="submit" value="submit">
                </form>
                <a href='../../../newbee/user/profile.jsp'>go back</a>
    </center></body>
</html>
