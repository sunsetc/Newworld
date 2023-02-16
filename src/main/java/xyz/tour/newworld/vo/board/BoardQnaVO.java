package xyz.tour.newworld.vo.board;

import lombok.Data;

@Data
public class BoardQnaVO {
	private int bqNum;
	private String bqTitle;
	private String bqContent;
	private String bqComment;
	private String bqCredat;
	private String bqCategory;
	private int uiNum;
	private String uiName;
	private String uiEmail;
	private String uiPhone;
	private String riCode;
	private String bqCmtCheck;
}
