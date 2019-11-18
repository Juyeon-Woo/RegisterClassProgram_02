<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	DAO sub_dao=DAO.getInstance();
	String id=request.getParameter("id");
	JoinVO vo = new JoinVO();
	vo.setId(id);
	int rs = sub_dao.delete(vo);
%>
</body>
</html>