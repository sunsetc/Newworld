package xyz.tour.newworld.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class BoxOfficeResultVO {
	private List<BoxOfficeVO> dailyBoxOfficeList;
			//데이터타입			//키값 클래스이름은 상관없어 중요한건 필드이름.
								//얘가 불러올 api의 이름이랑 같아야해
}
