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
	DAO insert = DAO.getInstance();
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String credit=request.getParameter("credit");
	String lecturer=request.getParameter("lecturer");
	String week=request.getParameter("week");
	String start_hour=request.getParameter("start_hour");
	String end_end=request.getParameter("end_end");
	
	JoinVO vo = new JoinVO();
	vo.setId(id);
	vo.setName(name);
	vo.setCredit(credit);
	vo.setLecturer(lecturer);
	vo.setWeek(week);
	vo.setStart_hour(start_hour);
	vo.setEnd_end(end_end);
	
%>
<script type="text/javascript">
	location.href="index.jsp";
</script>
</body>
</html>