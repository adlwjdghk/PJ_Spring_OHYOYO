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
<script type="text/javascript">
	var flag = '${flag}';
	console.log('******** '+flag);
	
	// Handlebars 디자인해놓은 라이브러리같은것 
	// Handlebars 파일 템플릿 컴파일
	var fileTemplete = Handlebars.compile($('#fileTemplate').html());
	
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
					printFiles(data); // 첨부파일 출력 메서드 호출
				}
			});
			
			$('.uploadedList').on('click','.delBtn', function(event){
				var that = $(this);
				var bno = '${one.bno}';
				
				// local에 들어가있는 첨부파일까지 생각해봐야함 
				// 등록시 x버튼을 클릭했을때 디자인도 삭제되고 local에서도 삭제
				// 수정시 
				if(bno == ''){  // 게시글 등록
					$.ajax({
						url: '${path}/upload/deleteFile',
						type: 'POST',
						data: {fileName: $(this).attr('data-src')},
						success: function(data){
							if(data == 'deleted'){
								that.parents('li').remove();
							}
						}, error: function(){
							alert('system error!!!');
						}
					});
				} else{ // 게시글 수정
					alert('bno: '+ bno);
				}
			});
			
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
			// 아직은 필요없엄
			/* if(deleteFileList.length > 0){
				$.post('${path}/uplaod/deleteAllFile',{files:deleteFileList},function(){});
			}; */
			
			// 폼에 hidden태그들을 붙임 붙이고 name으로 보낼수있도록 해놓은 것
			$('#frm_board').append(str);
			alert('ㅠㅠ');
			$('#frm_board').submit();
		}
	});
	
	// 첨부파일 출력
	function printFiles(data){
		// data: /2020/04/09/s_932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
		// 파일정보처리
		var fileInfo = getFileInfo(data);
		console.log(fileInfo);
		// Handlebars 파일 템플릿에 파일 정보들을 바인딘하고 HTML생성
		var html = fileTemplete(fileInfo);
		html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";
		// Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		$('.uploadedList').append(html);
		// append() 맨마지막에 넣으라
		// 이미지 파일인 경우 aaaaaa파일 템플잇에 lightbox속성 추가
		if(fileInfo.fullName.substr(12,2) == "s_"){
			// 마지막에 추가된 첨부파일 템플릿 선택자
			var that = $('.uploadedList li').last();
			// lightbox 속성 추가
			that.find('.mailbox-attachment-name').attr('data-lightbox','uploadImages');
			// 아이콘에서 이미지 아이콘으로 변경
			that.find('.fa-file-alt').attr('class','fas fa-camera');
		}
	}
	
	// 파일정보처리
	function getFileInfo(fullName){
		// fullName: /2020/04/09/s_932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
		var originalFileName; // 화면에 출력할 파일명
		var imgSrc; // 썸네일 or 파일아이콘 이미지 파일
		var originalFileUrl; // 원본파일 요청 URL
		var uuidFileName; // 날짜경로를 제외한 나머지 파일명 (UUID)
		var basicFileName = fullName; // 삭제시 값을 전달하기위한
		
		// 이미지 파일이면 
		if(checkImageType(fullName)){
			imgSrc = '${path}/upload/displayFile?fileName='+ fullName; //썸네일경로
			uuidFileName = fullName.substr(14);
			// uuidFileName: 932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
			var originalImg = fullName.substr(0, 12) + uuidFileName;
			// fullName.substr(0, 12): /2020/04/09/
			// uuidFileName: 932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
			// originalImg: /2020/04/09/932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
			// s_ 제외
			// 원본이미지 요청 링크
			originalFileUrl = '${path}/upload/displayFile?fileName='+ originalImg;
		} else{
			imgSrc = '${path}/resources/img/file-icon.png'; //파일 아이콘
			uuidFileName = fullName.substr(12);
			// 파일다운로드 요청 링크
			originalFileUrl = '${path}/upload/displayFile?fileName='+fullName;
		}
		originalFileName = uuidFileName.substr(uuidFileName.indexOf('_')+1);
		// originalFileName: 20200408_165247.png
		// 전체파일명의 크기가 14보다 작으면 그대로 이름출력, 14보다 크면 실행
		if(originalFileName.length > 14){
			// 앞에서부터 11글자 자름
			var shortName = originalFileName.substr(0,10);
			// .을 기준으로 배열 생성
			var formatVal = originalFileName.split('.');
			// formatVal = originalFileName.substr(originalFileName.length-3)
			//  파일명에 .이 여러개 들어가 있을 수 도있음
			// 배열크기를 구해와서 무조건 맨마지막 확장자부분 출력되게
			var arrNum = formatVal.length -1;
			// 맨처음 문자열 10글자 +...+ 확장자
			originalFileName = shortName + '...'+ formatVal[arrNum];
		}
		return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName, basicFileName: basicFileName};
	}
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)){ // 이미지파일이면 skip
			return;
		}
		var idx= fileName.indexOf('_')+1; // uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
	function getImageLink(fileName){
		if(!checkImageType(fileName)){ // 이미지파일이 아니면 skip
			return;
		}
		var front= fileName.substr(0,12); // 연월일 경로
		var end= fileName.substr(14); // s_ 제거
		return front+end;
	}
	function checkImageType(fileName){
		// fileName: /2020/04/09/s_932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
		var pattern = /jpg|gif|png|jpeg/i; // 정규표현식 대소문자무시
		return fileName.match(pattern); // 규칙에 맞으면 true (매칭이되면 이미지파일)
	}
	
	// 첨부파일 리스트를 출력하는 함수
	function listAttach(){
		var listCnt = 0;
		$.ajax({
			type: 'post',
			url: '${path}/board/getAttach/${one.bno}',
			async: false,
			success: function(list){
				// list: jsop
				console.log(list);
				listCnt = list.length;
				console.log(list.length);
				/* jQuery each()는 반복문 
				 i와 e는 index와 element로 json에서 {0: 'apple.png'}일때 index는 0, element는 apple.png가 됨 */
				$(list).each(function(i, e){
					console.log(list);
					printFiles(e); // 첨부파일 출력메서드 호출
				});
			}
		});
		return listCnt;
	}
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