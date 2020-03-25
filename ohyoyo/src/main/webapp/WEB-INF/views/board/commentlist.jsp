<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div class="board_reply">
		<div class="bd_reply_title">댓글&nbsp;<span>${list.size()}</span></div>
		<c:forEach items="${list}" var="rlist">
			<fmt:formatDate value="${rlist.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
			<div class="reply_text">
				<div class="reply_txt_user">${rlist.name}</div>
				<div class="reply_txt_detail">
					<c:choose>
						<c:when test="${today == regdate}">
							<fmt:formatDate value="${rlist.regdate}" pattern="HH:mm"/>									
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${rlist.regdate}" pattern="yyyy-MM-dd"/>
						</c:otherwise>
					</c:choose>
					<span>신고</span>
				</div>
				<div class="reply_txt_content">${rlist.content}</div>
			</div>
		</c:forEach>
		<div class="reply_text rereply_text">
			<div class="reply_txt_user">haha</div>
			<div class="reply_txt_detail">
				<span>2020-03-20</span>
				<span>신고</span>
			</div>
			<div class="reply_txt_content">오오오 무슨말인지 모르겠네요</div>
		</div>
	    <div class="bd_reply_text_box">
            <textarea placeholder="댓글을 입력하세요."></textarea>
            <div class=" bd_btn reply_btn"><a href="#">등록</a></div>
        </div>
		
	</div>
</body>
</html>