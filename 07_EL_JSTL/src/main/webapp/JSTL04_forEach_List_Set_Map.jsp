<%@page import="com.mystudy.PersonVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : Array, List, Set, Map</h1>
	<h2>Array 출력</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd"};
	<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
	%>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>	
	</c:forEach>
	
	<h3>배열 일부 데이터만 사용</h3>
	<ul>
	<c:forEach var="str" items="${arr }" begin="1" end="2">
		<li>${str }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<h2>List 출력</h2>
	<%
	List<Integer> list= new ArrayList<Integer>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist", list);
	%>
	<ul>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<h2>Set 출력</h2>
	<%
	Set<String> set = new HashSet<>();
	set.add("홍길동");
	set.add("김유신");
	set.add("강감찬");
	set.add("을지문덕");
	set.add("을지문덕");
	pageContext.setAttribute("hset", set);
	%>	
	<p>hset.size() : ${hset.size() }</p>
	<p>hset.contains("홍길동") : ${hset.contains("홍길동") }</p>
	<p>hset.toString() : ${hset.toString() }</p>
	<ol>
		<c:forEach var="name" items="${hset }">
			<li>${name }</li>
		</c:forEach>
	</ol>
	<hr><hr>
	<h1>Map Key - Value 데이터 출력</h1>
	<%
		Map<String, String> map = new HashMap<>();
		map.put("k1", "a");
		map.put("k2", "ab");
		map.put("k3", "abc");
		map.put("k4", "abcd");
		pageContext.setAttribute("hmap", map);
		System.out.print(">> hmap : " + map);
	%>
	<c:forEach var="mapData" items="${hmap }">
		<p>${mapData.key } ::: ${mapData.value }</p>
	</c:forEach>
	<hr><hr>
	
	<h1>VO가 담긴 List 사용</h1>
	<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("홍길동", "27"));
	listBean.add(new PersonVO("김유신", "30"));
	listBean.add(new PersonVO("강감찬", "40"));
	listBean.add(new PersonVO("을지문덕", "50"));
	pageContext.setAttribute("persons", listBean);
	%>
	<%-- (실습) persons에 있는 PersonVO객체의 이름, 나이 출력 --%>
	<c:forEach var="person" items="${persons }">
		<p>이름 : ${person.name }, 나이 : ${person.age }</p>
	</c:forEach>
	<hr>
	<c:forEach var="person" items="${persons }">
		<p>이름 : ${person.getName() } - 나이 : ${person.getAge() }</p>
	</c:forEach>
	
</body>
</html>