package com.ohyoyo.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ohyoyo.domain.BoardDTO;

public interface BoardService {
	// 목록(페이지나누기, 검색기능 포함)
	public List<BoardDTO> selectList(String sort_option, String search_option, String keyword, int start, int end);
	
	// 게시글 갯수계산
	public int countArticle(String search_option, String keyword);
	
	// 상세게시글
	public BoardDTO selectView(int bno);
	
	// 조회수 +1 증가
	public void increaseViewCnt(HttpSession session, int bno);
	
	// 게시글 삭제
	public void deleteBoard(int bno);
	
	// 게시글 등록
	public void writer(BoardDTO bDto);
}
