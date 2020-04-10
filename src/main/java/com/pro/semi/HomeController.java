package com.pro.semi;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.BbsVO;

import mybatis.dao.BbsDAO;
import mybatis.dao.MemDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BbsDAO b_dao;
	
	@Autowired
	HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:main.inc");
		return mv;
	}
	
	@RequestMapping("/main.inc")
	public ModelAndView main_jsp(String nowPage, String s_type) {
		ModelAndView mv = new ModelAndView();
		
		nowPage = "1";
		String type = "4";
		int begin = 1;
		int end = 5;
		BbsVO[] ar = null;
		
		ar = b_dao.getList(begin, end, type);
		
		session.setAttribute("ar", ar);
		mv.addObject("ar", ar);
		mv.setViewName("main");
		
		return mv;
	}
		
	
}
