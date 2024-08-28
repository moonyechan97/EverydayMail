<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>

	<section>
		<div align="center">
			<hr>
			<h2>전체메일함</h2>
			<hr>
			<br>
			<table border="1" style="width: 80%;">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="17%">작성자</th>
					<th width="20%">등록일</th>
				</tr>
				<c:forEach items="${ emailList }" var="email">
					<tr>
						<td>${ email.no }</td>
						<td><a href="detail.jsp? no=${ emailList }"> ${ email.sender }
						</a></td>
						<td>${ email.receiver }</td>
						<td>${ email.title }</td>
						<td>${ email.content }</td>
						<td>${ email.regdate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<button id="addBtn">메일쓰기</button>
		</div>
	</section>

	<footer>
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>