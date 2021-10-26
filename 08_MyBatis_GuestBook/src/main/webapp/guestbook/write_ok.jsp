<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.helloworld.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 저장 (INSERT)
	입력성공시 : 목록페이지로 이동(list.jsp)
	입력실패시 : (예외발생) 메세지표시 후 이전 화면(입력페이지) 이동
	 --%>
<%
// 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 파라미터 추출 후 VO에 저장
%>
	<jsp:useBean id="guestbookVO" class="com.helloworld.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO" />
<%	
	System.out.println(">> guestbookVO : " + guestbookVO);
	
	// SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true); // 자동 커밋 상태로 세션 객체생성
	
	// SqlSession객체를 사용해서 Mapper의 Insert SQL실행 (VO 데이터 전달)
	try {
		ss.insert("guestbook.insert", guestbookVO);
		// 정상처리 된 경우 
%>
	<script>
		alert("장상입력되었습니다.\n목록페이지로 이동합니다.");
		location.href="list.jsp"
	</script>
<%
	} catch (Exception e) {
		System.out.println(">> [예외발생] 입력작업중 오류 발생");
		e.printStackTrace();
%>
	<script>
		alert("[예외발생] 입력중 예외가 발생했습니다.\n" + 
				"담당자에게 연락하세요\n" + 
				"이전페이지로 이동합니다.");
		history.back();
	</script>
<%		
	} finally {
		ss.close();
	}
	
	
	// 페이지 이동 처리


%>