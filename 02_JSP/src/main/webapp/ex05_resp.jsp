<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%-- 전달받은 데이터를 사용해서 계산처리 후 결과를 테이블 형태로 작성 --%>
<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int total = kor + eng + math;
	double avg = total * 100 / 3 / 100.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리결과(응답페이지)</title>
</head>
<body>
	<h2>성적처리결과</h2>
	<table border>
		<thead>
			<tr>
				<th colspan="2">성적처리결과</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>이름</th>		
				<td><%=name %></td>		
			</tr>
			<tr>
				<th>국어</th>		
				<td><%=kor %></td>		
			</tr>
			<tr>
				<th>영어</th>		
				<td><%=eng %></td>		
			</tr>
			<tr>
				<th>수학</th>		
				<td><%=math %></td>		
			</tr>
			<tr>
				<th>총점</th>		
				<td><%=total %></td>		
			</tr>
			<tr>
				<th>평균</th>		
				<td><%=avg %></td>		
			</tr>
		</tbody>
	</table>
</body>
</html>