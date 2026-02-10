<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String sql = "select * from PAY_04";

try {

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, "c##230218", "1234");

    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임금표</title>
</head>

<body>

<h1 style="text-align:center">2023년 대한회사 임금표</h1>

<table border="1" style="margin:auto; border-collapse:collapse; text-align:center;">
<tr>
    <th>사원이름</th>
    <th>임금코드</th>
    <th>사원코드</th>
    <th>기본급</th>
    <th>교통비</th>
    <th>보너스</th>
    <th>수당</th>
    <th>식대</th>
    <th>합계</th>
</tr>

<%
while (rs.next()) {

    int pay1  = rs.getInt("pay1");
    int pay2  = rs.getInt("pay2");
    int bonus = rs.getInt("bonus");
    int pay3  = rs.getInt("pay3");
    int pay4  = rs.getInt("pay4");

    int total = pay1 + pay2 + bonus + pay3 + pay4;
%>

<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getInt("pycode") %></td>
    <td><%= rs.getInt("emcode") %></td>
    <td><%= pay1 %></td>
    <td><%= pay2 %></td>
    <td><%= bonus %></td>
    <td><%= pay3 %></td>
    <td><%= pay4 %></td>
    <td><b><%= total %></b></td>
</tr>

<%
}
%>

</table>

</body>
</html>

<%
} catch(Exception e) {
    e.printStackTrace();

} finally {

    if(rs != null)   try { rs.close(); }   catch(Exception e){}
    if(stmt != null) try { stmt.close(); } catch(Exception e){}
    if(conn != null) try { conn.close(); } catch(Exception e){}
}
%>
