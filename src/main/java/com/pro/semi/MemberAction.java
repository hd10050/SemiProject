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
import spring.util.CryptoUtil;

@Controller
public class MemberAction {

	@Autowired
	private MemDAO m_dao;
	
	@RequestMapping("/reg.inc")
	public String reg() {
		return "memreg";
	}
	
	
	
	@RequestMapping("/reg_tos.inc")
	public String tos() {
		return "TOS";
		
	}
	

	@RequestMapping("/memreg.inc")
	@ResponseBody
	public Map<String, String> memreg(String m_idx, String m_id, String m_pw, String m_name, String m_gender, 
			String m_status, String m_phone, String r_snscode, String m_level, String question, String answer) throws Exception{
		
		CryptoUtil pass = new CryptoUtil();
		String pw = pass.CryptoSHA3(m_pw, 256);
		
		MemberVO mvo = new MemberVO(m_idx, m_id, pw, m_name, m_gender, m_status, m_phone, r_snscode, m_level, question, answer);
		//System.out.println(m_id + " : " + mvo.getM_id());
		//System.out.println(pw);
		Map<String, String> map = new HashMap<String, String>();
		String chk = "0";
		if(m_dao.join(mvo)) {
			chk = "1";
		} 
		map.put("chk", chk);
		//mv.setViewName("redirect:/login.inc");
		
		return map;
	}
	

}  
;