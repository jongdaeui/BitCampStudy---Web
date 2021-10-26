<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax JSON</title>
</head>
<body>
	<h1>Ajax JSON 데이터 요청 처리</h1>
	<hr>
	
<script>
	/*
		XMLHttpRequest.readyState : 데이터 전달 결과 상태를 표시
		0 : 객체생성, open 안한 상태
		1 : open상태, send 안한 상태
		2 : send 진행한 상태, 데이터가 발견되지 않은 상태
		3 : 일부 데이터만 받은 상태
		
		XMLHttpRequest.status : 응답 결과 값
		200(성공), 4xx(클라이언트 오류), 5xx(서버측 오류 - 개발파트)
	*/

	// Javascipt에서 Ajax를 사용할때 XMLHttpRequest 객체 사용
	// 1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	request.onreadystatechange = function(){
		if (request.readyState == 4 && request.status == 200) { // 응답완료 + 정상처리
			alert("리턴 받은 값(문자열) : " + request.responseText);	
			console.log(request.responseText);
			
			// JSON.parse() 사용 : 문자열 ---> JS 객체화
			let json = JSON.parse(request.responseText);
			alert("JSON.parse() 처리후 : " + json);
			console.log(json);
			
			// JSON 객체 데이터 추출
			let output = "";
			for (let i = 0; i < json.length; i++) {
				output += "<h2>";
				output += json[i].name + " : " + json[i]["price"];
				output += "</h2>";
			}
			document.body.innerHTML += output;
		}
	
	};
	
	// 2. open("전송방식", "요청정보", "비동기여부")
	request.open("GET", "data.json", true);
	
	// 3. send() 실행
	request.send();
	
</script>
</body>
</html>