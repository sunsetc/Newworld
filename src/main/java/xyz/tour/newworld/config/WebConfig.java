package xyz.tour.newworld.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	private static final String BASE_PATH;
	static {
		String osName = System.getProperty("os.name");
		if(osName.toUpperCase().contains("WINDOW")) {
			BASE_PATH = "file:///C:";
		}else {
			BASE_PATH = "file:/";
		}
	}
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/files/**").addResourceLocations(BASE_PATH + "/file-upload/");
	}
}
