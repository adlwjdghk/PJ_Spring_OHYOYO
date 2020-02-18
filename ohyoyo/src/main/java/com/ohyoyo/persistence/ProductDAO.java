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
	
	//4. @관련 SQL이 없으면 mapper.xml에 가서 ind가 newPdtList와 같은 sql문을 찾아 oracledb로 가서 실행후
	// 결과를 return 받음 
	public List<ProductDTO> newPdtList();
	
}
