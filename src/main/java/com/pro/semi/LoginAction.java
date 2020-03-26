package com.pro.semi;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemberVO;

import mybatis.dao.MemDAO;

@Controller
public class LoginAction {

	@Autowired
	HttpSession session;

	@Autowired
	MemDAO m_dao;
	
	@RequestMapping(value = "/login.inc", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.inc", method = RequestMethod.POST)
	public Map<String, String> login(String m_id, String m_pw){
		System.out.println(m_id);
		System.out.println(m_pw);
		
		
		Map<String, String>map = new HashMap<String, String>();
		
		MemberVO mvo = m_dao.login(m_pw, m_id);
		System.out.println("mvo.getM_idx() = " + mvo.getM_idx());
		
		String chk = "0";
		if(mvo != null) {
			session.setAttribute("mvo", mvo);
		}else {
			chk = "1";
		}
		
		map.put("chk", chk);
		
		return map;
	}
}
