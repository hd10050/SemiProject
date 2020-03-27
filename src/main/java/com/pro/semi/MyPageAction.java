package com.pro.semi;

import java.lang.reflect.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemberVO;

import mybatis.dao.MemDAO;

@Controller
public class MyPageAction {

	@Autowired
	MemDAO m_dao;
	
	
	
	@RequestMapping("/myPage.inc")
	public String myPage(MemberVO vo) {
		return "memview";
	}
	
	// Get방식
	@RequestMapping("/editMem.inc")
	public String myPage1(MemberVO vo) {
		return "memedit";
	}
	
	// Post방식
	@RequestMapping(value="/editMem1.inc", method=RequestMethod.POST,produces ="text/json;charset=utf-8")
	@ResponseBody
	public ModelAndView EditMem(MemberVO vo) {
		System.out.println("제발 들어오렴");
		ModelAndView mv = new ModelAndView();	
		boolean result = m_dao.pwdCheck(vo.getM_id(), vo.getM_pw());
		if(result) {
			m_dao.updateMem(vo);
			mv.setViewName("myPage.inc");
		}
		return mv;
	}
	
	
	
	
	
	
	
}
