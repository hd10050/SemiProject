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
public class AdminAdWriteAction {
	
	@Autowired
	private ServletContext application;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/ad_write_form.inc")
	public ModelAndView write() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_ad_write");
		return mv;
	}
	
}
