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
	public String loginForm() { return "login"; }
	
	@ResponseBody
	@RequestMapping(value = "/login.inc", method = RequestMethod.POST)
	public Map<String, String> login(String m_id, String m_pw){
		Map<String, String>map = new HashMap<String, String>();
		
		MemberVO mvo = m_dao.login(m_pw, m_id);
		//System.out.println("mvo.getM_idx() = " + mvo.getM_idx());
		
		if(mvo != null) {
			session.setAttribute("mvo", mvo);
			map.put("chk","0");
			
		}else if(mvo == null){
			
			map.put("chk", "1");
			
		}
		
		return map;
	}
	
	// -------------------------------------------------------------------------
	
	@RequestMapping("/callback.inc")
	public String callback() { return "callback"; }
	
	@RequestMapping("/googlelogin.inc")
	public String googlelogin() { return "googlelogin"; }
	
	@RequestMapping("/snslogin.inc")
	public ModelAndView snsloginForm(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		MemberVO mvo = m_dao.snslogin(vo.getR_snscode()); 
		if(mvo != null) {
			// 현재 r_snscode로 회원가입한 계정이 있는 경우
			session.setAttribute("mvo", mvo);
			mv.setViewName("redirect:main.inc");
		} else {
			// 현재 r_snscode로 회원가입한 계정이 없는 경우
			mv.addObject("regist_vo", vo);
			mv.setViewName("memreg");
		}
		return mv;
	}
	
	@RequestMapping(value = "/kakaocall.inc")
	public String kakaocall() { return "kakaocall"; }
	
}
