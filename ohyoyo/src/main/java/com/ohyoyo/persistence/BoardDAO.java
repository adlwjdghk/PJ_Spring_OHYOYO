package com.ohyoyo.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ohyoyo.domain.AttachDTO;
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
	
	// 댓글 등록시 replycnt +-1
	public void replyCntUpdate(@Param("map") Map<String, Object> map);
	
	// 게시글 등록
	public void write(BoardDTO bDto);
	
	// 게시글 수정
	public void update(BoardDTO bDto);
	
	// 계층형 답글 만들때 필요한 re_step 수정
	public void updateStep(BoardDTO bDto);
	
	// 게시글 답글 등록
	public void answer(BoardDTO bDto);
	
	// 게시글 내 첨부파일 등록
	public void addAttach(@Param("fullname") String fullname);

	// 해당 게시글 첨부파일 목록 출력
	public List<String> getAttach(@Param("bno") int bno);
	
	// 삭제할 게시글의 첨부파일 삭제
	public void deleteAttach(int bno);
	
	// 첨부파일 수정(재등록)
	public void updateAttach(@Param("fullname") String fullName,@Param("bno") int bno);
	
	// 첨부파일 목록 가져오기
	public List<AttachDTO> getOldFiles(@Param("ydate") String ydate);

}
