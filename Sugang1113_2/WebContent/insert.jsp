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
<%
DAO ddao=DAO.getInstance();
ArrayList<lecturerVO> leclist = ddao.getLecturer();
%>
<form action="insertPro.jsp" method="post" name="finish">
<div class="header">
<h2>수강신청 도우미 사이트</h2>
</div>
<div class="section">
<p>교과목 추가</p>

<table border="1">
	<tr>
		<td>교과목코드</td>
		<td><input type="text" id="subcode" name="subcode" value=""></td>
	</tr>
	<tr>
		<td>과목명</td>
		<td><input type="text" id="subname" name="subname" value=""></td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
		<select name="sublecturer">
			<option value="">담당강사선택</option>
			<%for(lecturerVO l : leclist){ %>
			<option value="<%=l.getIdx() %>"><%=l.getName() %></option>
			<%} %>
		</select>
		</td>
	</tr>
	<tr>
		<td>학점</td>
		<td><input type="text" id="subcredit" name="subcredit" value=""></td>
	</tr>
	<tr>
		<td>요일</td>
		<td>
		<input type="radio" name="days" value="1">월
		<input type="radio" name="days" value="2">화
		<input type="radio" name="days" value="3">수
		<input type="radio" name="days" value="4">목
		<input type="radio" name="days" value="5">금
		<input type="radio" name="days" value="6">토
		</td>
	</tr>
	<tr>
		<td>시작</td><td><input type="text" id="starttime" name="starttime" value=""></td>
	</tr>
	<tr>
		<td>종료</td><td><input type="text" id="endtime" name="endtime" value=""></td>
	</tr>	
</table>
</form>
<input type="button" value="목록" onclick="location.href='index.jsp'" class="gotolist" name="gotolist" id="gotolist">
<input type="submit" value="작성" class="finish" name="finish" id="finish">
</div>
<div class="footer">
<p>Copyright&copy;2018 정보처리산업기사 All Right Reserved</p>
</div>
</body>
</html>