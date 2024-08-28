<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="joinstyles.css">
</head>
<body>
    <h2>회원가입</h2>
    <form action="registerProcess.jsp" method="post">
    
        <label for="name">사용자 이름:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="bd">생년월일:</label>
        <input type="text" id="bd" name="bd" required><br><br>

        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required><br><br>
        
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="가입">
    </form>
</body>
</html>