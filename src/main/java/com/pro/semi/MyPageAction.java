package com.pro.semi;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemberVO;

import mybatis.dao.MemDAO;

@Controller
public class MyPageAction {

	@Autowired
	MemDAO m_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/myPage.inc")
	public ModelAndView myPage() {
		
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mv.addObject("mvo",mvo);
		mv.setViewName("memview");
		return mv;
	}
	
	// Get방식
	@RequestMapping("/editMem.inc")
	public String myPage1(MemberVO vo) {
		return "memedit";
	}
	
	// 수정
	@RequestMapping(value="/editMem1.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> EditMem(MemberVO vo) {
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mvo.setM_gender(vo.getM_gender());
		mvo.setM_name(vo.getM_name());
		mvo.setM_phone(vo.getM_phone());
		mvo.setM_pw(vo.getM_pw());

		Map<String, String> map = new HashMap<String, String>();
		if (m_dao.updateMem(mvo)) {
			map.put("chk","1");
		} else {
			map.put("chk","0");
		}
		session.setAttribute("mvo", mvo);
		return map;
	}
	

	@RequestMapping("/memdel")
	public ModelAndView del() {
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	//탈퇴
	@RequestMapping(value="/memleave.inc",	method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, String> leave(String pwd) {

		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		Map<String, String> map = new HashMap<String, String>();

		if(mvo.getM_pw().equals(pwd)) {
				m_dao.delMem(mvo); 
				map.put("chk", "1");	
				session.removeAttribute("mvo");
				
		} else {
			map.put("chk", "2");	
		}
		return map;
	}
	
	
	
	
	
	
	
	
	
}
