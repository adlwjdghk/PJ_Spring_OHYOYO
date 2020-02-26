package com.ohyoyo.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.ohyoyo.persistence.MemberDAO;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;

	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	// 이메일 난수 생성 메서드
	private String init() {
		Random ran = new Random();
		// StringBuffer 문자열을 처리 효율성이 좋기때문에 사용 (그냥 String도 사용가능)
		// StringBuffer와 String의 차이
		// String 불변의 값 이뮤터블밸류? : 값을 바꿀수없음 == 
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)){
				// 숫자값이 들어가면 char를 통해 문자로 바꿔짐(형변환) 아키텍값으로( 48 = 'A')
				// append 추가 (기존값 맨뒤에 붙이는 것)
				// buffer에 추가하는 것 
				sb.append((char) num);
			} else {
				continue;
			}
			
		} while(sb.length() < size) ;
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString(); // toString()이 buffer영역에 있던 값을 실제로 넣는것
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키발송)
	@Override
	public void mailSendUser(String email, String id, HttpServletRequest request) {
		String key = getKey(false, 20); // 길이 20의 난수생성
		mDao.getKey(id,key);
		// Mime타입 : 자동으로 형변환해주는 타입(첨부파일 동영상, 소리, 메일 등등) 메일에 첨부파일을 보낼수도 있으니까
		MimeMessage mail = mailSender.createMimeMessage(); // 편지봉투랑 편지지 만들기
		// 문자열변수에 내용만 적어서 놓은것
		String htmlTxt = "<h2>안녕하세요 OHYOYO입니다;)</h2><br>"
				+"<h3>"+id+"님</h3>"+"<p>인증하기 버튼을 누르시</p>"
				+"<a href='http://localhost:8081"+request.getContextPath()+"/member/keyauth?id="+id+"&key="+key+"'>인증하기</a></p>"
				+"(OHYOYO에 가입한 적이 없다면 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] OHYOYO 인증메일입니다"); // 메일제목
			// 내용, 한글깨지기방지, html로 보내기(태그를 읽을수있음)
			mail.setText(htmlTxt,"utf-8","html"); // 메일내용
			mail.addRecipient(RecipientType.TO, new InternetAddress(email)); // 메일수신자
			mailSender.send(mail); // 메일발송
		} catch (MessagingException e) {
			// 메일관련된 exception이 발생하면 띄워줘라
			e.printStackTrace();
		}
		
	}

	@Override
	public int keyAuth(String id, String key) {
		return mDao.alterKey(id,key);
	}
	
	
}
