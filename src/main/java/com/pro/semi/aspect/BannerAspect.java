package com.pro.semi.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class BannerAspect {
	
	@Autowired
	private HttpServletRequest request;
	
	@Pointcut("execution(* com.test.aop.*.aop*(..))")	// Controller package의 모든 클래스의 이름에 aop가 붙은 Method
	private void bannerPointcut() { }
	
	// Advice (공통적 기능 처리) ------------------------------------
	@Around("bannerPointcut()")
	public Object check(ProceedingJoinPoint pjp) throws Throwable {
		Object obj = null;
		
		// before ---------------------------------------------------
		request.setAttribute("", "");
		// ----------------------------------------------------------
		
		obj = pjp.proceed();	// 핵심 분야
		
		return obj;
	}
	
	
}
