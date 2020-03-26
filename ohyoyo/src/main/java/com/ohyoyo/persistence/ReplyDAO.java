package com.ohyoyo.persistence;

import java.util.List;

import com.ohyoyo.domain.ReplyDTO;

public interface ReplyDAO {
	// 댓글 list 출력
	public List<ReplyDTO> list(int bno);
	
	// 댓글 DB에 저장
	public void insert(ReplyDTO rDto);
}
