package com.ohyoyo.service.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohyoyo.domain.ReplyDTO;
import com.ohyoyo.persistence.BoardDAO;
import com.ohyoyo.persistence.ReplyDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReplyServiceImpl implements ReplyService{
	ReplyDAO rDao;
	BoardDAO bDao;

	@Autowired
	private SqlSession sqlSession;
	 
	@Autowired 
	public void BoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	@Autowired 
	public void ReplyDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);
	}
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}
	@Transactional
	@Override
	public void insert(ReplyDTO rDto) {
		//  비즈니스로직 
		// 댓글이 등록되면 게시글등록수 +1 트랜잭션!!
		// 1. 댓글 등록
		rDao.insert(rDto);
		log.info("****************insert set");
		
		// 2. 댓글 등록수 +1
		Map<String, Object> map = new HashMap<>();
		map.put("cnt","plus");
		map.put("bno",rDto.getBno());
		bDao.replyCntUpdate(map);
	}
	@Transactional
	@Override
	public void delete(int rno, int bno) {
		// 1. 댓글 등록
		rDao.delete(rno);
		
		// 2. 댓글 등록수 -1
		Map<String, Object> map = new HashMap<>();
		map.put("cnt","minus");
		map.put("bno",bno);
		
		bDao.replyCntUpdate(map);
	}

}
