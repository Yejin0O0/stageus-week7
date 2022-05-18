<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id_value");
    String pw = request.getParameter("pw_value");

    // 데이터베이스 접속
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/stageus",
        "test",
        "1234"
    );

    // Query 문 작성
    String sql = "SELECT * FROM member WHERE member_id=? and pw=?";
    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, pw);

    // Query 문 전송
    // selcet 문 전송시
    ResultSet result = query.executeQuery();

    //create, update, delete 문 전송시
    //query.executeQuery();
    // 밑의 정제는 필요 없음

    // 데이터 정제
    String[][] data = new String[10][2];
    // Sting[y축][x축]

    int index = 0;
    // 다음 값이 있다면
    while (result.next()) {
        data[index][0] = result.getString(1);
        data[index][1] = result.getString(2);

        index++;
    }

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
</head>
<body>
    <h1>로그인 정보</h1>
    <p><%=id%></p>
    <p><%=pw%></p>

    <script>
        window.onload = function () {
        <% for(int a = 0; a < 10; a ++) { %>
            console.log("<%=data[a][0]%>")
            console.log("<%=data[a][1]%>")
        <% } %>
        }
    </script>
</body>