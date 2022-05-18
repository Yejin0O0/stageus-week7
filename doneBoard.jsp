<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>


<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

    String board_title = request.getParameter("board_title");
    String board_cont = request.getParameter("board_cont");
    String id = request.getParameter("id_value");



    // 데이터베이스 접속
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/stageus",
        "test",
        "1234"
    );

    // Query 문 작성
    String sql = "INSERT INTO board (board_title, board_cont, board_date, member_id) VALUE(?,?,now(),?)";


    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, board_title);
    query.setString(2, board_cont);
    query.setString(3, id);
   
    int result = query.executeUpdate();

    if(result == 1){ 
        request.getSession().setAttribute("id", id);
        request.getRequestDispatcher("board.jsp").forward(request, response);
    } else{ // 실패
        response.sendRedirect("board.jsp");
    }
   
    

%>

