package xyz.tour.newworld.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.tour.newworld.mapper.GoodsInfoMapper;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;

@Service
public class GoodsService {

	@Autowired
	private GoodsInfoMapper goodsInfoMapper;
	
	//해외
	public List<ForeignHomeGoodsInfoVO> selectForeignGoods(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) { //해외 패키지 목록 불러오기
		return goodsInfoMapper.selectForeignGoods(foreignGoodsInfoVO);
	}
	
	//국내
	public List<ForeignHomeGoodsInfoVO> selectHomeGoods(ForeignHomeGoodsInfoVO homeGoodsInfoVO) {	//국내 패키지 목록 불러오기
		return goodsInfoMapper.selectHomeGoods(homeGoodsInfoVO);
	}

	
	//검색
	public List<ForeignHomeGoodsInfoVO> goodsSearch(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) {  //전체 패키지검색
		return goodsInfoMapper.goodsSearch(foreignGoodsInfoVO);
	}
	
	public List<ForeignHomeGoodsInfoVO> goodsSearchByEtc(ForeignHomeGoodsInfoVO foreignGoodsInfoVO){  //국내 해외 나눠서 패키지 검색
		return goodsInfoMapper.goodsSearchByEtc(foreignGoodsInfoVO);
	}
	
	//공통
	public ForeignHomeGoodsInfoVO residualSeats(ForeignHomeGoodsInfoVO foreignHomeGoodsInfoVO) {	//잔여수량
		return goodsInfoMapper.residualSeats(foreignHomeGoodsInfoVO);
	}
	
	public ForeignHomeGoodsInfoVO getGoods(String giCode) {	//패키지 상세 페이지에서 패키지 정보 불러오기
		return goodsInfoMapper.getGoods(giCode);
	}
	
	public List<ForeignHomeGoodsInfoVO> selectGoodsCategory(String giCategory) {  //카테고리별 패키지 목록
		return goodsInfoMapper.selectGoodsCategory(giCategory);
	}
	
	//메인
	public List<ForeignHomeGoodsInfoVO> mainGoods(String giCode) {
		return goodsInfoMapper.mainGoods(giCode);
	}
}
