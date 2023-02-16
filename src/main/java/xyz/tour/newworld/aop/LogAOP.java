package xyz.tour.newworld.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
//aspect는 메모리생성하는 어노테이션이 아님(이것만 선언한다고 동작X)
@Component
@Aspect
@Slf4j
public class LogAOP {

	
	@Around("execution( * xyz.tour.newworld.controller..*Controller.*(..))") // *=접근제어자 상관없고 리턴타입 상관없다는 뜻
	//(..)메소드명, 매개변수 상관없다는 뜻 
	public Object aroundController(ProceedingJoinPoint pjp) throws Throwable {
		String signatureInfo = getSignatureInfo(pjp);
		log.debug("start==>{}", signatureInfo);
		long sTime = System.currentTimeMillis(); //원래는 스프링부트 스탑워치 쓰는것
		Object obj = pjp.proceed(); //여기서 controller로 간다
		long eTime = System.currentTimeMillis(); //우리 편하게 보라고 시스템 커런트~썼다
		log.debug("end==>{}", signatureInfo);
		log.debug("execute time=>{}", (eTime-sTime)/1000.00); //수행시간 구하기
		return obj;
	}
	
	@Before("within(@org.springframework.web.bind.annotation.RestController *)")
	public void beforeController(JoinPoint joinPoint) {
		log.debug("before controller");
	}
	
	@After("within(@org.springframework.web.bind.annotation.RestController *)")
	public void afterController(JoinPoint joinPoint) {
		log.debug("after controller");
	}
	
	private String getSignatureInfo(JoinPoint joinPoint) {
		String signatureName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getSimpleName();
		StringBuilder sb = new StringBuilder();
		sb.append(className).append('.').append(signatureName).append('(');
		Object[] args = joinPoint.getArgs();
		if (args != null && args.length > 0) {
			for (int i = 0; i < args.length; i++) {
				if (args[i] instanceof String)
					sb.append('\"');
				sb.append(args[i]);
				if (args[i] instanceof String)
					sb.append('\"');
				if (i < args.length - 1) {
					sb.append(',');
				}
			}
		}
		sb.append(')');
		return sb.toString();
	}

}
