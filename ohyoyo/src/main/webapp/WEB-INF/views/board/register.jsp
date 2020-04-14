<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록수정</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
			min-width: 68px;
			display: inline-block;
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
			font-size: 16px;
		}
		.set_file p{
			font-weight: bold;
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
			cursor: pointer;
		}
		.err_msg_register{
			display: none;
			width: 100%;
			margin-top: 10px;
			color: tomato;
			text-align: right;
		}
		
		/* 첨부파일 디자인*/
		.uploadedList{
			display: flex;
			margin-top: 20px;
			max-width: 922px;
		}
		.uploadedList li{
			margin-right: 20px;
			border: 1px dotted #dadada;
    		padding: 3px 7px;
		}
		.mailbox-attachment-info{
			text-align: center;
			color: #5d6f6d;
		}
		a.mailbox-attachment-name i{
		    margin-right: 5px;
		}
		.delBtn{
			cursor: pointer;
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
												<option value="free">회원게시판</option>
												<option value="faq" selected>FAQ</option>
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
								<textarea id="ir1" style="width: 100%; min-width:870px;" name="view_content">${one.view_content}</textarea>
							</div>
							<!-- 첨부파일등록 -->
							<div class="board_set_info set_info_text form_group">
								<div class="set_file fileDrop">
									<p><i class="far fa-folder"></i>&nbsp;첨부파일을 드래그 해주세요.</p>
								</div>
								<ul class="mailbox-attachments clearfix uploadedList"></ul>
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
<script id="fileTemplate" type="text/x-handlebars-template">
	<li>
		<div class="mailbox-attachment-icon has-img">
			<center><img alt="Attachment" src="{{imgSrc}}" class="s_img"></center>
		</div>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fas fa-file-alt"></i>{{originalFileName}}
			</a>
			<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
				<i class="fas fa-times"></i>			
			</span>
		</div>
	</li>
</script>
<script src="${path}/resources/js/fileAttach.js"></script>
<script type="text/javascript">
	var flag = '${flag}';
	console.log('******** '+flag);
	
	// Handlebars 디자인해놓은 라이브러리같은것 
	// Handlebars 파일 템플릿 컴파일
	var fileTemplete = Handlebars.compile($('#fileTemplate').html());
	
	// 수정시 로컬에서 삭제할 기존 첨부파일 목록
	var deleteFileList = new Array();
	$(function(){
		// register ==> 게시글 등록과 게시글 수정
		// 등록과 수정을 선택하게 만드는 것 
		// one에 값이 있으면 수정페이지 로딩!
		if(flag == 'update'){
			console.log('none');
			// 수정페이지로 디자인 변경
			$('.register_btn').text('수정');
			// select Box 값으로 selected
			// $('#board_type').val(1).attr('selected','selected') index값으로 선택할수있으나 확인이 어려움
			$('#board_type').val('${one.type}').attr('selected','selected');
			listAttach('${path}', '${one.bno}');
		} else if(flag == 'answer'){
			$('.register_btn').text('답글 등록');
			// selectbox 옵션을 선택 못하게 하는 방법 => type을 받아오지않음
			/* $('#board_type').val('${one.type}')
			 			       .attr('selected','selected')
							   .not(':selected').attr('disabled','disabled'); // select box readonly시키기 */
							   
			// selectbox 어떤 옵션을 선택해도 해당 게시글 type 옵션만 나오게 하는 방법
			// type 받아옴
 			$('#board_type').val('${one.type}')
						    .attr('selected','selected')
							.attr('onFocus', 'this.initialSelect = this.selectedIndex') 
							.attr('onChange', 'this.selectedIndex = this.initialSelect');   
			
			$('#set_title').attr('readonly','readonly');

					
		}
		
		// Drag&Drop 첨부파일
		// 1. 웹브라우저에 d&d시 파일이 열리는 문제(기본효과) : 기본효과 막음!
		$('.fileDrop').on('dragenter dragover', function(e){
			e.preventDefault();
		});
		// 2. 사용자가 파일을 drop했을때
		$('.fileDrop').on('drop', function(e){
			e.preventDefault();
			
			var files = e.originalEvent.dataTransfer.files; // 드래그에 전달된 첨부파일들
			var file = files[0]; // 그중 하나만 꺼내옴
			
			var formData = new FormData(); // 폼 객체생성 
			formData.append('file', file); // 폼에 파일 1개 추가!
			
			// 서버에 파일 업로드
			$.ajax({
				url:'${path}/upload/uploadAjax',
				data: formData,
				datatype: 'text',
				processData: false, // 쿼리스트링 방식 생성x
				contentType: false, // 서버단으로 전송하는 테이터 타입 (multipart)
				type: 'POST',
				success: function(data){
					console.log(data);
					// data: 업로드한 파일 정보와 Http 상태코드
					// /2020/04/09/s_932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
					printFiles(data, '${path}'); // 첨부파일 출력 메서드 호출
				}
			});
		});
		$('.uploadedList').on('click','.delBtn', function(event){
			var that = $(this);
			var bno = '${one.bno}';

			// local에 들어가있는 첨부파일까지 생각해봐야함 
			// 등록시 x버튼을 클릭했을때 디자인도 삭제되고 local에서도 삭제
			if(bno == '' || flag == 'answer'){  // 게시글 등록
				alert('등록 or 답글');
				$.ajax({
					url: '${path}/upload/deleteFile',
					type: 'POST',
					data: {fileName: $(this).attr('data-src')},
					success: function(data){
						if(data == 'deleted'){
							that.parents('li').next('input').remove();
							that.parents('li').remove();
						}
					}, error: function(){
						alert('system error!!!');
					}
				});
			} else{ // 게시글 수정 삭제x
				alert('수정');
				var arr_size = deleteFileList.length;
				deleteFileList[arr_size] = $(this).attr('data-src');
				$(this).parents('li').next('input').remove();
				$(this).parents('li').remove();
				
				for(var i = 0; i < deleteFileList.length; i++){
					console.log(i+', '+deleteFileList[i]);
				}
			}
		});
	});
	
	$(document).on('click','.cancel_btn',function(){
		var referer ='${header.referer}';
		var index = referer.indexOf('/board/list');
		
		if(index != -1){ // list에서 왔을때 
            location.href = '${header.referer}';
		} else if('${one.bno}' != ''){	// view에서 왔을때
            location.href = '${path}/board/view/${one.bno}';
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
			// textarea의 값을 가져오는 것
			// 스마트 에디터의 값을 textarea에 입력
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			var view_content = $('#ir1').val();
			
			// 정규식을 통해 HTML태그를 제거후 순수 text만 추출
			var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp;","");
			console.log('searchsearchsearch: '+search_content);
			
			// form태그에 넣어주는데 맨 마지막에 넣어줌 등록버튼을 눌렀을떄 생기고 값을 넣어줌
			$('#frm_board').append('<textarea id="search_content" name="search_content"></textarea>');
			$('#search_content').val(search_content);
			
			// 첨부파일 목록[배열]도 추가
			var str= '';
			// uploadedList 내부의 .file 태그 각각 반복
			// .each 앞의 선택자 갯수만큼 반복을 하라는 얘기 
			$('.uploadedList .file').each(function(i){
				console.log(i);
				// hidden태그 구성
				str += "<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
			});
			
			// 포컬드라이브에 저장되어있는 해당 게시글 첨부파일 삭제
			// 사용자가 삭제한 첨부파일 목록을 가지고 local에서 첨부파일 삭제
			if(deleteFileList.length > 0){
				alert('delete');
				$.post('${path}/upload/deleteAllFile',{files:deleteFileList},function(){});
			}; 


			// 폼에 hidden태그들을 붙임 붙이고 name으로 보낼수있도록 해놓은 것
			$('#frm_board').append(str);
			
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