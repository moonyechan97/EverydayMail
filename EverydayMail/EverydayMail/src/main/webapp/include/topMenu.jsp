<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2"><a href="/Email-WEB">
				<div style="height: 60px; width: 200px; text-align: center;">
					<img src="/Email-WEB/resources/images/quickie-jpeg-example.jpg">

				</div>
		</a></td>
		<td align="right"><c:if test="${ not empty userVO }"></c:if> [${ userVO.name }(${ userVO.id })]님
			로그인 중...</td>
	</tr>
	<tr>
		<td><c:choose>
				<c:when test="${ empty userVO }">
					<a href="/Email-WEB/join/register.jsp">회원가입 </a>|
			<a href="/Email-WEB/login/login.jsp"> 로그인 </a>|
			</c:when>
				<c:otherwise>
					<a href="/Email-WEB/login/logout.jsp"> 로그아웃</a>
				</c:otherwise>
			</c:choose></td>
	</tr>
</table>