<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.email.vo.EmailVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
MemberVO userVO = (MemberVO) session.getAttribute("userVO");

List<EmailVO> emailList = new ArrayList<>();

StringBuilder sql = new StringBuilder();
sql.append("select no, sender, receiver, title, content, to_char(reg_date, 'yyyy-mm-dd') reg_date ");
sql.append("  from mail ");
sql.append(" where receiver = ? ");
sql.append("    or sender = ? ");
sql.append(" order by no desc ");
try (Connection conn = new ConnectionFactory().getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
	pstmt.setString(1, userVO.getId());
	pstmt.setString(2, userVO.getId());
	ResultSet rs = pstmt.executeQuery();

	while (rs.next()) {
		int no = rs.getInt("no");
		String sender = rs.getString("sender");
		String receiver = rs.getString("receiver");
		String title = rs.getString("title");
		String content = rs.getString("content");
		String regdate = rs.getString("reg_date");

		EmailVO email = new EmailVO(no, sender, receiver, title, content, regdate);
		emailList.add(email);
	}

} catch (Exception e) {
	e.printStackTrace();
}

// 공유영역 등록
pageContext.setAttribute("emailList", emailList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = 'WriteForm.jsp'
		})
	})

	let goDetail = function(emailNo) {
		<c:if test="${ not empty userVO }">
		location.href = 'detail.jsp?no=' + emailNo
		</c:if>

		<c:if test="${ empty userVO }">
		if (confirm('로그인 후 사용가능합니다.\n 로그인페이지로 이동하시겠습니까?'))
			location.href = '/Email-WEB/login/login.jsp'
		</c:if>

	}

	/*
	window.onload = function() {
		let btn = document.querySelector('#addBtn')
		btn.addEventListener('click', function() {
			location.href = 'writeForm.jsp'
		})
	}
	 */
</script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메일함</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<br>
			<hr>
			<h2>메일함</h2>
			<hr>
			<br>
			<table border="1" style="width: 100%;" class="listodd">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="17%">보낸사람</th>
					<th width="17%">받는사람</th>
					<th>내용</th>
					<th width="20%">날짜</th>
				</tr>
				<c:forEach items="${ emailList }" var="email">
					<tr>
						<td>${ email.no }</td>
						<td><a href="javascript:goDetail(${ email.no })"> <c:out
									value="${ email.title }" />
						</a></td>
						<td>${ email.sender }</td>
						<td>${ email.receiver }</td>
						<td>${ email.content }</td>
						<td>${ email.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<c:if test="${ not empty userVO }">
				<button id="addBtn">메일쓰기</button>
			</c:if>
		</div>
	</section>
	<footer>
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>
