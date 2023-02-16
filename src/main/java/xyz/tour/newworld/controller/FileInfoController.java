package xyz.tour.newworld.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.service.FileInfoService;
import xyz.tour.newworld.util.FileUtil;
import xyz.tour.newworld.vo.FileInfoVO;

@RestController
@Slf4j
public class FileInfoController {

	@Autowired
	private FileInfoService fileInfoService;
	@Autowired
	private FileUtil fileUtil;

	@PostMapping("/file-infos")
	public int fileUpload(@RequestBody FileInfoVO fileInfo) throws IllegalStateException, IOException {
		// log.debug("fileInfo=>{}", fileInfo); //이런식으로 컨트롤러에 찍어놓는다
		//int result = fileInfoService.insertFileInfo(fileInfo);
		//return result;
		return fileInfoService.insertFileInfo(fileInfo);
	}
	
	@PostMapping("/file-upload")
	public String fileUpload2(@ModelAttribute FileInfoVO fileInfo) throws IllegalAccessException, IOException{
		log.debug("upload file=>{}", fileInfo.getFile());
		log.debug("upload file size=>{}", fileInfo.getFile().getSize());
		
		return fileUtil.saveFile(fileInfo.getFile());
	}
}
