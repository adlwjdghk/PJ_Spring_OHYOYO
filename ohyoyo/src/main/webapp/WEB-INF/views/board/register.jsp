<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		width: 950px;
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
		padding: 0 25px;
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
		width: auto;
	}
	.board_flexBox{
		display: flex;
	}
	.flex_info{
		border: 1px solid #dadada;
	}
	.set_info_front{
		justify-content: center;
	}
	.set_info_behind{
		justify-content: flex-start;
		width: auto;
		margin: 0 0 17px 20px;
		padding: 0;
	}
	.set_info_behind span{
		width: 15%;
	} 
	#set_title{
		font-size: 28px;
		margin: 22px 0 5px;
	}
	.set_file{
		border: 1px dashed #dadada;
		width: 100%;
		height: 150px;
		text-align: center;
	}
	.set_file i{
		line-height: 140px;	
	}
	.set_btn{
		margin-top: 18px;
		display: flex;
		justify-content: space-between;
	}
	.set_btn button{
		padding: 17px 30px;
		outline: none;
		background: #f7b8b4;
		color: white;
		border: none;
		text-align: center;
		font-size: 15px;
		border-radius: 2px;
	}
	.err_msg_register{
		display: none;
		width: 100%;
		margin-top: 10px;
		color: tomato;
		text-align: right;
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
			<div>
				<form:form id="frm_board">
					<div class="board_set_wrap">
						<div class="board_set">
							<div class="board_flexBox">
								<div class="board_set_info flex_info set_info_front">
									<div class="board_set_input">
										<span class="">
											<select id="board_type" class="sel" name="type">
												<option value="free" selected>회원게시판</option>
												<option value="faq">FAQ</option>
												<option value="qna">1:1문의</option>
												<option value="notice">공지사항</option>
											</select>
										</span>
									</div>
								</div>
								<div class="board_set_info flex_info set_info_behind">
									<span id="set_writer" class="board_set_input">${name}</span>
									<input type="hidden"  value="${userid}" name="writer">
								</div>
								
							</div>
							<div class="board_set_info">
								<input type="text" id="set_title" class="board_set_input" name="title" placeholder="제목을 입력하세요." value="${one.title}">
							</div>
							<div class="board_set_info set_info_text">
								<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
								<textarea id="ir1" style="width: 100%; min-width:870px;" name="content">${one.content}</textarea>
							</div>
							<div class="board_set_info set_info_text">
								<div class="set_file">
									<i class="fas fa-paperclip">&nbsp;첨부파일을 드래그 해주세요.</i>
									
								</div>
							</div>
						</div>
					</div>
					<div class="err_msg_register">제목을 입력해주세요</div>
					<div class="set_btn">
						<button type="button" class="cancel_btn">취소</button>
						<button type="button" class="register_btn">등록</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %> 
</body>
<script type="text/javascript">
	$(function(){
		// register ==> 게시글 등록과 게시글 수정
		// 등록과 수정을 선택하게 만드는 것 
		// one에 값이 있으면 수정페이지 로딩!
		if('${one}' != ''){
			console.log('none');
			// 수정페이지로 디자인 변경
			$('.register_btn').text('수정');
			// select Box 값으로 selected
			// $('#board_type').val(1).attr('selected','selected') index값으로 선택할수있으나 확인이 어려움
			$('#board_type').val('${one.type}').attr('selected','selected');
		}
	});
	
	$(document).on('click','.cancel_btn',function(){
		var referer ='${header.referer}';
		var index = referer.indexOf('/board/list');
		
		if(index != -1){ // list에서 왔을때 
            location.href = '${header.referer}';
		} else if('${one}' != ''){	// view에서 왔을때
            location.href = '${header.referer}';
		} else{ // 외부에서 왔을때 
        	location.href = '${path}/board/list';
		}
 	});
	
	$(document).on('click','.register_btn',function(){
		var title = $('#set_title').val();
		if(title == ''& title.length == 0){
			$('.err_msg_register').css('display','block');
			return false;
		} else{
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			alert(document.getElementById("ir1").value);
			$('#frm_board').submit();
		}
	});
</script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>
</html>