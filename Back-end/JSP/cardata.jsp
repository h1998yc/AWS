<!DOCTYPE html>
<html>
<head>
  <title>Car Data</title>
  <style>
    table {
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
  </style>
</head>
<body>
  <%-- MariaDB 연결 정보 --%>
  <% String url = "jdbc:mysql://database-1.ckujmztg95va.ap-northeast-2.rds.amazonaws.com:3306/shopdb";
     String username = "admin";
     String password = "Reca7777!";
     String driver = "com.mysql.jdbc.Driver"; %>

  <%@ page import="java.sql.*" %>
  <%@ page import="javax.naming.*" %>
  <%@ page import="javax.sql.*" %>

  <%!
    public Connection getConnection() throws Exception {
      String driver = "com.mysql.jdbc.Driver";
      String url = "jdbc:mysql://database-1.ckujmztg95va.ap-northeast-2.rds.amazonaws.com:3306/shopdb";
      String username = "admin";
      String password = "Reca7777!";
      Class.forName(driver);
      Connection conn = DriverManager.getConnection(url, username, password);
      return conn;
    }
  %>

  <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
       conn = getConnection();
       stmt = conn.createStatement();
       String sql = "SELECT * FROM car";
       rs = stmt.executeQuery(sql);
  %>

  <h1> 차량 정보 </h1>

  <table>
    <tr>
      <th>차량 번호판</th>
      <th>이름</th>
      <th>가격</th>
      <th>브랜드명</th>
      <th>차종</th>
                        <th>색상</th>
                        <th>차량 이미지</th>
    </tr>
    <% while (rs.next()) { %>
      <tr>
        <td><%= rs.getString("car_id") %></td>
        <td><%= rs.getString("car_name") %></td>
        <td><%= rs.getString("car_price") %></td>
        <td><%= rs.getString("car_brand") %></td>
        <td><%= rs.getString("car_size") %></td>
        <td><%= rs.getString("car_color") %></td>
        <td><%= rs.getString("car_url") %></td>
      </tr>
    <% }
       rs.close();
       stmt.close();
       conn.close();
     } catch (Exception e) {
       e.printStackTrace();
     }
  %>
</body>
</html>

