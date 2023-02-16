package xyz.tour.newworld.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.service.GoodsService;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	//해외
	@GetMapping("/foreignGoods")	//해외 패키지 목록 불러오기
	@ResponseBody
	public List<ForeignHomeGoodsInfoVO> selectForeignGoods(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) {
		return goodsService.selectForeignGoods(foreignGoodsInfoVO);
	}
	
	//국내
	@GetMapping("/homeGoods")	//국내 패키지 목록 불러오기
	@ResponseBody
	public List<ForeignHomeGoodsInfoVO> selectHomeGoods(ForeignHomeGoodsInfoVO homeGoodsInfoVO) {
		return goodsService.selectHomeGoods(homeGoodsInfoVO);
	}
	
	
	//공통
	@GetMapping("/getGoods/{giCode}")	//패키지 상세 페이지에서 패키지 정보 불러오기
	@ResponseBody
	public ForeignHomeGoodsInfoVO getGoods(@PathVariable("giCode") String giCode) {
		return goodsService.getGoods(giCode);
	}
	
	@GetMapping("/rest/{giCode}")	//잔여수량
	@ResponseBody
	public ForeignHomeGoodsInfoVO residualSeats(ForeignHomeGoodsInfoVO foreignHomeGoodsInfoVO, @PathVariable("giCode") String giCode) {
		return goodsService.residualSeats(foreignHomeGoodsInfoVO);
	}
	
	@GetMapping("/goodsCategory/{giCategory}")	//카테고리별 패키지 목록 불러오기
	@ResponseBody
	public List<ForeignHomeGoodsInfoVO> selectGoodsCategory(@PathVariable("giCategory") String giCategory) {  //카테고리별 해외 패키지 목록
		return goodsService.selectGoodsCategory(giCategory);
	}
	
	
	//검색
	@GetMapping("/goods-Search")
	@ResponseBody
	public List<ForeignHomeGoodsInfoVO> goodsSearch(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) {  //전체 패키지검색
		return goodsService.goodsSearch(foreignGoodsInfoVO);
	}
	
	@GetMapping("/goods-serch-etc")
	@ResponseBody
	public List<ForeignHomeGoodsInfoVO> goodsSearchByEtc(ForeignHomeGoodsInfoVO foreignGoodsInfoVO){  //국내 해외 나눠서 패키지 검색
		return goodsService.goodsSearchByEtc(foreignGoodsInfoVO);
	}
	
	
	//메인
	@GetMapping("/main-goods")
	@ResponseBody
	public List<ForeignHomeGoodsInfoVO> mainGoods(String giCode) {
		return goodsService.mainGoods(giCode);
	}
	
}
