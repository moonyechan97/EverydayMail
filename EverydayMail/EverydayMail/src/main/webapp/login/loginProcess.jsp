<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
	작업순서
	1. 파라미터 추출(id, password)
	2. DB(t_member)에서 파라미터에 해당하는 회원존재여부 판단
	3. 판단결과에 따라 결과를 출력
	   로그인 성공  =>  index.jsp 이동
	   로그인 실패  =>  login.jsp 이동
 --%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

MemberVO loginVO = new MemberVO();
loginVO.setId(id);
loginVO.setPw(pw);

MemberDAO memberDao = new MemberDAO();
MemberVO userVO = memberDao.login(loginVO);

String url = "";
String msg = "";
if (userVO == null) {
	// 로그인 실패
	url = "login.jsp";
	msg = "아이디 또는 패스워드를 잘못입력하셨습니다";

} else {
	// 로그인 성공
	url = "/Email-WEB/email/list.jsp";
	msg = userVO.getName() + "님 환영합니다";

	// 세션등록
	session.setAttribute("userVO", userVO);
}

pageContext.setAttribute("url", url);
pageContext.setAttribute("msg", msg);
%>
<script>
	alert('${ msg }')
	location.href = '${ url }'
</script>