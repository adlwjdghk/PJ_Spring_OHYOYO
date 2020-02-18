package com.ohyoyo.service.index;

import java.util.List;

import com.ohyoyo.domain.ProductDTO;

public interface IndexService {
	// best상품을 4건 출력
	public List<ProductDTO> bestPdtList();
	// 신상품을 4건 출력
	public List<ProductDTO> newPdtList();
}
