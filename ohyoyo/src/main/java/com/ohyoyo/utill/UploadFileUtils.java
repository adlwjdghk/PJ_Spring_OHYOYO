package com.ohyoyo.utill;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		// uuid발급
		// 중복된 이름이 들어왔을때 다르게 저장될수있도록 
		// 열몇자리의 uuid생성 (숫자 + 문자) 99.몇%
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_"+ originalName;
		// 업로드할 디렉토리 생성
		// calcPath 메서드 : 업로드할 디렉토리(폴더)가 있으면 쓰고 없으면 만들어주는 것
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath, savedName);
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		//파일의 확장자 검사 a.jpg/ aaa.bbb.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		//이미지파일은 썸네일 사용
		if(MediaUtills.getMediaType(formatName) != null) {
			// 썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator 
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String...  paths) {
		// 디렉토리가 존재하면 skip
		if(new File(paths[paths.length -1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
			}
		}
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		// 아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름을 리턴 
		//File.separator: 디렉토리 구분자 윈도우 \, 유닉스(리눅스) /
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// 이미지를 읽기위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// 썸네일 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") +1);
		// 썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
