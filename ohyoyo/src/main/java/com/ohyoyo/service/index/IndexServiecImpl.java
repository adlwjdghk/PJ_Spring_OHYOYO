package com.ohyoyo.service.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohyoyo.domain.ProductDTO;
import com.ohyoyo.persistence.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexServiecImpl implements IndexService{
	// 기존에는 DAO -> Mybatis -> DB(Oracle) 순차적으로 동작해서 비효율적이던 실행방법을
	// 다음과 같이
	// DAO + Mapper를 결합해서 사용하는 방식을 사용
	
	// SqlSession을 사용하기 위한 의존성 주입
	// : root-context.xml에서 생성된 sqlSession 빈즈를 주입받음! 생성되있어서 의존성주입이 가능
	@Autowired
	private SqlSession sqlSession;
	
	ProductDAO pDao; // 전역변수
	@Autowired
	public void newProductDAO() {
		// sqlSession에 getmapper를 가져오는데 ProductDAO클래스를 통해 자져옴
		// ProductDAO의 모든 sql문을 쓸수있도록 가져옴
		pDao = sqlSession.getMapper(ProductDAO.class);
	}
	
	@Override
	public List<ProductDTO> bestPdtList() {
//		log.info("@을 사용하는 방법: "+pDao.getCount());
//		log.info("xml을 사용하는 방법: "+pDao.getCount2());
		
		// 비즈니스 로직 : best상품 5건을 조회해서 view(메인)단에 출력
		
//		pDao.bestPdtList(); // 선언할필요없이 바로 리턴하면 됨
		
//		List<ProductDTO> list = pDao.bestPdtList(); 
//		for (ProductDTO productDTO : list) {
//			log.info(productDTO.toString());
//		} // 확인용
		return pDao.bestPdtList();
	}

}
