<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<title>상세게시글</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
	body{
		background-color: #fff !important;
	}
	#board_wrap{
		position: relative;
		width: 100%;
	}
	.board_container{
		position: relative;
		width: 1000px;
		margin: 0 auto;
		padding: 62px 0 0;
		min-width: 900px;
	}
	.board_title{
		display: block;
		width: 100%;
		text-align: center;
		margin: 60px 0 40px;
		line-height: 280%;
	}
	.o_board{
		display: block;
		width: 310px;
		height: 100px;
		margin: 0 auto;
		font-size: 60px;
		text-align: center;
	}
	.board_view_info{
		position: relative;
		padding: 20px;
		border-top: 2px solid #000;
		border-bottom: 1px solid #ddd; 
	}
	.view_info_title{
		position: absolute;
		display: inline-block;
		bottom: 14%;
		max-width: 725px;
		font-size: 28px;
		line-height: 37px;
	}
	.view_info_user{
		display: flex;
		align-items: center;
		padding-left: 5px;
   		padding-bottom: 15px;
   		border-bottom: 1px solid #dadada;
	}
	.view_info_date{
		display: flex;
		flex-direction: column;
		margin-left: 18px;
	}
	.view_info_date span{
		color: #595959;
		font-size: 15px;
	}
	.updatedate{
		text-decoration: underline #999;
	}
	.view_info1{
		display: flex;
		justify-content: flex-end;
		overflow: hidden;
		font-size: 20px;
		font-weight: 400;
		padding-bottom: 20px;
	}
	.view_info2{
		display: flex;
		justify-content: flex-end;
		font-size: 15px;
	}
	.view_info2 div{
		margin-left: 10px;
	}
	.view_info2 div span{
		padding-left: 5px;
	}
	.board_view_content{
		padding: 40px 50px 30px;
		text-align: left;
		word-break: break-all;
   		word-wrap: break-word;
   		line-height: 26px;
	}
	.board_view_detail{
		padding-bottom: 20px;
		border-bottom: 2px solid #ddd;		
		display: flex;
   		justify-content: flex-end;
	}
	.board_view_detail > div{
		border-radius: 2px;
		padding: 10px;
		margin-left: 6px;
		color: white;
	}
	.board_view_detail > div > i{
		margin-right: 2px;
	}
	.basic_div_color{
		background-color: #52a7f6;
	}
	.highlight_div_color{
		background-color: #f46665;
	}
	.bounce:hover > i{
    	animation-duration: 1s;
    	animation-name: bounce;
    }
    @keyframes bounce {
	    0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
	    40% {transform: translateY(-30px);}
	    60% {transform: translateY(-20px);}
	} 
	.board_view_btnWrap{
		padding: 25px 0 20px;
	}
	.bd_btn:first-child{
		text-align: left;
    	display: inline-block;
	}
	.btn_wrap2{
		float: right;
	}
	.bd_btn a{
		padding: 12px 16px;
		outline: none;
		background: #f7b8b4;
		color: white;
		border: none;
		text-align: center;
		font-size: 15px;
		border-radius: 2px;
	}
	/* 댓글 */
	.board_reply{
		margin-top: 50px;
		width: 990px;
		margin-left: 5px;
	}
	.bd_reply_title{
		margin: 5px 0 10px;
		padding-top: 8px;
		padding-left: 3px;
  		border-top: 1px solid #dadada;
  		display: flex;
  		align-items: center;
  		justify-content: space-between;
	}
	.bd_reply_title > span{
    	color: #999;
    	font-size: 13px;
    	cursor: pointer;
    	border: 1px solid #dadada;
    	border-radius: 5px;
    	padding: 2px 5px;
	}
	.bd_reply_title > span > i{
		margin-right: 2px;
	}
	.bd_reply_text_box{
		margin-top: 10px;
		padding: 10px 10px 10px 20px;
		border: 1px solid #dadada;
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	.reply_nologin_txt{
		justify-content: center;
	}
	textarea{
		overflow: hidden;
		height: 80px;	
		width: 90%;
		resize: none;
		outline: none;
   		border: none;
   		font-size: 14px;
   		line-height: 20px;
    	letter-spacing: 1px;
	}
	.reply_insert > a{
		padding: 29px 33px;
		cursor: pointer;
	}
	.reply_text{
		position: relative;
		border: 2px solid #dadada;
		border-radius: 60px;
		padding: 10px 40px;
		margin: 0 0 12px;
		min-width: 70%;
		display: inline-block;		
	}
	.rereply_text{
		margin: 0 0 10px 32px;
	}
	.rereply_text::before{
		content: "";
		position: absolute;
		display: inline-block;
		top: 0;
		left: -21px;
		width: 16px;
		height: 16px;
		border: 1px solid #262626;
		border-width: 0 0 1px 1px;
		border-radius: 0 0 0 2px;
		/*display: none;*/
	}
	.reply_txt_user{
		font-size: 15px;
		padding: 0 2px 1px;
		border-bottom: 1px solid #dadada;
		display: inline-block;
	}
	.reply_txt_content{
		margin: 5px 0 2px 7px;
	}
	.reply_txt_detail{
		float: right;
		font-size: 13px;
   		line-height: 16px;
	}
	.reply_txt_detail span:last-child{
		color: #f46665;
		cursor: pointer;
	}
	.reply_btn{
		border: 1px solid #dadada;
		padding: 2px 4px 2px 3px;
		margin-left: 5px;
		color: #8e8e8e;
		font-size: 12px;
		cursor: pointer;
	}
	#reply_login{
		text-decoration: underline #888;
	}
	#reply_login:hover{
		color : #f46665;
		text-decoration: underline;
		cursor: pointer;
	}
	.board_err_msg{
		color: #f24443;
		text-align: left;
		margin: 3px 0 0 12px;
		visibility: hidden;
	}
	.displayNone{
		display: none;
	}
