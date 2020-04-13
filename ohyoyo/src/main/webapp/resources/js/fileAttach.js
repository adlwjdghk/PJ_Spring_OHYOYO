// 파일정보처리
function getFileInfo(fullName, path){
	// fullName: /2020/04/09/s_932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
	var originalFileName; // 화면에 출력할 파일명
	var imgSrc; // 썸네일 or 파일아이콘 이미지 파일
	var originalFileUrl; // 원본파일 요청 URL
	var uuidFileName; // 날짜경로를 제외한 나머지 파일명 (UUID)
	var basicFileName = fullName; // 삭제시 값을 전달하기위한
	
	// 이미지 파일이면 
	if(checkImageType(fullName)){
		imgSrc = path +'/upload/displayFile?fileName='+ fullName; //썸네일경로
		uuidFileName = fullName.substr(14);
		// uuidFileName: 932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
		var originalImg = fullName.substr(0, 12) + uuidFileName;
		// fullName.substr(0, 12): /2020/04/09/
		// uuidFileName: 932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
		// originalImg: /2020/04/09/932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
		// s_ 제외
		// 원본이미지 요청 링크
		originalFileUrl = path +'/upload/displayFile?fileName='+ originalImg;
	} else{
		imgSrc = path +'/resources/img/file-icon.png'; //파일 아이콘
		uuidFileName = fullName.substr(12);
		// 파일다운로드 요청 링크
		originalFileUrl = path +'/upload/displayFile?fileName='+fullName;
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

//첨부파일 출력
function printFiles(data, path){
	// data: /2020/04/09/s_932895f7-2162-4528-ad6e-4ada5f3e6b64_20200408_165247.png
	// 파일정보처리
	var fileInfo = getFileInfo(data, path);
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

//첨부파일 리스트를 출력하는 함수
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