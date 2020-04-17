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
public class BbsWriteAction {
	
	@Autowired
	private BbsDAO bbsDao;
	@Autowired
	private ServletContext application;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	private String uploadPath = "/resources/upload";
	private String editorPath = "/resources/editor_img";
	
	@RequestMapping(value="/write_form.inc", method=RequestMethod.POST)
	public ModelAndView write(String type, String nowPage, String m_idx) {
		ModelAndView mv = new ModelAndView();
		if(type == null) {
			type = "4";
		}
		if(nowPage == null) {
			nowPage = "1";
		}
		
		mv.addObject("m_idx", m_idx);
		mv.addObject("type", type);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("bbsWrite");
		return mv;
	}
	
	@RequestMapping(value="/write.inc", method=RequestMethod.POST)
	public ModelAndView write(BbsVO vo) throws Exception {
		System.out.println(vo.getStatus());
		
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
		
		bbsDao.add(vo);
		
		mv.setViewName("redirect:/bbs.inc?s_type=" + vo.getType());
		return mv;
	}
	
	@RequestMapping(value="/saveImage.inc", method=RequestMethod.POST)
    @ResponseBody
	public Map<String, String> saveImage(BbsVO vo) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String f_name = "";
		
		if(vo.getFile() != null && vo.getFile().getSize() > 0) {
			String path = application.getRealPath(editorPath);
			f_name = (vo.getFile().getOriginalFilename());
			f_name = (FileRenameUtil.CheckFileName(path, f_name));
			
			// 파일 올리기
			vo.getFile().transferTo(new File(path, f_name));
		}
		map.put("url", request.getContextPath() +  editorPath + "/" + f_name);
		return map;
	}
	
}
