package com.ohyoyo.persistence;

import java.util.List;

import com.ohyoyo.domain.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> selectList();
}
