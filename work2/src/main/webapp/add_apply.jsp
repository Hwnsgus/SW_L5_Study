<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    
    	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
    	
    	PreparedStatement stmt = conn.prepareStatement("INSERT INTO custom_01 VALUES (?, ?, ?, ?, ?)");
    	
    	stmt.setString(1, request.getParameter("p_id"));
    	stmt.setString(2, request.getParameter("p_pw"));
    	stmt.setString(3, request.getParameter("c_name"));
    	stmt.setString(4, request.getParameter("c_email"));
    	stmt.setString(5, request.getParameter("c_tel"));

    	stmt.execute();		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<a href="add.jsp">등록화면</a>

</body>
</html>