package com.ohyoyo.service.board;

import java.util.List;

import com.ohyoyo.domain.BoardDTO;

public interface BoardService {
	// 목록(페이지나누기, 검색기능 포함)
	public List<BoardDTO> selectList(int start, int end);
	
	// 게시글 갯수계산
	public int countArticle();
}
