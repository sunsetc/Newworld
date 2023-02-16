package xyz.tour.newworld.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.anno.CheckAuth;
import xyz.tour.newworld.vo.UserInfoVO;



import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.anno.CheckAuth;
import xyz.tour.newworld.vo.UserInfoVO;

@Controller
public class AOPTestController {

	@GetMapping("/json1")
	@CheckAuth
	@ResponseBody
	public ResponseEntity<String> sendJson1(@ModelAttribute UserInfoVO userInfo) {
		return new ResponseEntity<>("json1",HttpStatus.OK);
	}
	
	@GetMapping("/json2")
	@ResponseBody
	public ResponseEntity<String> sendJson2() {
		return new ResponseEntity<>("json2",HttpStatus.OK);
	}
	
//	@GetMapping("/test1")
//	public String goTestPage() {
//		return "views/test1";
//	}
//	
//	@GetMapping("/views/test1")
//	public void goTestPage2() {
//		
//	}
//	
//	@GetMapping("/test2")
//	@ResponseBody
//	public String sendJson() {
//		return "views/test1";
//	}
	
}

