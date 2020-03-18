package com.ohyoyo.service.board;

import java.util.List;

import com.ohyoyo.domain.BoardDTO;

public interface BoardService {
	public List<BoardDTO> selectList();
}
