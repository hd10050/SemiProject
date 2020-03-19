package com.pro.semi;

import java.io.FileWriter;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.HospitalVO;
import com.data.vo.ProtectVO;
import com.data.vo.RescueVO;
import com.data.vo.StoreVO;

@Controller
public class ListAction {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/list.inc")
	public ModelAndView data(String s_type) throws Exception {
		ModelAndView mv = new ModelAndView();
		String type = null;
		if(s_type == null) {
			type = "0";
		} else {
			type = s_type;
		}
		System.out.println(type);
		request.setAttribute("type", type);
		switch(Integer.parseInt(type)) {
		case 0 :
			xmlP("https://openapi.gg.go.kr/WldnsRescueMedicalTreatInst?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, mv);
			break;
		case 1 :
			xmlP("https://openapi.gg.go.kr/Animalhosptl?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, mv);
			break;
		case 2 :
			xmlP("https://openapi.gg.go.kr/AnimalPharmacy?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, mv);
			break;
		case 3 :
			xmlP("https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, mv);
			break;
		}

		// -------------------------------------------------------
		mv.setViewName("main");

		return mv;
	}


	private void xmlP(String s_url, String type, ModelAndView mv) throws Exception {
		URL url = null;
		url = new URL(s_url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();		// 연결 객체

		conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
		conn.connect();
		// -------------------------------------------------------
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());	// XML문서 load

		Element root = doc.getRootElement();		// XML문서의 RootElement
		Element head = root.getChild("head");
		Element cnt = head.getChild("list_total_count");
		int count = (int)Math.ceil((double)(Integer.parseInt(cnt.getText()))/1000);
		// -------------------------------------------------------
		switch(Integer.parseInt(type)) {
		case 0:
			RescueVO[] r_ar = new RescueVO[Integer.parseInt(cnt.getText())];
			for(int j = 0 ; j < count ; j++) {
				String s_url2 = s_url + "&pIndex=" + (j+1);
				url = new URL(s_url2);
				conn = (HttpURLConnection) url.openConnection();		// 연결 객체
				conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
				conn.connect();
				// -------------------------------------------------------
				doc = builder.build(conn.getInputStream());	// XML문서 load

				root = doc.getRootElement();		// XML문서의 RootElement
				List<Element> l_list = root.getChildren("row");
				for(int i = 0 ; i < l_list.size() ; i++) {
					Element e = l_list.get(i);
	
					RescueVO vo = new RescueVO(e.getChildText("SUM_YM"), e.getChildText("SIGUN_NM"), e.getChildText("SIGUN_CD"), e.getChildText("RESCUE_INST_NM"), e.getChildText("RESCUE_INST_TELNO"),
							e.getChildText("REFINE_ZIP_CD"), e.getChildText("REFINE_LOTNO_ADDR"), e.getChildText("REFINE_ROADNM_ADDR"), e.getChildText("REFINE_WGS84_LAT"), e.getChildText("REFINE_WGS84_LOGT"));
	
					r_ar[i] = vo;
				}
			}
			mv.addObject("ar", r_ar);
			session.setAttribute("ar", r_ar);
			mv.addObject("length", r_ar.length);
			break;
		case 1:
			HospitalVO[] h_ar = new HospitalVO[Integer.parseInt(cnt.getText())];
			for(int j = 0 ; j < count ; j++) {
				String s_url2 = s_url + "&pIndex=" + (j+1);
				url = new URL(s_url2);
				conn = (HttpURLConnection) url.openConnection();		// 연결 객체
				conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
				conn.connect();
				// -------------------------------------------------------
				doc = builder.build(conn.getInputStream());	// XML문서 load

				root = doc.getRootElement();		// XML문서의 RootElement
				List<Element> l_list = root.getChildren("row");
				for(int i = 0 ; i < l_list.size() ; i++) {
					Element e = l_list.get(i);
	
					HospitalVO vo = new HospitalVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),
							e.getChildText("LICENSG_DE"),e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),
							e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),
							e.getChildText("LOCPLC_ZIP_CD"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_LOTNO_ADDR"),
							e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("BIZCOND_DIV_NM_INFO"),
							e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
							e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
	
					h_ar[i] = vo;
				}
			}
			mv.addObject("ar", h_ar);
			session.setAttribute("ar", h_ar);
			mv.addObject("length", h_ar.length);
			break;
		case 2:
			StoreVO[] s_ar = new StoreVO[Integer.parseInt(cnt.getText())];
			for(int j = 0 ; j < count ; j++) {
				String s_url2 = s_url + "&pIndex=" + (j+1);
				url = new URL(s_url2);
				conn = (HttpURLConnection) url.openConnection();		// 연결 객체
				conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
				conn.connect();
				// -------------------------------------------------------
				doc = builder.build(conn.getInputStream());	// XML문서 load

				root = doc.getRootElement();		// XML문서의 RootElement
				List<Element> l_list = root.getChildren("row");
				for(int i = 0 ; i < l_list.size() ; i++) {
					Element e = l_list.get(i);
	
					StoreVO vo = new StoreVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),e.getChildText("LICENSG_DE"),
							e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),
							e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),
							e.getChildText("REFINE_LOTNO_ADDR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("bIZCOND_DIV_NM_INFO"),
							e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
							e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
	
					s_ar[i] = vo;
				}
			}
			mv.addObject("ar", s_ar);
			session.setAttribute("ar", s_ar);
			mv.addObject("length", s_ar.length);
			break;
		case 3:
			ProtectVO[] p_ar = new ProtectVO[Integer.parseInt(cnt.getText())];
			for(int j = 0 ; j < count ; j++) {
				String s_url2 = s_url + "&pIndex=" + (j+1);
				url = new URL(s_url2);
				conn = (HttpURLConnection) url.openConnection();		// 연결 객체
				conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
				conn.connect();
				// -------------------------------------------------------
				doc = builder.build(conn.getInputStream());	// XML문서 load

				root = doc.getRootElement();		// XML문서의 RootElement
				List<Element> l_list = root.getChildren("row");
				for(int i = 0 ; i < l_list.size() ; i++) {
					Element e = l_list.get(i);
	
					ProtectVO vo = new ProtectVO(e.getChildText("SUM_YY"),e.getChildText("SIGUN_NM"),e.getChildText("SIGUN_CD"),e.getChildText("ENTRPS_NM"),
							e.getChildText("ENTRPS_TELNO"),e.getChildText("REPRSNTV_NM"),e.getChildText("CONTRACT_PERD"),e.getChildText("ACEPTNC_ABLTY_CNT"),
							e.getChildText("CORPR_ANIMAL_HOSPTL_DTLS"),e.getChildText("RM_MATR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_LOTNO_ADDR"),
							e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"));
	
					p_ar[i] = vo;
				}
			}
			mv.addObject("ar", p_ar);
			session.setAttribute("ar", p_ar);
			mv.addObject("length", p_ar.length);
			break;
		}
	}
	
	
}
