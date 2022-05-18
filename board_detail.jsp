<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id_value");
    String board_id = request.getParameter("board_id");
    String board_title = request.getParameter("board_title");
    String board_date = request.getParameter("board_date");
    String board_cont = request.getParameter("board_cont");
    
    

    // 데이터베이스 접속
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/stageus",
        "test",
        "1234"
    );

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="table.css">
    <title>Main Page</title>
</head>
<body>

    <h1><%=board_title%></h1>
    <p>작성자: <%=id%></p>
    <p>작성일: <%=board_date%></p>
    <p><%=board_cont%></p>
    
    <script>
        
    </script>
</body>