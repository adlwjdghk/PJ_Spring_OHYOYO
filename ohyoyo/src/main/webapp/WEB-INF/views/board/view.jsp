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
   		padding-bottom: 15px;
   		border-bottom: 1px solid #dadada;
	}
	.view_info_user span:last-child{
		color: #595959;
		font-size: 15px;
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
		text-align: right;
	}
	.bd_btn:first-child{
		float: left;
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
		padding-top: 14px;
		padding-left: 3px;
  			border-top: 1px solid #dadada;
	}
	.bd_reply_text_box{
		padding: 10px 10px 10px 20px;
		border: 1px solid #dadada;
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	textarea{
		overflow: hidden;
		line-height: 44px;
		height: 80px;	
		width: 90%;
		resize: none;
		outline: none;
   		border: none;
   		font-size: 14px;
	}
	.reply_btn > a{
		padding: 33px 33px;
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
	}
</style>
</head>
<body>
	<div id="board_wrap">
		<div class="board_container">
			<div class="board_title">
				<h1 class="ohyoyo_board">
					<a href="#" class="o_board">회원게시판</a>
				</h1>
			</div>
			<div class="board_view">
				<div class="board_view_info">
					<div class="view_info_title">${one.title}</div>
					<div class="view_info1">
						<div class="view_info_user">
							<span><strong>${one.name}</strong></span>
							<span><fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</div>
					</div>
					<div class="view_info2">
						<div><strong>조회</strong><span>${one.viewcnt}</span></div>
						<div><strong>추천</strong><span>${one.goodcnt}</span></div>
					</div>
				</div>
				<div class="board_view_content">
					<div>${one.content}</div>
				</div>
				<div class="board_view_detail">
					<div class="basic_div_color bounce"><i class="far fa-thumbs-up"></i>추천</div>
					<div class="highlight_div_color"><i class="fas fa-ban"></i>신고</div>
				</div>
				<div class="board_view_btnWrap">
					<div class="bd_btn">
						<a href="#">목록</a>
						<a href="#">답변</a>
					</div>
					<div class="bd_btn">
						<a href="#">수정</a>
						<a href="#">삭제</a>
					</div>
				</div>
			</div>
			<div class="board_reply">
				<div class="bd_reply_title">댓글&nbsp;<span>${one.replycnt}</span></div>
				<div class="reply_text">
					<div class="reply_txt_user">haha</div>
					<div class="reply_txt_detail">
						<span>2020-03-20</span>
						<span>신고</span>
					</div>
					<div class="reply_txt_content">오오오 무슨말인지 모르겠네요</div>
				</div>
				<div class="reply_text rereply_text">
					<div class="reply_txt_user">haha</div>
					<div class="reply_txt_detail">
						<span>2020-03-20</span>
						<span>신고</span>
					</div>
					<div class="reply_txt_content">오오오 무슨말인지 모르겠네요</div>
				</div>
				<div class="reply_text">
					<div class="reply_txt_user">haha</div>
					<div class="reply_txt_detail">
						<span>2020-03-20</span>
						<span>신고</span>
					</div>
					<div class="reply_txt_content">오오오 무슨말인지 모르겠네요</div>
				</div>
				<div class="reply_text">
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
		</div>
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
</html>