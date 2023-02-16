package xyz.tour.newworld.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import xyz.tour.newworld.vo.BoxOfficeVO;

public interface BoxOfficeMapper {

	List<BoxOfficeVO> selectBoxOfficeList(List<BoxOfficeVO> listBoxOfficeVO);
	List<BoxOfficeVO> selectBoxOffice();
	int insertBoxOffice(BoxOfficeVO boxOfficeVO);
	int insertBoxOffices(@Param("boxOfficeList")List<BoxOfficeVO> listBoxOfficeVO);

	
	//List<Map<String,Object>> selectBoxOfficeList();
}
