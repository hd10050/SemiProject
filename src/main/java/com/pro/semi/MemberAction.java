package com.pro.semi;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemberVO;

import mybatis.dao.MemDAO;

@Controller
public class MemberAction {

	@Autowired
	private MemDAO m_dao;
	
	@RequestMapping("/reg.inc")
	public String reg() {
		return "memreg";
	}
	
	@ResponseBody
	@RequestMapping("/memreg.inc")
	public Map<String, String> memreg(MemberVO mvo) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println(mvo.getM_id());
		System.out.println(mvo.getM_name());
		System.out.println(mvo.getM_phone());
		System.out.println(mvo.getM_gender());
		System.out.println(mvo.getM_pw());
		String chk = "0";
		if(m_dao.join(mvo)) {
			chk = "1";
		} 
		map.put("chk", chk);
		//mv.setViewName("redirect:/login.inc");
		
		return map;
	}
	
	@RequestMapping("/login.inc")
	public String login() {
		return "login";
	}
}  
;