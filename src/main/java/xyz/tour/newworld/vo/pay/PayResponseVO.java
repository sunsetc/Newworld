package xyz.tour.newworld.vo.pay;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class PayResponseVO {

	private String impUid;
	private String merchantUid;
	private String payMethod;
	private String pgProvider;
	private String pgTid;
	private String applyNum;
	private String cardName;
	private int cardQuota;
	private String name;
	private String amount;
	private String buyerName;
	private String status;
	private String failReason;
	private int paidAt;
	private int startedAt;
	private String giName;
	private String cancelAmount;
	private String cancelReason;
	private String riCode;
}
