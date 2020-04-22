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

import com.data.vo.AdVO;
import com.data.vo.BbsVO;
import com.data.vo.MemberVO;
import com.data.vo.ReviewVO;

import mybatis.dao.AdDAO;
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
	@Autowired
	private AdDAO adDao;
	
	private String adPath = "/resources/ad_img";
	
	@RequestMapping("/ad_write_form.inc")
	public ModelAndView admin_ad_write() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_ad_write");
		return mv;
	}
	
	@RequestMapping(value="/ad_write_chk.inc", method=RequestMethod.POST)
    @ResponseBody
    public Map<String,String> ad_write_chk(String location) {
		Map<String,String> map = new HashMap<String,String>();
		if(adDao.getAd(location) == null) {
			map.put("chk", "1");
		} else {
			map.put("chk", "0");
		}
		return map;
    }
    
    @RequestMapping(value="/ad_write.inc", method=RequestMethod.POST)
	public ModelAndView write(AdVO vo) throws Exception {
    	ModelAndView mv = new ModelAndView();
		
		// ------------------------------------------------------
		MultipartFile mf = vo.getFile();
		String f_name;
		if(mf != null && mf.getSize() > 0) {
			String path = application.getRealPath(adPath);
			vo.setOri_name(mf.getOriginalFilename());
			vo.setFile_name(FileRenameUtil.CheckFileName(path, vo.getOri_name()));

			// 파일 올리기
			f_name = (vo.getFile().getOriginalFilename());
			f_name = (FileRenameUtil.CheckFileName(path, f_name));
			vo.setContent(request.getContextPath() +  adPath + "/" + f_name);
			mf.transferTo(new File(path, vo.getFile_name()));
		} else {
			vo.setFile_name("");
			vo.setOri_name("");
		}
		// ------------------------------------------------------
		adDao.add(vo);
		// ------------------------------------------------------
		mv.setViewName("redirect:/ad_ad.inc");
		return mv;
	}

}
