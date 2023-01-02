<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장을 쓰기위해 작성 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" /> <!-- 한명의 회원의 정보를 담는 member라는 클래스를 자바빈즈로서 사용 -->
<jsp:setProperty name="member" property="userID" /> 
<jsp:setProperty name="member" property="userPassword" />
<jsp:setProperty name="member" property="userName" /> 
<jsp:setProperty name="member" property="userGender" />
<jsp:setProperty name="member" property="userEmail" /> 



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>JSP 로그인 웹 사이트</title>
</head>
<body>
	<%
		if(member.getUserID() ==null || member.getUserPassword()==null ||
			member.getUserName()==null||member.getUserGender()==null || 
			member.getUserEmail()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>"); 
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); // 이전페이지로 이동
			script.println("</script>");
		}else{
			MemberDAO memberDAO = new MemberDAO();
			int result = memberDAO.join(member);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>"); 
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()"); // 이전페이지로 이동
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>"); 
				script.println("location.href='main.jsp'"); // 
				script.println("</script>");
			}
		}
		
		
	
	%>
</body>
</html>