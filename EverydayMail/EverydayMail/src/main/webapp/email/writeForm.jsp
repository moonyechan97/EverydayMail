<%@ page import="kr.ac.kopo.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script>

	if("${ userVO.id }" == '') {
		location.href = '/Email-WEB/login/login.jsp'
	}

	let isNull = function(obj, msg) {
		if(obj.value == '') {
			alert(msg)
			obj.focus()
			return true
		}
		return false
	}

	let checkForm = function() {
		
		let f = document.inputForm
		
		if(f.title.value == '') {
			alert('제목을 입력해주세요')
			f.title.focus()
			return false
		}
		
		if(isNull(f.content, '내용을 입력해주세요')) 
			return false
		
		if(checkEXt(f.attachfile1))
			return false
		if(checkExt(f.attachfile2))
			return false
		
		return true
	}
	
	let checkExt = fuction(obj) {
		let forbidName = ['exe', 'bat', 'java', 'class', 'jsp']
		let fileName = obj.value
		let ext = fileName.substring(fileName.lastIndexof('.') + 1)
		
	for(let forbid of forbidName) {
		if(forbid == ext) { 
			alert('[${ ext }] 확장자는 파일 업로드 정책에 위배됩니다')
			return true
			}
		}
		return false	
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
			<h2>메일쓰기</h2>
			<hr>
			<form name="inputForm" action="Write.jsp" method="post"
				enctype="multipart/form-data" onsubmit="return checkForm()">
				<input type="hidden" name="sender" value="${ userVO.id }">
				<table style="width: 100%" border="1">
					<tr>
						<th width="25%">받는사람</th>
						<td><input type="text" name="receiver" size="80"></td>
					</tr>
					<tr>
						<th width="25%">작성자</th>
						<td><c:out value="${ userVO.id }" /> <%-- <input type="text" name="writer" size="80" 
							value="${ userVO.id }" readonly> --%></td>
					</tr>
					<tr>
						<th width="25%">제목</th>
						<td><input type="text" name="title" size="80"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="7" cols="80" name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="attachfile1"><br> <input
							type="file" name="attachfile2"><br></td>
					</tr>
				</table>
				<br>
				<button type="submit">등 록</button>
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>