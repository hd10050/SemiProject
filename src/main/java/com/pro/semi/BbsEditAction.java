package com.pro.semi;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.BbsVO;
import com.data.vo.MemberVO;
import com.data.vo.ReviewVO;

import mybatis.dao.BbsDAO;
import spring.util.FileRenameUtil;

@Controller
public class BbsEditAction {
	
	@Autowired
	private BbsDAO bbsDao;
	@Autowired
	private ServletContext application;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	private String uploadPath = "/resources/upload";
	
	@RequestMapping(value="/edit_form.inc", method=RequestMethod.POST)
	public ModelAndView write(String type, String nowPage, String b_idx) {
		ModelAndView mv = new ModelAndView();
		
		BbsVO vo = bbsDao.view(b_idx);
		
		mv.addObject("vo", vo);
		mv.addObject("b_idx", b_idx);
		mv.addObject("type", type);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("bbsEdit");
		return mv;
	}
	
	@RequestMapping(value="/edit.inc", method=RequestMethod.POST)
	public ModelAndView write(BbsVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = vo.getFile();
		if(mf != null && mf.getSize() > 0) {
			String path = application.getRealPath(uploadPath);
			vo.setOri_name(mf.getOriginalFilename());
			vo.setFile_name(FileRenameUtil.CheckFileName(path, vo.getOri_name()));
			
			// 파일 올리기
			mf.transferTo(new File(path, vo.getFile_name()));
		} else {
			vo.setFile_name("");
			vo.setOri_name("");
		}
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		vo.setWriter(mvo.getM_name());
		
		bbsDao.viewEdit(vo);
		
		mv.addObject("type", vo.getType());
		mv.addObject("nowPage", vo.getNowPage());
		mv.addObject("b_idx", vo.getB_idx());
		mv.setViewName("redirect:/bbs_view.inc");
		
		return mv;
	}
	
}
