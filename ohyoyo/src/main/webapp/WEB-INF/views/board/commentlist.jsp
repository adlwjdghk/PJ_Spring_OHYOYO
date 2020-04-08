<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
	<div class="board_reply">
		<div class="bd_reply_title">
			<input type="hidden" class="replyListCnt" value="${list.size()}">
			<div>댓글&nbsp;<span>${list.size()}</span></div>
			<span class="reply_refresh_btn"><i class="fas fa-sync-alt"></i>새로운 댓글확인</span>
		</div>
		<c:forEach items="${list}" var="rlist">
			<fmt:formatDate value="${rlist.regdate}" pattern="yyyy-MM-dd"
				var="regdate" />
			<div class="reply_text">
				<div class="reply_txt_user">${rlist.name}</div>
					<span class="reply_btn reply_answer" data_num="${rlist.rno}">댓글</span>
					<c:if test="${userid == rlist.writer}">
						<span class="reply_btn reply_delete" data_num="${rlist.rno}">삭제</span>
					</c:if>
				<div class="reply_txt_detail">
					<c:choose>
						<c:when test="${today == regdate}">
							<fmt:formatDate value="${rlist.regdate}" pattern="HH:mm" />
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${rlist.regdate}" pattern="yyyy-MM-dd" />
						</c:otherwise>
					</c:choose>
					<span>신고</span>
				</div>
				<div class="reply_txt_content">${rlist.content}</div>
			</div>
		</c:forEach>
		<c:if test="${list.size() == 0}">
			<div class="reply_text">
				<div class="reply_txt_content">등록된 댓글이 없습니다.</div>
			</div>
		</c:if>
		
		<!-- 대댓글창 
		<div class="reply_text rereply_text">
			<div class="reply_txt_user">haha</div>
			<div class="reply_txt_detail">
				<span>2020-03-20</span> <span>신고</span>
			</div>
			<div class="reply_txt_content">오오오 무슨말인지 모르겠네요</div>
		</div> -->

		<c:choose>
			<c:when test="${empty userid}">
				<div class="bd_reply_text_box reply_nologin_txt">
					<span id="reply_login">로그인</span>을 하셔야 댓글을 작성할 수 있습니다.
				</div>
			</c:when>
			<c:otherwise>
				<form class="frm_reply">
					<input type="hidden" name="bno" class="reply_bno">
					<input type="hidden" name="type" class="reply_type">
					<input type="hidden" name="writer" class="reply_writer">
					<!-- 댓글 등록창 -->
					<div class="bd_reply_text_box">
						<textarea class="reply_textarea" name="content"></textarea>
						<div class=" bd_btn reply_insert">
							<a>등록</a>
						</div>
					</div>
					<div class="board_err_msg">댓글을 입력해주세요.</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<script type="text/javascript">
$(function(){
	// 로그인글자 클릭시 로그인창 출력
	$('#reply_login').click(function(){
		$('.log_modal_wrap').css('display', 'flex');
		$('#login_id').focus();
	});
});
</script>
</html>