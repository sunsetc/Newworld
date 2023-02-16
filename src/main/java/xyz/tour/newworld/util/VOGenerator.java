package xyz.tour.newworld.util;


import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class VOGenerator {

	public static void main(String[] args) throws IOException {
		Path path = Paths.get("");
		String absolutePath = path.toAbsolutePath().toString() + "\\src\\main\\java\\xyz\\tour\\newworld\\vo\\";
		log.info("absolutePath=>{}", absolutePath);	//내가 현재 있는 절대경로
		FileOutputStream fos = new FileOutputStream(absolutePath + "TestVO.java");
		String fileText = "package xyz.tour.newworld.vo;\r\n"
				+ "\r\n"
				+ "import lombok.AllArgsConstructor;\r\n"
				+ "import lombok.Data;\r\n"
				+ "import lombok.NoArgsConstructor;\r\n"
				+ "\r\n"
				+ "@Data\r\n"
				+ "@NoArgsConstructor\r\n"
				+ "@AllArgsConstructor\r\n"
				+ "public class UserInfo2VO {\r\n"
				+ "}";
		byte[] fileTextBytes = fileText.getBytes();
		fos.write(fileTextBytes);
		fos.close();
	}
}
