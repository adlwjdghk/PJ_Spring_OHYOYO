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
	public List<BoardDTO> selectList(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option",sort_option);
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start",start);
		map.put("end",end);
		
		List<BoardDTO> list = bDao.selectList(map); 
		for (BoardDTO productDTO : list) {
			log.info("************************"+productDTO.toString());
		} // 확인용
		return bDao.selectList(map);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		
		// DAO 보낼때 항상 컬렉션프레임워크에 담아서 가야 효율이 좋음
		return bDao.countArticle(map);
	}

}
