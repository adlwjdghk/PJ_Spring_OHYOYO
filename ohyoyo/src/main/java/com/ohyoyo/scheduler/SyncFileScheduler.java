package com.ohyoyo.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ohyoyo.domain.AttachDTO;
import com.ohyoyo.persistence.BoardDAO;
import com.ohyoyo.utill.MediaUtils;

import lombok.extern.slf4j.Slf4j;

/* 
 * 게시글 첨부파일 사용시
 * 로컬에 저장된 첨부파일과 DB에 저장된 첨부파일 이름이
 * 매칭이 안되는 경우 아무도 사용하지않는 파일
 * 고로 로컬에서 삭제!!
 * 
 * 하루에 한번씩 새벽시간에 전날 로컬첨부파일 폴더를 대상으로
 */
@Slf4j
@Component
public class SyncFileScheduler {
	@Autowired
	private SqlSession sqlSession;
	 
	private BoardDAO bDao;
	
	@Autowired 
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	String uploadPath = "c:/developer/upload";
	
	// 하루전날 파일 목록 가져오기 
	private String getFolderYesterday() {
		// format형식 생성
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		// 오늘날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();
		// 오늘 날짜에서 -1해서 어제로 설정
		cal.add(Calendar.DATE, -1);
		// 어제날짜 yyyy-MM-dd로 설정 ex) 2020-04-15
		String str = sf.format(cal.getTime());
		log.info("*************어제날짜 str: "+str);
		// File.separator은 / 또는 \로 파일 경로를 분리
		// 2020-04-16을 2020\04\16으로 변경
		return str.replace("-", File.separator);
	}
	
	// 매일 새벽 2시에 첨부파일 목록과 DB를 비교해서
	// DB에 없는 첨부파일을 로컬디렉토리에서 삭제
	@Scheduled(cron = "0 50 15 * * *")
	public void checkFiles() throws Exception{
		log.warn("File Check Task run ..........");
		log.warn(""+new Date());
		
		// DB에 등록되어있는 첨부파일 목록 가져오기
		// 오늘날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); 
		// 일단은 어제 등록한 첨부파일이 없으므로 오늘로 테스트하고 나중에 주석해제하기
		
		// 모양바꿔주는 코드
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		log.info("******yesterdayDate: "+sf.format(cal.getTime())); // todayDate: 20200416
		
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));
		
//		for(AttachDTO one: fileList) {
//			log.info("******fileList: "+one.toString()); 
//		}
		
		// fileList에 담긴 이름
		// fullname=/2020/04/16/s_68a8f853-b9e3-414e-80d4-6b6743f2a683_cloud.png
		// 로컬에 저장된 이름이 다름
		// 람다식을 활용한 스트링 연산식 이용해서 해봄
		List<Path> fileListPaths = fileList.stream()
				.map(dto -> Paths.get(uploadPath+dto.getFullname()))
				.collect(Collectors.toList());
		// fileListPaths = c:/developer/upload/2020/04/16/s_68a8f853-b9e3-414e-80d4-6b6743f2a683_cloud.png
		
		// 이미지 파일이면 DB에 썸네일 이미지파일이 등록돼있기 때문에
		// 파일 목록에 원본이미지 파일도 등록
		// 로컬에는 둘다 있으니 둘다 비교해야하기때문에 
		for(AttachDTO avo : fileList) {
			String fileName = avo.getFullname();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));
			}
		}
		
		// 파일목록 fileListPaths에 : 파일이름 , 원본이미지이름, 썸네일이미지 이름
		// DB꺼
		fileListPaths.forEach(p -> log.info(""+p));
		
		// 하루전날 첨부파일 저장 폴더 지정
		// local꺼 목록
		File targetDir = Paths.get(uploadPath, getFolderYesterday()).toFile();
		
		// 디렉토리의 파일목록(디렉토리포함)을 File배열로 반환
		// DB 첨부파일 목록과 하루전폴더의 첨부파일과 매칭!
		// -> DB에 없는 첨부파일 목록 = 삭제목록 생성
		File[] removeFile = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		// targetDir의 파일이름들 listFiles에 들어있고
		// 하나씩 file에 넣기 
		// fileListPaths와 file.toPath()를 contains(비교) 해서 있으면 (둘다있으면 ) false
		// 하나가 없으면 true반환 true면 removeFile에 들어감
		
		// DB에 등록되지않은 첨부파일 삭제 시작!
		log.warn("=======================");
		for(File file: removeFile) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
}
