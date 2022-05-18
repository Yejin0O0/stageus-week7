<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
</head>
<body>
    <form action="board.jsp" method="post">
        <input type="text" name="id_value" placeholder="id">
        <input type="password" name="pw_value" placeholder="pw">
        <input type="submit" value="로그인">
    </form>

    <a href="join.jsp">회원가입 하기</a>
</body>