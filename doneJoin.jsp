<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>


<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id_value");
    String pw = request.getParameter("pw_value");
    String name = request.getParameter("name_value");
    String mail = request.getParameter("mail_value");
    String num = request.getParameter("num_value");


    // 데이터베이스 접속
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/stageus",
        "test",
        "1234"
    );

    // Query 문 작성
    String sql = "INSERT INTO member (member_id, pw, name, mail, phone, join_date) VALUE(?,?,?,?,?,now())";


    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, pw);
    query.setString(3, name);
    query.setString(4, mail);
    query.setString(5, num);
   
    int result = query.executeUpdate();

    if(result == 1){ 
          
        response.sendRedirect("login.jsp");
    } else{ // 실패
        response.sendRedirect("join.jsp");
    }
   
    

%>

