package xyz.tour.newworld.mapper;

import java.util.List;

import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;

public interface GoodsInfoMapper {

	//해외
	List<ForeignHomeGoodsInfoVO> selectForeignGoods(ForeignHomeGoodsInfoVO foreignGoodsInfoVO);	//해외 패키지 목록 불러오기
	
	//국내
	List<ForeignHomeGoodsInfoVO> selectHomeGoods(ForeignHomeGoodsInfoVO homeGoodsInfoVO);	//국내 패키지 목록 불러오기
	
	//검색
	List<ForeignHomeGoodsInfoVO> goodsSearch(ForeignHomeGoodsInfoVO foreignGoodsInfoVO);
	List<ForeignHomeGoodsInfoVO> goodsSearchByEtc(ForeignHomeGoodsInfoVO foreignGoodsInfoVO);
	
	//공통
	ForeignHomeGoodsInfoVO residualSeats(ForeignHomeGoodsInfoVO foreignHomeGoodsInfoVO); //잔여수량
	ForeignHomeGoodsInfoVO getGoods(String giCode);	//패키지 상세 페이지에서 패키지 정보 불러오기
	List<ForeignHomeGoodsInfoVO> selectGoodsCategory(String giCategory);	//카테고리별 패키지 목록 불러오기
	
	//메인
	List<ForeignHomeGoodsInfoVO> mainGoods(String giCode);
}
