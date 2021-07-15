<%@ page import = "com.javaEdu.ex.dto.MemberDto" %>
<%@ page import = "com.javaEdu.ex.dao.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/* post로 날린 값을 받는다 */
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = MemberDao.getInstance();
	int checkNum = dao.userCheck(id, pw);
	if(checkNum == -1){
%>
	<script language = "javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
<%
	} else if (checkNum == 0) {
%>
	<script language = "javascript">
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>
<%
	} else if (checkNum == 1){
		MemberDto dto = dao.getMember(id); //회원 객체를 만들어서 반환 
		
		if(dto == null) {
%>
	<script language = "javascript">
		alert("존재하지 않는 회원 입니다.");
		history.go(-1);
	</script>
<%
		} else {
			String name = dto.getName();
			session.setAttribute("id",id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem","yes");
			response.sendRedirect("main.jsp");
		}
	}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>