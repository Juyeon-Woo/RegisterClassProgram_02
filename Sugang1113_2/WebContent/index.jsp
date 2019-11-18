<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 도우미 사이트</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<form action="insert.jsp" method="post">
<%
DAO sub_dao=DAO.getInstance();
ArrayList<JoinVO> lista=sub_dao.listall();

%>
<div class="header">
<h2>수강신청 도우미 사이트</h2>
</div>
<div class="section">
<p>총 <%=sub_dao.countId() %>개의 교과목이 있습니다.</p>
<table border="1">
	<tr>
		<td>과목코드</td>
		<td>과목명</td>
		<td>학점</td>
		<td>담당강사</td>
		<td>요일</td>
		<td>시작시간</td>
		<td>종료시간</td>
		<td>관리</td>
	</tr>
	<%for(JoinVO e:lista){ %>
	<tr>
		<td><%=e.getId() %></td>
		<td><%=e.getName() %></td>
		<td><%=e.getCredit() %></td>
		<td><%=e.getNname() %></td>
		<td><%=e.getWeek() %></td>
		<td><%=e.getStart_hour() %></td>
		<td><%=e.getEnd_end() %></td>
		<td><a href="update.jsp?id=<%=e.getId() %>">수정</a>/<a href="deletePro.jsp?=id=<%=e.getId() %>">삭제</a></td>
	</tr>
	<%} %>
</table>
</form>
<input type="submit" value="작성" class="write" name="write" id="write">
</div>
<div class="footer">
<p>Copyright&copy;2018 정보처리산업기사 All Right Reserved</p>
</div>
</body>
</html>