</style>
</head>
<body>
	<%@ include file="../include/modal.jsp" %> 
	<div id="board_wrap">
		<div class="board_container">
			<div class="board_title">
				<h1 class="ohyoyo_board">
					<a href="${path}/board/list?type=free" class="o_board">회원게시판</a>
				</h1>
			</div>
			<div class="board_view">
				<div class="board_view_info">
					<div class="view_info_title">${one.title}</div>
					<div class="view_info1">
						<div class="view_info_user">
							<span>${one.name}</span>
							<div class="view_info_date">
								<span><fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;작성</span>
								<c:if test="${one.regdate != one.updatedate}">
									<span class="updatedate"><fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;수정</span>
								</c:if>
							</div>	
						</div>
					</div>
					<div class="view_info2">
						<div><strong>조회</strong><span>${one.viewcnt}</span></div>
						<div><strong>추천</strong><span>${one.goodcnt}</span></div>
					</div>
				</div>
				<div class="board_view_content">
					<div>${one.view_content}</div>
				</div>
				<div class="board_view_detail">
					<div class="basic_div_color displayNone">댓글<span>1</span></div>
					<div class="basic_div_color">첨부</div>
					<div class="basic_div_color"><i class="far fa-thumbs-up"></i>추천</div>
					<div class="highlight_div_color"><i class="fas fa-ban"></i>신고</div>
				</div>
				<div class="board_view_btnWrap">
					<div class="bd_btn">
						<a href="${header.referer}" class="list_btn">목록</a>
						<a href="${path}/board/answer?bno=${one.bno}">답글</a>
					</div>
					<c:if test="${userid == one.writer}">
						<div class="bd_btn btn_wrap2">
							<a href="${path}/board/update?bno=${one.bno}">수정</a>
							<a href="#" class="delete_btn">삭제</a>
						</div>
					</c:if>
				</div>
			</div>
			<!-- 댓글창 -->
			<div id="listReply"></div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
<script type="text/javascript">
	
	$(function(){
		// 자바스트립트 내장함수 : setInterval(이걸 실행하라, 이시간에 한번씩 )
		setInterval(refreshReply, 180000);
		
		// 댓글 출력
		listReply();

		//  삭제버튼클릭시 모달창 open
		$('.delete_btn').click(function(){
			$('.modal_wrap').css('display', 'flex');
		});
		
		// 삭제알림 모달창에서 확인버튼  click -> 게시글 삭제
		$('#modal_yes_btn').click(function(){
			location.href='${path}/board/delete?bno=${one.bno}';
		});
	});
	
	// 1. 사용자가 댓글을 입력하고 댓글등록버튼을 클릭
	$(document).on('click', '.reply_insert', function(){
		// 2. reply_txt라고 변수에 사용자가 입력한 댓글내용을 받는것
		var reply_txt = $('.reply_textarea').val().trim();
		// alert(reply_txt);
		
		// 3. 조건문
		if(reply_txt == '' || reply_txt.length == 0){
			$('.reply_textarea').focus();
			$('.board_err_msg').css('visibility','visible');
			return false;
		}
		
		$('.reply_bno').val('${one.bno}');
		$('.reply_type').val('${one.type}');
		$('.reply_writer').val('${userid}');
		var one = 10
		var two = 20
		
		$.ajax({
			url: '${path}/reply/insert',
			type: 'POST',
			data: $('.frm_reply').serialize(),
			success: function(){
				listReply();
			}
		});
	});
	$(document).on('click', '.reply_refresh_btn', function(){
		listReply();
	});
	
	$(document).on('click', '.reply_delete', function(){
		var rno = $(this).attr('data_num');
		var bno = ${one.bno};
		
		$.ajax({
			url: '${path}/reply/delete',
			type: 'POST',
			data: {'rno': rno, 'bno': bno},
			success: function(){
				listReply();
			}
		});
	});
	
	// 목록 클릭시 비정상 정상 확인해서 보내기
	$(document).on('click','.list_btn',function(){
		var referer = '${header.referer}';
		var index = referer.indexOf('/board/list');
		if(index == -1){
			$('.list_btn').attr('href','${path}/board/list');
		} 
	});
	// 댓글목록 출력 함수
	// 댓글이 바뀔때마다 출력시켜야 하므로
	function listReply(){
		$.ajax({
			type: 'get',
			url: '${path}/reply/list?bno=${one.bno}',
			async: false,
			success: function(result){
				// result : responseText 응답텍스트 (html)
				$('#listReply').html(result);
			}
		});
		
		// 게시글의 댓글수 수정
		$('.basic_div_color > span').text($('.replyListCnt').val());
	}
	
	function refreshReply(){
		listReply();
	}
</script>
</html>