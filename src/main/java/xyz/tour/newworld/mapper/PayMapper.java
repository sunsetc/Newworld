package xyz.tour.newworld.mapper;

import xyz.tour.newworld.vo.pay.PayResponseVO;

public interface PayMapper {

	int payinsert(PayResponseVO payResponse);
	int updateCheck(String riCode);
	PayResponseVO selectPayInfo(String riCode);
	PayResponseVO selectPay(PayResponseVO payResponseVO);
	int updateRefund(String riCode);
}
