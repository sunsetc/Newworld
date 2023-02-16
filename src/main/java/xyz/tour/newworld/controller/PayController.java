package xyz.tour.newworld.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.service.PayService;
import xyz.tour.newworld.vo.pay.PayResponseVO;

@Controller
public class PayController {

	@Autowired
	private PayService payService;
	
	@PostMapping("/pay")
	@ResponseBody
	public int payInsert(@RequestBody PayResponseVO payResponseVO) {
		return payService.payinsert(payResponseVO);
	}
	
	@GetMapping("/pay-info/{riCode}")
	@ResponseBody
	public PayResponseVO selectPayInfo(@PathVariable("riCode")String riCode) {
		return payService.getPayInfo(riCode);
	}
	
	@PatchMapping("/pay-cancel/{riCode}")
	@ResponseBody
	public int updateRefund(@PathVariable("riCode") String riCode) {
		return payService.updateRefund(riCode);
	}
}
