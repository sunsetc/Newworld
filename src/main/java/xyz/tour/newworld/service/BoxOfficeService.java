package xyz.tour.newworld.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.tour.newworld.api.ApiBoxOffice;
import xyz.tour.newworld.mapper.BoxOfficeMapper;
import xyz.tour.newworld.vo.BoxOfficeVO;

@Service
public class BoxOfficeService {

	@Autowired
	private ApiBoxOffice apiBoxOffice;
	@Autowired
	private BoxOfficeMapper boxOfficeMapper;

	public int insertBoxOffice(List<BoxOfficeVO> boxOfficeList) {
		return boxOfficeMapper.insertBoxOffices(boxOfficeList);
	}

	public List<BoxOfficeVO> selectBoxOffice() {
		return boxOfficeMapper.selectBoxOffice();
	}
	
}
