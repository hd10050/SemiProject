package com.pro.semi;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemDAO;

@Controller
public class FindAction {

	@Autowired
	MemDAO m_dao;
	
	@RequestMapping(value = "/find.inc", method=RequestMethod.GET)
	public String find() {
		return "find";
	}
	
	@RequestMapping(value = "/find_pw.inc", method=RequestMethod.POST)
	public ModelAndView find_pw() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	} 
	
}
