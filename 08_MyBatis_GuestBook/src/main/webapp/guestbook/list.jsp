<%@page import="com.helloworld.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.helloworld.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- DB에서 전체데이터 조회 후 화면 출력 --%>
<%
	// DB에서 전체데이터 조회 후 화면 출력
 	/*
 	openSession(true) : Auto Commit 상태로 Session 객체 생성(SQL문장 싱행 후 Auto Commit)
 	openSession(), openSession(false) : Auto Commit 해제 상태(트랜잭션 처리 필요)
 		- insert, update, delete 작업 후 명시적으로 commit 처리 필요
 	*/
	// 1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();

	// 2. Mapper의 SQL실행해서 데이터 가져오기
	// SqlSession selectList(Mapper.id) : select 결과를 List 타입으로 저장
	// SqlSession selectOne(Mapper.id) : select 결과가 한개 (1, 0)인 경우
	List<GuestbookVO> list = ss.selectList("guestbook.all");
	ss.close();
	
	pageContext.setAttribute("attr_list", list);
	// 3. SQL문 실행 후 받은 데이터 화면 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<style>
	#container {
		width: 512px; margin: auto;
/* 		border: 1px solid blue; */
	}
	
	#container h2 { text-align: center; }
	#container p { text-align: center; }
	#container table {
		width: 100%; 
		border: 1px solid black;
		border-collapse: collapse;		
	}
	#container th {
		background-color: #9cf;
		border: 1px solid black;
	}
	#container td { border: 1px solid black; 1}
	#container .center { text-align: center; }
	
</style>
</head>
<body>
	<div id="container">
		<h2>방명록</h2>
		<hr>
		<p><a href="write.jsp">[방명록쓰기]</a></p>
		<table>
		<colgroup>
			<col width="10%">
			<col width="50%">
			<col width="20%">
		</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
<!-- 				<tr> -->
<!-- 					<td class="center">1</td> -->
<!-- 					<td class="center">홍일동</td> -->
<!-- 					<td>제목1</td> -->
<!-- 					<td>2021/09/27</td> -->
<!-- 				</tr> -->
			<c:if test="${not empty attr_list }">
				<c:forEach var="vo" items="${attr_list }">
					<tr>
						<td class="center">${vo.idx }</td>
						<td>
							<a href="onelist.jsp?idx=${vo.idx }">${vo.subject }</a>
						</td>
						<td class="center">${vo.name }</td>
						<td>${vo.regdate.substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			
<%-- 			<c:if test="${attr_list.size() <= 0 }"> --%>
			<c:if test="${empty attr_list }">
				<tr>
					<td colspan='4'>검색된 데이터가 없습니다.</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>


</body>
</html>