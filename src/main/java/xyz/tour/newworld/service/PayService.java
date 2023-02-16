package xyz.tour.newworld.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.mapper.PayMapper;
import xyz.tour.newworld.vo.pay.PayResponseVO;

@Service
@Slf4j
public class PayService {

	@Autowired
	private PayMapper payMapper;
	
	public int payinsert(PayResponseVO payResponseVO) {
		if(payMapper.payinsert(payResponseVO)==1) {
			payMapper.updateCheck(payResponseVO.getMerchantUid());
			log.debug("updateCheck=>{}",payMapper.updateCheck(payResponseVO.getMerchantUid()));
		}
		return 0;
	}
	
	public PayResponseVO getPayInfo(String riCode) {
		log.debug("result=>{}",payMapper.selectPayInfo(riCode));
		return payMapper.selectPayInfo(riCode);
	}
	
	public int updateRefund(String riCode) {
		return payMapper.updateRefund(riCode);
	}
}
