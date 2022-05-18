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

    // Query 문 작성
    String boardSql = "SELECT * FROM board";
    PreparedStatement boardQuery = conn.prepareStatement(boardSql);
    

    // Query 문 전송
    // selct 문 전송시
    ResultSet boardRes = boardQuery.executeQuery();

    // 데이터 정제
    String[][] boardData = new String[10][5];
    // Sting[y축][x축]

    int index = 0;

    int idx = 0;
    while (boardRes.next()) {
        boardData[idx][0] = boardRes.getString("board_title");
        boardData[idx][1] = boardRes.getString("member_id");
        boardData[idx][2] = boardRes.getString("board_id");
        boardData[idx][3] = boardRes.getString("board_date");
        boardData[idx][4] = boardRes.getString("board_cont");
        
        idx++;
    }

    

    
    

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="table.css">
    <title>Main Page</title>
</head>
<body>
    <p><%=id%> 님이 로그인 하셨습니다.</p>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>글 번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th></th>
                
            </tr>
        </thead>
        
        <tbody>
            <% for(int a = 0; a < 10; a ++) { %>
                <form action="board_detail.jsp" method="get">
                    <tr>
                        <td>
                            <%=boardData[a][2]%>
                            <input type="hidden" name="board_id" value=<%=boardData[a][2]%>
                    
                            <input type="hidden" name="id_value" value=id/>
                        </td>
                        <td>
                        
                            <input type="submit" name="board_title" value=<%=boardData[a][0]%>
                        </td>
                        <td><%=boardData[a][1]%><input type="hidden" name="id_value" value=<%=boardData[a][1]%></td>
                        <td><%=boardData[a][3]%><input type="hidden" name="board_date" value=<%=boardData[a][3]%></td>
                        <td><input type="hidden" name="board_cont" value=<%=boardData[a][4]%></td>
                        
                    </tr>
                </form>
            <% } %>
        </tbody>
    </table>

    <form action="doneBoard.jsp" method="post">
        <p>게시글쓰기</p>
        <textarea placeholder="제목" name="board_title"></textarea>
        <textarea placeholder="내용" name="board_cont"></textarea>
        <input type="hidden" value='<%=id%>' name="id_value"> 
        <input type="submit" value="완료">

    </form>
    <script>
        
    </script>
</body>