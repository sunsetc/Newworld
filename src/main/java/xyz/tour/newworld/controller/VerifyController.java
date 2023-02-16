package xyz.tour.newworld.controller;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.mapper.PayMapper;
import xyz.tour.newworld.vo.pay.PayResponseVO;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/verifyIamport")
public class VerifyController {

	//iamport 결제 검증 컨트롤러 build.gradle 확인
	private final IamportClient iamportClient;
	
	@Autowired
	private PayMapper payMapper;
	
	//프론트에서 받은 pg사 결과값을 통해 토큰 발행 (30분 유효)
	
	@PostMapping("/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException{
		log.info("paymentByImpUid 진입");
		log.info("accessToken=>{}", iamportClient.getAuth().getResponse().getToken());
		return iamportClient.paymentByImpUid(imp_uid);
	}
	
	@PostMapping("/cancel")
	
	public PayResponseVO cancelVO (PayResponseVO payResponse) throws IamportResponseException, IOException{
		log.info("cancelPaymentByImpUid 진입");
		log.info("accessToken=>{}", iamportClient.getAuth().getResponse().getToken());
		payMapper.selectPay(payResponse);
		log.info("pay=>{}", payMapper.selectPay(payResponse));
		CancelData cancelData = new CancelData(payResponse.getImpUid(), true);
		iamportClient.cancelPaymentByImpUid(cancelData);
		return payResponse;
		
	}

}

//paymentByImpUid 검증에 필요한 함수(아임포트서버에서 imp_uid를 검사하여 데이터를 보내줌). 사용하기 위해 토큰발급 필요.
//토큰 발급 위해 REST 키, 비번 필요. 
//생성자를 통해 키, 비번 주입. 토큰발급 용이하게 함.