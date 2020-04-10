package com.pro.semi;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "/find_id.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> find_id(String m_name, String m_phone) {
		Map<String, String> map = new HashMap<String, String>();
		
		String m_id = m_dao.findID(m_name, m_phone);
		
		if(m_id != null) {
			map.put("m_id", m_id);
		}else {
			map.put("chk", "1");
		}
		return  map;
	} 
	
	@RequestMapping(value = "/find_pw.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> find_pw(String m_id, String question, String answer) {
		Map<String, String> map = new HashMap<String, String>();
		
		String m_pw = m_dao.findPW(m_id, question, answer);
		
		if(m_pw != null) {
			map.put("m_pw", m_pw);
		}else {
			map.put("chk", "1");
		}
		
		return map;
	} 
	
}
