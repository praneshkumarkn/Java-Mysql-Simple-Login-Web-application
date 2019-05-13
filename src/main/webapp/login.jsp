<%@ page import="java.sql.*"%>

<%
 String userName = request.getParameter("userName"); 
 
 String password = request.getParameter("password"); 
 
 Class.forName ("com.mysql.jdbc.Driver"); 
 Connection con = DriverManager.getConnection("jdbc:sqlserver://catlog.database.windows.net:1433;database=catlog;user=kumar@catlog;password=admin@123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
 Statement st = con.createStatement(); 
 ResultSet rs; 
 rs = st.executeQuery("select * from userdata where username='" + userName + "' and password='" + password + "'");
	if (rs.next()) 
		{ 
			session.setAttribute("userid", userName); 
			response.sendRedirect("success.jsp"); 
		} 
	else 
		{ 
			out.println("Invalid password <a href='index.jsp'>try again</a>"); 
} 
%>
