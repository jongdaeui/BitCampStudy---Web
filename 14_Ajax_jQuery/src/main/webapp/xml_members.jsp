<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#getDataBtn").click(getXmlMembers);
	});
	
	function getXmlMembers() {
		alert(">> getXmlMembers() 실행");
// 		location.href = "getXmlMembers";
		
		$.ajax({
			url : "getXmlMembers",
			type : "get",
			data : "type=" + "commentlist" + "&age=" + age;
// 			date : $("#inputForm").serialize(); // form 데이터 파라미터 전달
			dataType : "xml", //응답 받을 데이터 타입 지정
			success : function(data){
				alert("Ajax 처리 성공 - 응답 데이터 : " + data);
				console.log(data);
				let tbody = "";
				$(data).find("member").each(function(){
					tbody += "<tr>";
					tbody += "<td>" + $(this).find("idx").text() + "</td>";
					tbody += "<td>" + $(this).find("name").text() + "</td>";
					tbody += "<td>" + $(this).find("age").text() + "</td>";
					tbody += "<td>" + $(this).find("addr").text() + "</td>";
					tbody += "<td>" + $(this).find("regdate").text() + "</td>";
					tbody += "</tr>";
				});
				$("#tbody").html(tbody);
			},
			error : function(){
				alert("Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThorwn);
			}
		});
		
	}
</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>
	<button id="getDataBtn">Ajax - XML 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
</body>
</html>