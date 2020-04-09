package com.ohyoyo.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
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
	@Resource(name = "uploadPath")
	String uploadPath;
	
	// upload File multipart파일에 Save
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8") // 원래 붙여야 되는게 정석 multipart 받을때는 써야함 
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		// 업로드한 파일 정보와 Http 상태코드를 함께 리턴
		return new ResponseEntity<String> (UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	// 이미지표시가능
	@ResponseBody // view가아닌 data리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
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
}