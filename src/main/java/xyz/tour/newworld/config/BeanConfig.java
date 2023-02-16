package xyz.tour.newworld.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.siot.IamportRestClient.IamportClient;

@Configuration
@PropertySource("classpath:env.properties")
public class BeanConfig {

	@Value("${iamport.id}")
	private String iamportId;
	@Value("${iamport.pwd}")
	private String iamportPwd;
	
	@Bean
	IamportClient iamportClient() {
		return new IamportClient(iamportId, iamportPwd);
	}
	
}
