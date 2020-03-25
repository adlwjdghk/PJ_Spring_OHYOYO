package com.ohyoyo.persistence;

import java.util.List;

import com.ohyoyo.domain.ReplyDTO;

public interface ReplyDAO {
	// 댓글 list 출력
	public List<ReplyDTO> list(int bno);
}
