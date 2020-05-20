package com.ohyoyo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ohyoyo.service.board.BoardService;
import com.ohyoyo.utill.MediaUtils;
import com.ohyoyo.utill.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	@Autowired
	BoardService bService;
	
	// 업로드 디렉토리 servlet-context.xml에 설정되어있음
	// 의존성주입 DI
	// 종류 : Autowired Inject Resource
	@Resource(name = "uploadPath")
	String uploadPath; // c:/developer/upload
	
	// upload File multipart파일에 Save
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8") // 원래 붙여야 되는게 정석 multipart 받을때는 써야함 
											// file = 사용자가 드래그앤드롭한 첨부파일(dobby.jpg 40byte)
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		// 업로드한 파일 정보와 Http 상태코드를 함께 리턴
		// ResponseEntity response(사용자에게 전달)메세지를 디테일하게 설정할수있음
		// MemberDTO mDto = new MemberDTO();
		// return mDto; 
		// return new MemberDTO();
		// 왜? 변수에 담는 이유는 재사용을 위해서 변수에 담는 것 재사용안할거라서 변수에 안담음
		// but 개발자에 따라서 다름 변수에 담으라고 가독성이 떨어진다구
															// c:/developer/upload       dobby.jpg                40byte          200
		return new ResponseEntity<String> (UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	// 이미지표시가능
	@ResponseBody // view가아닌 data리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName)
			throws Exception{
		// 서버의 파일을 다운로드하기위한 스트림
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 헤더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			// inputStream 생성
			in = new FileInputStream(uploadPath + fileName);
//			if(mType != null) { //이미지파일이면
//				headers.setContentType(mType);
//			} else { // 이미지가 아니면
				fileName = fileName.substring(fileName.indexOf("_")+1);
				// 다운로드용 컨텐트 타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				// 큰따옴표내부에 "\""
				// 바이트배열을 스트링으로
				// iso-8859-1 서유럽 언어
				// new String(fileName.getBytes("utf-8"),"iso-8859-1")
				headers.add("Content-Disposition","attachment; filename=\""
						+ new String(fileName.getBytes("utf-8"),"iso-8859-1")+"\"");
				// headers.add("Content-Disposition"
				// ,"attachment; filename='"+ fileName+"'");
//			}
			// 바이트배열, 헤더
			entity =  new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in != null)
				in.close(); // 스트림 닫기
		}	
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/upload/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		// 일반 fileName: /2020/04/10/abe1906e-118f-43a3-9937-48704f134247_abc.txt
		// 이미지 fileName: /2020/04/10/s_12431175-c49c-472b-87e6-6ffba0408df5_cloud.png
		// 확장자 검사
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// formatName: txt, png
		MediaType mType = MediaUtils.getMediaType(formatName);
		// 이미지파일은 썸네일과 원본파일 모두 삭제해야하므로 
		// 그것도 삭제하라는 코드가 더 있어야함
		if(mType != null) {//이미지파일이면 원본이미지 삭제
			String front = fileName.substring(0, 12);
			// front: /2020/04/10
			String end = fileName.substring(14);
			// end: 12431175-c49c-472b-87e6-6ffba0408df5_cloud.png
			
			// 이미지 원본파일 삭제
			// File.separatorChar : 유닉스/ 윈도우즈\ 
			// 계속 바꾸는 이유는 윈도우이기때문에 Local에서는 \ 로 저장 view단, sts는 / 를 사용 
			// /2020/04/10/12431175-c49c-472b-87e6-6ffba0408df5_cloud.png
			// -> \2020\04\10\12431175-c49c-472b-87e6-6ffba0408df5_cloud.png
			// delete() 삭제하라 : Local저장되어있는 파일 삭제시킴
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		// 원본파일 삭제 (이미지면 썸네일 삭제)
		// 일반 fileName, 이미지썸네일 fileName replace 
		// -> \2020\04\10\abe1906e-118f-43a3-9937-48704f134247_abc.txt
		//  -> \2020\04\10\s_12431175-c49c-472b-87e6-6ffba0408df5_cloud.png
		// 삭제하기!
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		// 레코드 삭제 이건없어도 됨
//		bService.deleteFile(fileName);
		
		// ResponseEntity: response를 보낼때 설정값을 디테일하게 바꾸고 싶을때 사용함
		return new ResponseEntity<String> ("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/upload/deleteAllFile")
	public ResponseEntity<String> deleteFile(@RequestParam("files[]")String[] files){
		log.info("삭제 시키라구유유유유유");
		
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			// formatName: txt, png
			MediaType mType = MediaUtils.getMediaType(formatName);
			if(mType != null) {//이미지파일이면 원본이미지 삭제
				String front = fileName.substring(0, 12);
				// front: /2020/04/10
				String end = fileName.substring(14);
				// end: 12431175-c49c-472b-87e6-6ffba0408df5_cloud.png
				
				// 이미지 원본파일 삭제
				new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			}
			// 원본파일 삭제 (이미지면 썸네일 삭제)
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String> ("deleted",HttpStatus.OK);
	}
}
