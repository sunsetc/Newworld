package xyz.tour.newworld.vo;

import lombok.Data;

@Data
public class BoardReviewVO {

	private int brNum;
	private String brContent;
	private int brStar;
	private String brGiCodeFo;
	private String brGiCodeHo;
	private String brData;
	private String uiId;
	private String giCode;
	private String uiName;
	private String giName;
	private int page;
	private int rows;
	private String riCode;
}
