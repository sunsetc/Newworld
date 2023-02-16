package xyz.tour.newworld.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileInfoVO {

	private int fiNum;
	private String fiName;
	private String fiPath;
	private String fiContent;
	private MultipartFile file;
}
