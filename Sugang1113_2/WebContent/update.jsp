<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 도우미 사이트</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<form action="updatePro.jsp" method="post">
<div class="header">
<h2>수강신청 도우미 사이트</h2>
<%
request.setCharacterEncoding("UTF-8");
DAO dao_sub=DAO.getInstance();
String id=request.getParameter("id");
JoinVO vo = dao_sub.sendSubid(id);

ArrayList<lecturerVO> lelist = dao_sub.getLecturer();
%>
</div>
<div class="section">
<form action="updatePro.jsp" method="post" name="update">
<p>교과목 추가</p>
<table border="1">
	<tr>
		<td>교과목코드</td>
		<td><input type="text" id="subcode" name="subcode" value="<%=vo.getId()%>"></td>
	</tr>
	<tr>
		<td>과목명</td>
		<td><input type="text" id="subname" name="subname" value="<%=vo.getName()%>"></td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
		<select name="sublecturer">
			<option value="">담당강사선택</option>
			<%for(lecturerVO l:lelist){ 
			if(l.getName().equals((vo.getLecturer()))){
			%><option value="<%=l.getIdx()%>" selected><%=l.getName() %></option>
			<%}else{ %>
			<option value="<%=l.getIdx() %>"><%=l.getName() %></option>
			<%}} %>
		</select>
		</td>
	</tr>
	<tr>
		<td>학점</td>
		<td><input type="text" id="subcredit" name="subcredit" value="<%=vo.getCredit()%>"></td>
	</tr>
	<tr>
		<td>요일</td>
		<td>
				 
				<input type="radio" name="days" value="<%=vo.getWeek() %>"
				<%if(vo.getWeek().equals("1")){%>
				checked 
				<%} %>
				>월
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("2")){ %>checked<%} %>
				>화
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("3")){ %>checked<%} %>
				>수
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("4")){ %>checked<%} %>
				>목
				<input type="radio" name="days" value="<%=vo.getWeek()%>"
				<%if(vo.getWeek().equals("5")){ %>checked<%} %>>금</td> 
	</tr>
	<tr>
		<td>시작</td><td><input type="text" id="starttime" name="starttime" value="<%=vo.getStart_hour()%>"></td>
	</tr>
	<tr>
		<td>종료</td><td><input type="text" id="endtime" name="endtime" value="<%=vo.getEnd_end()%>"></td>
	</tr>	
</table>
</form>
<input type="button" value="목록" onclick="location.href='index.jsp'" class="gotolist" name="gotolist" id="gotolist">
<input type="button" value="취소" onclick="location.rhef='update.jsp'" class="cancel" name="cancel" id="cancel">
<input type="submit" value="완료" class="update" name="update" id="update">
</div>
<div class="footer">
<p>Copyright&copy;2018 정보처리산업기사 All Right Reserved</p>
</div>
</body>
</html>