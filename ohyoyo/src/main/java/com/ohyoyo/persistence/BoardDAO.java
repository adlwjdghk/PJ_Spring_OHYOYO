package com.ohyoyo.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ohyoyo.domain.BoardDTO;

public interface BoardDAO {
	// 목록(페이지나누기, 검색기능 포함)
	// map이라는 이름으로 보내고 싶으면 @param 쓰기
	public List<BoardDTO> selectList(@Param("map") Map<String, Object> map);
		
	// 게시글 갯수계산
	public int countArticle(@Param("map") Map<String, Object> map);
	
	// 상세게시글
	public BoardDTO selectView(int bno);
	
	// 조회수 +1 증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	// 게시글 삭제 -> update show = n 으로 바꾸기
	public void deleteBoard(int bno);
	
	// 댓글 등록시 replycnt +1
	public void replyCntUpdate(int bno);
}
