<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("utf-8");


String name = request.getParameter("name");
String bd = request.getParameter("bd");
String id = request.getParameter("id");
String pw = request.getParameter("password");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbUser = "C##EDU_USER";
String dbPassword = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, dbUser, dbPassword);

    String sql = "INSERT INTO MEMBER VALUES (?, ?, ?, ?)";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, name);
    pstmt.setString(2, bd);
    pstmt.setString(3, id);
    pstmt.setString(4, pw);

    int result = pstmt.executeUpdate();

    if (result > 0) {
        out.println("<h3>회원가입 성공!</h3>");
    } else {
        out.println("<h3>회원가입 실패. 다시 시도해 주세요.</h3>");
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("<h3>오류가 발생했습니다: " + e.getMessage() + "</h3>");
} finally {
    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
<script>
	alert('회원가입이 완료되었습니다')
	location.href = "/Email-WEB/login/login.jsp"
</script>