package xyz.tour.newworld.api;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.vo.BoxOfficeVO;

@Component
@Slf4j

public class ApiBoxOffice {
	@Autowired
	private RestTemplate restTemplate;
	
	public <T> T getData(String url, Class<T> clazz) {
		try {
			URI uri = new URI(url);
			ResponseEntity<T> response = restTemplate.getForEntity(uri, (Class<T>)clazz);
			return response.getBody();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<BoxOfficeVO> getBoxOfficeList(int cnt) {
		// TODO Auto-generated method stub
		return null;
	}
	

}