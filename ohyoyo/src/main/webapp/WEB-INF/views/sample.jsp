<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
	<!-- <a href="${path}/sample/view">GET으로 보내요 호호호</a> --> 
	<a href="${path}/sample/view?user=집요정 도비&pass=12345">GET</a>
	<form action="${path}/sample/view" method="POST">
		<input type="text" name="user">
		<input type="password" name="pass">		
		<button type="submit">POST로 보내요~~~</button>
	</form>
	<img  src="${path}/resources/img/puppies-2243686_1920.jpg" style="width: 500px; heigth:500px;">
	<br>
	<a href="${path}/sample/sync?name=댕댕이">동기방식</a>
	<button type="button" id="ajax_btn">비동기방식 AJAX</button>
	
	<br>
	<div><span>동기: ${name}</span></div>
	<div><span>비동기: <span id="ajax_txt"></span></span></div>
</body>
<script type="text/javascript">
	$('#ajax_btn').on('click',function(){
		// type: GET or POST
		// URL: 서버단 목적지(RequestMapping으로 받는 요청)
		// contentType: 서버단으로 전송하는 데이터의 타입
		// data: 서버로 전송하는 실제 데이터
		// dataType: 서버단에서 View단으로 전송하는 데이터타입 (생략, dafault: String) 
		// success: AJAX성공했을때 작업 (function(data): data는 AJAX 서버단 Return값, 이름 변경가능, list, map등 여러값도 받을수있음)
		// error: AJAX실패했을때 작업
		// Json 중괄호 하고 키:밸류 하는 것 {key:value, key:value}
		// 쿼리 스트링 사용가능 url:'${path}/sample/ajax?name=뚱깐징어',
		$.ajax({
			type:'POST',
			url:'${path}/sample/ajax',
			data: {name:'뚱깐징어'},
			success: function(data){
				console.log(": "+data);
				$('#ajax_txt').text(data);
			}, 
			error: function(){
				alert('System ERROR :(');
			}
		});
		
	});
	
</script>
</html>