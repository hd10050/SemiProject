package com.pro.semi.aspect;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.data.vo.AdVO;

import mybatis.dao.AdDAO;

@Aspect
@Component
public class BannerAspect {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdDAO a_dao;
	
	@Pointcut("execution(* com.pro.semi.*.aop*(..))")	// Controller package의 모든 클래스의 이름에 aop가 붙은 Method
	private void bannerPointcut() { }
	
	// Advice (공통적 기능 처리) ------------------------------------
	@Around("bannerPointcut()")
	public Object check(ProceedingJoinPoint pjp) throws Throwable {
		Object obj = null;
		// before ---------------------------------------------------
		AdVO[] ad_ar = a_dao.totalList();
		if(ad_ar != null && ad_ar.length > 0) {
			for(int i = 0 ; i < ad_ar.length ; i++) {
				String src = ad_ar[i].getLocation();
				String href = ad_ar[i].getLink();
				request.setAttribute(src+"_src", ad_ar[i].getContent());
				request.setAttribute(src+"_href", href);
			}
		}
		// 엑박 기본 이미지
		request.setAttribute("no_image", "https://i.ibb.co/bHq2h0f/no-image.png");
		request.setAttribute("banner_no_image", "https://i.ibb.co/Qk6tXnB/banner-no-image.png");
		// ----------------------------------------------------------
		
		obj = pjp.proceed();	// 핵심 분야
		
		return obj;
	}
	
	
}
