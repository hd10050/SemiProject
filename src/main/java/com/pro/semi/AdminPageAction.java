package com.pro.semi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemberVO;

import mybatis.dao.MemDAO;

@Controller
public class AdminPageAction {

	@Autowired
	private MemDAO memDao;
	
	@RequestMapping(value="/ad_page.inc", method=RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView mv = new ModelAndView();
		MemberVO[] ar = memDao.mem_list();
		
		mv.addObject("ar", ar);
		mv.setViewName("adminPage");
		
		return mv;
	}
	
	@RequestMapping(value="/ad_changelv.inc", method=RequestMethod.POST)
	public ModelAndView ad_changeLevel(MemberVO vo) {
		System.out.println("ad_changeLevel.inc");
		ModelAndView mv = new ModelAndView();
		memDao.mem_change(vo);
		
		mv.setViewName("redirect:/ad_page.inc");
		return mv;
	}
	
	@RequestMapping(value="/ad_ban.inc", method=RequestMethod.POST)
	public ModelAndView ad_ban(String m_idx) {
		System.out.println("ad_ban.inc");
		ModelAndView mv = new ModelAndView();
		MemberVO vo = memDao.get_mem(m_idx);
		memDao.delMem(vo);
		
		mv.setViewName("redirect:/ad_page.inc");
		return mv;
	}
	
	
	
	
}

