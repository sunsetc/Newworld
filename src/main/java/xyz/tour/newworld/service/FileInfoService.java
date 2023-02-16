package xyz.tour.newworld.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import xyz.tour.newworld.mapper.FileInfoMapper;
import xyz.tour.newworld.vo.FileInfoVO;

@Service
@PropertySource("classpath:env.properties")
public class FileInfoService {
	@Value("${file.path}")
	private String filePath;

	@Autowired
	private FileInfoMapper fileInfoMapper;
	
	public int insertFileInfo(FileInfoVO fileInfo) throws IllegalStateException, IOException {
		if(fileInfo.getFile()==null) {
			throw new RuntimeException("파일은 필수 입니다.");
		}
		MultipartFile mf = fileInfo.getFile();  //MultipartFile은 스프링에서 업로드 한 파일을 표현할 때 사용,  업로드한 파일의 이름, 실제 데이터, 파일 크기 등을 구할 수 있음
		String fiName = mf.getOriginalFilename();  //업로드한 파일의 이름을 구함
		String fiPath = filePath + UUID.randomUUID().toString(); //UUID는 고유값을 만들어줌(파일명 중복방지)
		fileInfo.setFiName(fiName);  
		fileInfo.setFiPath(fiPath);
		File tmpFile = new File(fiPath);  //해당 경로를 갖는 file객체 생성
		mf.transferTo(tmpFile);  //업로드한 파일을 특정 파일로 저장
		int result = fileInfoMapper.insertFileInfo(fileInfo);
		result += fileInfoMapper.insertFileInfo(fileInfo);
		return result;
	}
}
