package xyz.tour.newworld.api;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j

public class ApiIamport {

	@Autowired
	private RestTemplate restTemplate;
	
	public <T> T getData(String url, Class<T> clazz) {
		try {
			URI uri = new URI(url);
			ResponseEntity<T> response = restTemplate.getForEntity(uri, (Class<T>)clazz);
			return response.getBody();
			
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
}
