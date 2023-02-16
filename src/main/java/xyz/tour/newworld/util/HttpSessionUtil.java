package xyz.tour.newworld.util;


import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import xyz.tour.newworld.vo.UserInfoVO;


public class HttpSessionUtil {

	public static HttpSession getSession() {
		 ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		 return attr.getRequest().getSession();
	}
	
	
	public static Object getAttribute(String key) {
		HttpSession session = getSession();
		return session.getAttribute(key);
	}
	
	
	public static UserInfoVO getUserInfo() {
		HttpSession session = getSession();
		if(session.getAttribute("userInfo")==null) {
			throw new RuntimeException("로그인 필수!");
		}
		return (UserInfoVO)session.getAttribute("userInfo");
	}

	public static void setAttribute(String key, Object value) {
		HttpSession session = getSession();
		session.setAttribute(key, value);
	}
}
