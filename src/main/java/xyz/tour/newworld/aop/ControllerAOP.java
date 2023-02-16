package xyz.tour.newworld.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.vo.UserInfoVO;


import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class ControllerAOP {

	@Around("@annotation(xyz.tour.newworld.anno.CheckAuth)")
	public Object aroundController(ProceedingJoinPoint pjp) throws Throwable {
		ServletRequestAttributes reqAttr = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();  //세션 가져오기
		HttpServletRequest req = reqAttr.getRequest();
		HttpSession session = req.getSession();
		if(session.getAttribute("userInfo")==null) {
//			return new ResponseEntity<>("로그인 안하냐??",HttpStatus.UNAUTHORIZED);
			req.setAttribute("msg", "로그인을 해야만 접근이 가능합니다.");
			return "views/newworld/login";
		}
		return pjp.proceed();
	}
	


	@Around("execution(* xyz.tour.newworld.controller.ViewsController.goPage(..))")
	public Object viewAuthCheck(ProceedingJoinPoint pjp) throws Throwable {
		ServletRequestAttributes reqAttr = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
		HttpServletRequest req = reqAttr.getRequest();
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		if(uri.startsWith("/views/auth/") && session.getAttribute("userInfo")==null) {
			req.setAttribute("msg", "로그인을 해야만 접근이 가능합니다.");
			return "views/login";
		}//uri받아왔는데 /views/auth/로 시작하고 세션에서 유저인포 뽑아왔는데 null이면 로그인창으로 가.
//		Object ojb = pjp.proceed();
//		if(ojb==null) {
//			log.debug("type of=>null");
//			return null;
//		}ㄴ
//		log.debug("type of=>{}", ojb.getClass());
//		return ojb;
		return pjp.proceed();
	}
}

