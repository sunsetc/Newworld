package xyz.tour.newworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.vo.AsyncVO;

@RestController
@Slf4j
public class CallRestController {

	private static final String url = "http://192.168.0.31/async/";
	
	@Autowired
	private ObjectMapper om;
	
	@GetMapping("/call/{cnt}")
	public AsyncVO getCall(@PathVariable("cnt") int cnt) throws JsonMappingException, JsonProcessingException {
		RestTemplate rest = new RestTemplate();
		ResponseEntity<String> res = rest.getForEntity(url+cnt+"/수진", String.class); //url body를 string으로 만들어줘
		AsyncVO async = om.readValue(res.getBody(), AsyncVO.class);  //그 body를 AsyncVO 형태로 변환해줘
		return async;
	}
	
	@GetMapping("/hook/{key}")
	public void hook(@PathVariable("key")String key) {
		log.debug("key=>{}", key);
	}
}

