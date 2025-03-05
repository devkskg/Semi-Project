<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 채팅방</title>
<style>
	/* 큰 틀 */
	.chat-container {
    display: flex;
    flex-direction: column;
    width: 100%;
    max-width: 800px; /* 채팅 창 최대 크기 */
    margin: 0 auto;
	}
	/* 메세지 공용 */
	.message {
	    max-width: 60%; /* 말풍선 최대 너비 */
	    padding: 10px;
	    margin: 5px;
	    border-radius: 10px;
	    font-size: 16px;
	    word-wrap: break-word;
	}
	
	/* 왼쪽 정렬 메시지 */
	.message.left {
	    align-self: flex-start;
	    background-color: #f1f1f1;
	    border: 1px solid #ddd;
	}
	
	/* 오른쪽 정렬 메시지 */
	.message.right {
	    align-self: flex-end;
	    background-color: #d1e7ff;
	    border: 1px solid #a3c4f3;
	}
</style>
</head>
<body>
	<div class="chat-container">
	    <div class="message left">안녕하세요! 어떻게 도와드릴까요?</div>
	    <div class="message right">안녕하세요! 질문이 있습니다.</div>
	    <div class="message left">네, 질문해주세요.</div>
	    <div class="message right">이 코드가 맞나요?</div>
	</div>
	
</body>
</html>