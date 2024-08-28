<%@page import="kr.ac.kopo.email.vo.EmailFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.email.vo.EmailVO"%>
<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int no = Integer.parseInt(request.getParameter("no"));

EmailDAO emailDao = new EmailDAO();
EmailVO email = emailDao.selectByNo(no);
System.out.println(email);
System.out.println("no : " + no);

pageContext.setAttribute("email", email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script>
	let doAction = function(type) {
		switch (type) {
		case 'L':
			location.href = "list.jsp"
			break
		case 'D':
			if (confirm('${param.no}번 게시물을 삭제하시겠습니까요?'))
				location.href = "delete.jsp?no=${ param.no }"
			break
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<br>
			<hr>
			<h2>메일읽기</h2>
			<hr>
			<br>
			<table style="width: 100%" border="1">
				<tr>
					<th width="25%">번호</th>
					<td>${ email.no }</td>
				</tr>
				<tr>
					<th width="25%">제목</th>
					<td>${ email.title }</td>
				</tr>
				<tr>
					<th width="25%">보낸사람</th>
					<td>${ email.sender }</td>
				</tr>
				<tr>
					<th width="25%">받는사람</th>
					<td>${ email.receiver }</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>${ email.content }</td>
				</tr>
				<tr>
					<th width="25%">날짜</th>
					<td>${ email.regDate }</td>
				</tr>
				<c:if test="${ not empty fileList }"></c:if>
				<tr>
					<th>첨부파일</th>
					<td><c:forEach items="${ fileList }" var="file">
							<a href="/Email-WEB/upload/${ file.fileSaveName }"> ${ file.fileOriName }
							</a>
						(${ file.fileSize } bytes)
						<br>
						</c:forEach></td>
				</tr>
			</table>
			<br>
			<button onclick="doAction('D')">삭 제</button>
			<button onclick="doAction('L')">목 록</button>
		</div>
	</section>
	<footer>
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>
