package com.pro.semi;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.BbsVO;

import mybatis.dao.BbsDAO;

@Controller
public class BbsViewAction {
	

	@Autowired
	private BbsDAO bbsDao;
	@Autowired
	private ServletContext application;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="/bbs_view.inc", method=RequestMethod.POST)
	public ModelAndView sad(String type, String nowPage, String b_idx) {
		ModelAndView mv = new ModelAndView();
		BbsVO vo = bbsDao.view(b_idx);

		session.setAttribute("vo", vo);
		mv.addObject("vo", vo);
		mv.addObject("type", type);
		mv.addObject("nowPage", nowPage);
		mv.addObject("b_idx", b_idx);
		mv.setViewName("bbsView");
		return mv;
	}

}
