<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
</head>
<body>
    <form action="doneJoin.jsp" method="post">
        <input type="text" name="id_value" placeholder="아이디">
        <input type="password" name="pw_value" placeholder="비밀번호">
        <input type="text" name="name_value" placeholder="이름">
        <input type="text" name="mail_value" placeholder="메일">
        <input type="tel" name="num_value" placeholder="번호">

        <input type="submit" value="로그인">
    </form>
</body>