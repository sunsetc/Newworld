package xyz.tour.newworld.vo.board;

import lombok.Data;

@Data
public class BoardNoteVO {
	private int bnNum;
	private String bnTitle;
	private String bnWriter;
	private String bnContent;
	private String bnCategory;
	private String bnCredat;
}
