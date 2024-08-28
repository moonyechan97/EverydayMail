<%@page import="kr.ac.kopo.email.vo.EmailFileVO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.email.vo.EmailVO"%>
<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String saveDirectory = "C:/Lecture/web-workspace/Email-WEB/src/main/webapp/Upload";

MultipartRequest multi = new MultipartRequest(request, saveDirectory, 1024 * 1024 * 3, "utf-8",
		new KopoFileNamePolicy());

String sender = multi.getParameter("sender");
String receiver = multi.getParameter("receiver");
String title = multi.getParameter("title");
String content = multi.getParameter("content");

EmailVO email = new EmailVO();
email.setSender(sender);
email.setReceiver(receiver);
email.setTitle(title);
email.setContent(content);

EmailDAO emailDao = new EmailDAO();

int no = emailDao.selectNO();
email.setNo(no);

emailDao.insertEmail(email);

Enumeration<String> files = multi.getFileNames(); // retrun타입이 enumeration
while (files.hasMoreElements()) {
	String fileName = files.nextElement();
	File f = multi.getFile(fileName);
	if (f != null) {
		String fileOriName = multi.getOriginalFileName(fileName);
		String fileSaveName = multi.getFilesystemName(fileName);
		long fileSize = f.length();

		EmailFileVO fileVO = new EmailFileVO();
		fileVO.setFileOriName(fileOriName);
		fileVO.setFileSaveName(fileSaveName);
		fileVO.setFileSize(fileSize);
		fileVO.setEmailNo(no);

		emailDao.insertEmailFile(fileVO);

	}
}
%>

<script>
	// 3단계
	alert('새글등록을 완료하였습니다')
	location.href = "list.jsp"
</script>