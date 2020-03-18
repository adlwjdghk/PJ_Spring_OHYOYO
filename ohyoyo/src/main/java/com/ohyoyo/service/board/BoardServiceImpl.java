package com.ohyoyo.service.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohyoyo.domain.BoardDTO;
import com.ohyoyo.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	BoardDAO bDao;
	
	@Autowired
	private SqlSession sqlSession;
	 
	@Autowired 
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}

	@Override
	public List<BoardDTO> selectList() {
		List<BoardDTO> list = bDao.selectList(); 
		for (BoardDTO productDTO : list) {
			log.info(productDTO.toString());
		} // 확인용
		
		return bDao.selectList();
	}

}
