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
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)){
				sb.append((char) num);
			} else {
				continue;
			}
			
		} while(sb.length() < size) ;
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
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
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlTxt = "<h2>안녕하세요 OHYOYO입니다;)</h2><br>"
				+"<h3>"+id+"님</h3>"+"<p>인증하기 버튼을 누르시</p>"
				+"<a href='http://localhost:8081"+request.getContextPath()+"/member/keyauth?id="+id+"&key="+key+"'>인증하기</a></p>"
				+"(OHYOYO에 가입한 적이 없다면 무시하셔도 됩니다)";
		try {
			mail.setSubject("본인인증"); // 메일제목
			mail.setText(htmlTxt,"utf-8","html"); // 메일내용
			mail.addRecipient(RecipientType.TO,new InternetAddress(email)); // 메일수신자
			mailSender.send(mail); // 메일발송
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int keyAuth(String id, String key) {
		return mDao.alterKey(id,key);
	}
	
	
}
