<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장을 쓰기위해 작성 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" /> <!-- 한명의 회원의 정보를 담는 member라는 클래스를 자바빈즈로서 사용 -->
<jsp:setProperty name="member" property="userID" /> 
<jsp:setProperty name="member" property="userPassword" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>JSP 로그인 웹 사이트</title>
</head>
<body>
	<%
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.login(member.getUserID(), member.getUserPassword());
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>"); 
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>"); 
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()"); // 이전페이지로 이동
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>"); 
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()"); // 이전페이지로 이동
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>"); 
			script.println("alert('데이터베이스 오류가 발생하였습니다.')");
			script.println("history.back()"); // 이전페이지로 이동
			script.println("</script>");
		}
	
	%>
</body>
</html>