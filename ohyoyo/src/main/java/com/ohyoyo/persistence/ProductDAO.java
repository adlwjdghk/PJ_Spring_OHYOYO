package com.ohyoyo.persistence;

import java.util.List;

import com.ohyoyo.domain.ProductDTO;

public interface ProductDAO {
	// 두가지 방법이 있는데 회사에서는 어떤걸 사용할지몰라서 다 알려주는 것 
//	@Select("SELECT COUNT(*) FROM tbl_pdt")
//	public int getCount();
//	
//	public int getCount2();
	
	public List<ProductDTO> bestPdtList();
	
}
