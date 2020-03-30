<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록수정</title>
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
	.board_set_wrap{
		position: relative;
		padding: 20px;
		border-top: 2px solid #000;
		border-bottom: 1px solid #ddd; 
	}
	.board_set{
		width: 900px;
		margin: auto;
	}
	.board_set_info{
		display: flex;
		align-items: center;
		width: 100%;
		border-bottom: 1px solid #dadada;
		padding: 10px 14px 5px;
		margin-bottom: 17px;
		vertical-align: top;
	}
	.board_set_info:nth-child(3), .board_set_info:nth-child(4){
		border: none;
	}
	.board_set_input{
		width: 90%;
		height: 30px;
		outline: none;
		display: block;
		position: relative;
		padding-left: 25px;
		line-height: 30px;
		border: none;
		font-size: 15px;
		z-index: 10;
	}
	.sel{
		background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
		background-size: 20px 8px;
		width: 100%;
		height: 29px;
		font-size: 15px;
		line-height: 18px;
		color: #000;
		border: none;
		-webkit-appearance: none;
		outline: none;
	}
	textarea{
		width: 100%;
		height: 500px;
	}
	.set_info_text{
		flex-direction: column;
		align-items: baseline;
	}
	.flex{
		display: flex;
	}
	.set_info_front{
		justify-content: space-between;
	}
	.set_info_behind{
		justify-content: flex-start;
		margin: 0 0 17px 20px;
	}
	.set_info_front div,.set_info_behind input{
		width: 65%;
	}
	.set_file{
		border: 1px dashed #dadada;
		width: 100%;
		height: 100px;
		text-align: center;
	}
	.set_file i{
		line-height: 95px;	
	}
	.set_btn{
		margin-top: 18px;
		display: flex;
		justify-content: space-between;
	}
	.set_btn a{
		padding: 17px 30px;
		outline: none;
		background: #f7b8b4;
		color: white;
		border: none;
		text-align: center;
		font-size: 15px;
		border-radius: 2px;
	}
</style>	
</head>
<body>
	<div id="board_wrap">
		<div class="board_container">
			<div class="board_title">
				<h1 class="ohyoyo_board">
					<a href="${path}/board/list?type=free" class="o_board">회원게시판</a>
				</h1>
			</div>
			<div class="board_set_wrap">
				<div class="board_set">
					<div class="flex">
						<div class="board_set_info set_info_front">
							<label for="type">
								종류 : 
							</label>
							<div class="board_set_input">
								<span class="">
									<select id="type" class="sel">
										<option value="faq">FAQ</option>
										<option value="qna">1:1문의</option>
										<option value="free">회원게시판</option>
										<option value="notice">공지사항</option>
									</select>
								</span>
							</div>
						</div>
						<div class="board_set_info set_info_behind">
							<label for="set_writer">
								작성자 : 
							</label>
							<input type="text" id="set_writer" class="board_set_input" readonly>
						</div>
						
					</div>
					<div class="board_set_info">
						<label for="set_title">
							제목 : 
						</label>
						<input type="text" id="set_title" class="board_set_input">
					</div>
					<div class="board_set_info set_info_text">
						<textarea></textarea>
					</div>
					<div class="board_set_info set_info_text">
						<div class="set_file">
							<i class="fas fa-paperclip">&nbsp;첨부파일을 드래그 해주세요.</i>
							
						</div>
					</div>
				</div>
			</div>
			<div class="set_btn">
				<a href="#">취소</a>
				<a href="#">등록</a>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
</html>