package com.pro.semi;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// Post방식
	@RequestMapping(value="/editMem1.inc", method=RequestMethod.POST,produces ="text/json;charset=utf-8")
	public ModelAndView EditMem(MemberVO vo) {
		System.out.println("제발 들어오렴");
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mvo.setM_gender(vo.getM_gender());
		mvo.setM_name(vo.getM_name());
		mvo.setM_phone(vo.getM_phone());
		mvo.setM_pw(vo.getM_pw());
		
		ModelAndView mv = new ModelAndView();
		m_dao.updateMem(mvo);
		session.setAttribute("mvo", mvo);
		
//		vo.setM_idx(mvo.getM_idx());
//		vo.setM_id(mvo.getM_id());
//		vo.setM_status(mvo.getM_status());
//		m_dao.updateMem(vo);
//		session.setAttribute("mvo", vo);
		return mv;
	}
	
	@RequestMapping("/memdel")
	public ModelAndView del() {
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	@RequestMapping(value="/memleave.inc", method=RequestMethod.POST,produces ="text/json;charset=utf-8")
	public ModelAndView leave(@RequestParam("pwd") String dd) {
		ModelAndView mv = new ModelAndView();
		
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		
		if(mvo.getM_pw().equals(dd)) {
		
			m_dao.delMem(mvo);
			
			session.removeAttribute("mvo");
			
			mv.addObject("result", true);

		} else {
			mv.addObject("result", false);
		}
		mv.setViewName("memdelresult");
		
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
}
