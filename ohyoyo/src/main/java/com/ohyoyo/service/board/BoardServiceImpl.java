package com.ohyoyo.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<BoardDTO> selectList(int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start",start);
		map.put("end",end);
		
		return bDao.selectList(map);
	}

	@Override
	public int countArticle() {
		return bDao.countArticle();
	}

}
