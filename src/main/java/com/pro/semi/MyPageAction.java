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
	
	
	//마이페이지 이동
	@RequestMapping("/myPage.inc")
	public ModelAndView myPage() {
		
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mv.addObject("mvo",mvo);
		mv.setViewName("memview");
		return mv;
	}

	//마이페이지의 개인정보 뿌려주는 페이지 이동
	@RequestMapping("/meminfo.inc")
	public ModelAndView memInfo() { 
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mv.addObject("mvo",mvo);
		mv.setViewName("memInfo");
		return mv;
	}
	
	
	
	//수정 패스워드 확인 페이지로 이동
	@RequestMapping("/memchk.inc")
	public String memchk1() {
		return "memchk";
	}

	//수정 패스워드 확인 페이지에서 수정하기 버튼 눌렀을 시
	@RequestMapping(value = "/editchk.inc" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> editchk(String pwd) {
		
		Map<String, String> map = new HashMap<String, String>();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		
		if(mvo.getM_pw().equals(pwd)) {
			map.put("chk", "1");	
		}else {
			map.put("chk", "2");	
		}
		return map;
	}
	
	//수정 jsp 이동
	@RequestMapping("editmove.inc")
	public ModelAndView editmove() {
		
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mv.addObject("mvo",mvo);
		mv.setViewName("memedit");
		return mv;
	}
	
	
	
	// 수정 기능
	@RequestMapping(value="/editMem1.inc", method = {RequestMethod.POST, RequestMethod.GET})
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
	
	//탈퇴 jsp 이동
	@RequestMapping("/memdel")
	public ModelAndView del() {
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	//탈퇴 기능
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
