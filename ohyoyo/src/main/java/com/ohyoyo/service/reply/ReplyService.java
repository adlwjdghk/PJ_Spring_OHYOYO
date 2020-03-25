package com.ohyoyo.service.reply;

import java.util.List;

import com.ohyoyo.domain.ReplyDTO;

public interface ReplyService {
	
	// 댓글 list 출력
	public List<ReplyDTO> list(int bno);
}
