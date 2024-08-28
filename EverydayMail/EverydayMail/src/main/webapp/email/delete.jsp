<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));

	EmailDAO boardDao = new EmailDAO();
%>

<script>
	alert('${param.no}번 게시물이 삭제되었습니다 !!')
	location.href = 'list.jsp'
</script>