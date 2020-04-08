package com.ohyoyo.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ohyoyo.service.board.BoardService;
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
	
	// 파일 첨부 페이지로 이동
	// 하나의 안전장치라고 보면됨 get으로 와도 post로 다시 갈수있도록
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
		return "/upload/uploadAjax";
	}
	
	// upload File multipart파일에 Save
	@ResponseBody
	@PostMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8") // 원래 붙여야 되는게 정석 multipart 받을때는 써야함 
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		// 업로드한 파일 정보와 Http 상태코드를 함께 리턴
		return new ResponseEntity<String> (UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
}
