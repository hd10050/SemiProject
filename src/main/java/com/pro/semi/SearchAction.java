package com.pro.semi;

import java.io.FileWriter;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class SearchAction {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/search.inc")
	public ModelAndView data(String s_type, String search_value, String search_type) throws Exception {
		System.out.println(s_type + " = s_type");
		System.out.println(search_value + " = search_value");
		System.out.println(search_type + " = search_type");
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
			xmlP("https://openapi.gg.go.kr/WldnsRescueMedicalTreatInst?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, search_value, search_type, mv);
			break;
		case 1 :
			xmlP("https://openapi.gg.go.kr/Animalhosptl?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, search_value, search_type, mv);
			break;
		case 2 :
			xmlP("https://openapi.gg.go.kr/AnimalPharmacy?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, search_value, search_type, mv);
			break;
		case 3 :
			xmlP("https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?KEY=3c4f29c142804973bb865407b581dd9b&pSize=1000", type, search_value, search_type, mv);
			break;
		}
		// -------------------------------------------------------
		request.setAttribute("chk", "1");
		mv.setViewName("main");

		return mv;
	}


	private void xmlP(String s_url, String type, String search_value, String search_type, ModelAndView mv) throws Exception {
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
			List<RescueVO> r_l = new ArrayList<RescueVO>();
			//RescueVO[] r_ar = new RescueVO[Integer.parseInt(cnt.getText())];
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
					// 0:지역 1:시설명
					if(search_type.equals("0")) {
						if (isContain(e.getChildText("SIGUN_NM"), search_value)) {
							RescueVO vo = new RescueVO(e.getChildText("SUM_YM"), e.getChildText("SIGUN_NM"), e.getChildText("SIGUN_CD"), e.getChildText("RESCUE_INST_NM"), e.getChildText("RESCUE_INST_TELNO"),
									e.getChildText("REFINE_ZIP_CD"), e.getChildText("REFINE_LOTNO_ADDR"), e.getChildText("REFINE_ROADNM_ADDR"), e.getChildText("REFINE_WGS84_LAT"), e.getChildText("REFINE_WGS84_LOGT"));
							//r_ar[i] = vo;
							r_l.add(vo);
						}
					} else if (search_type.equals("1")) {
						if (isContain(e.getChildText("RESCUE_INST_NM"), search_value)) {
							RescueVO vo = new RescueVO(e.getChildText("SUM_YM"), e.getChildText("SIGUN_NM"), e.getChildText("SIGUN_CD"), e.getChildText("RESCUE_INST_NM"), e.getChildText("RESCUE_INST_TELNO"),
									e.getChildText("REFINE_ZIP_CD"), e.getChildText("REFINE_LOTNO_ADDR"), e.getChildText("REFINE_ROADNM_ADDR"), e.getChildText("REFINE_WGS84_LAT"), e.getChildText("REFINE_WGS84_LOGT"));
							//r_ar[i] = vo;
							r_l.add(vo);
						}
					}
				}
			}
			RescueVO[] r_ar = new RescueVO[r_l.size()];
			r_ar = r_l.toArray(r_ar);
			mv.addObject("ar", r_ar);
			mv.addObject("pageCode", "검색 결과 : " + r_ar.length + " 건");
			session.setAttribute("ar", r_ar);
			mv.addObject("length", r_ar.length);
			break;
		case 1:
			List<HospitalVO> h_l = new ArrayList<HospitalVO>();
			//HospitalVO[] h_ar = new HospitalVO[Integer.parseInt(cnt.getText())];
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
					// 0:지역 1:시설명
					if(search_type.equals("0")) {
						if (isContain(e.getChildText("SIGUN_NM"), search_value)) {
							HospitalVO vo = new HospitalVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),
									e.getChildText("LICENSG_DE"),e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),
									e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),
									e.getChildText("LOCPLC_ZIP_CD"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_LOTNO_ADDR"),
									e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("BIZCOND_DIV_NM_INFO"),
									e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
									e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
							h_l.add(vo);
							//h_ar[i] = vo;
						}
					} else if (search_type.equals("1")) {
						if (isContain(e.getChildText("BIZPLC_NM"), search_value)) {
							HospitalVO vo = new HospitalVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),
									e.getChildText("LICENSG_DE"),e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),
									e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),
									e.getChildText("LOCPLC_ZIP_CD"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_LOTNO_ADDR"),
									e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("BIZCOND_DIV_NM_INFO"),
									e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
									e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
							h_l.add(vo);
							//h_ar[i] = vo;
						}
					}
				}
			}
			HospitalVO[] h_ar = new HospitalVO[h_l.size()];
			h_ar = h_l.toArray(h_ar);
			mv.addObject("ar", h_ar);
			mv.addObject("pageCode", "검색 결과 : " + h_ar.length + " 건");
			session.setAttribute("ar", h_ar);
			mv.addObject("length", h_ar.length);
			break;
		case 2:
			List<StoreVO> s_l = new ArrayList<StoreVO>();
			//StoreVO[] s_ar = new StoreVO[Integer.parseInt(cnt.getText())];
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
					// 0:지역 1:시설명
					if(search_type.equals("0")) {
						if (isContain(e.getChildText("SIGUN_NM"), search_value)) {
							StoreVO vo = new StoreVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),e.getChildText("LICENSG_DE"),
									e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),
									e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),
									e.getChildText("REFINE_LOTNO_ADDR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("bIZCOND_DIV_NM_INFO"),
									e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
									e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
							s_l.add(vo);
							//s_ar[i] = vo;
						}
					} else if (search_type.equals("1")) {
						if (isContain(e.getChildText("BIZPLC_NM"), search_value)) {
							StoreVO vo = new StoreVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),e.getChildText("LICENSG_DE"),
									e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),
									e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),
									e.getChildText("REFINE_LOTNO_ADDR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("bIZCOND_DIV_NM_INFO"),
									e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
									e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
							s_l.add(vo);
							//s_ar[i] = vo;
						}
					}
				}
			}
			StoreVO[] s_ar = new StoreVO[s_l.size()];
			s_ar = s_l.toArray(s_ar);
			mv.addObject("ar", s_ar);
			mv.addObject("pageCode", "검색 결과 : " + s_ar.length + " 건");
			session.setAttribute("ar", s_ar);
			mv.addObject("length", s_ar.length);
			break;
		case 3:
			List<ProtectVO> p_l = new ArrayList<ProtectVO>();
			//ProtectVO[] p_ar = new ProtectVO[Integer.parseInt(cnt.getText())];
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
					// 0:지역 1:시설명
					if(search_type.equals("0")) {
						if (isContain(e.getChildText("SIGUN_NM"), search_value)) {
							ProtectVO vo = new ProtectVO(e.getChildText("SUM_YY"),e.getChildText("SIGUN_NM"),e.getChildText("SIGUN_CD"),e.getChildText("ENTRPS_NM"),
									e.getChildText("ENTRPS_TELNO"),e.getChildText("REPRSNTV_NM"),e.getChildText("CONTRACT_PERD"),e.getChildText("ACEPTNC_ABLTY_CNT"),
									e.getChildText("CORPR_ANIMAL_HOSPTL_DTLS"),e.getChildText("RM_MATR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_LOTNO_ADDR"),
									e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"));
							p_l.add(vo);
							//p_ar[i] = vo;
						}
					} else if (search_type.equals("1")) {
						if (isContain(e.getChildText("ENTRPS_NM"), search_value)) {
							ProtectVO vo = new ProtectVO(e.getChildText("SUM_YY"),e.getChildText("SIGUN_NM"),e.getChildText("SIGUN_CD"),e.getChildText("ENTRPS_NM"),
									e.getChildText("ENTRPS_TELNO"),e.getChildText("REPRSNTV_NM"),e.getChildText("CONTRACT_PERD"),e.getChildText("ACEPTNC_ABLTY_CNT"),
									e.getChildText("CORPR_ANIMAL_HOSPTL_DTLS"),e.getChildText("RM_MATR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_LOTNO_ADDR"),
									e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"));
							p_l.add(vo);
							//p_ar[i] = vo;
						}
					}
				}
			}
			ProtectVO[] p_ar = new ProtectVO[p_l.size()];
			p_ar = p_l.toArray(p_ar);
			mv.addObject("ar", p_ar);
			mv.addObject("pageCode", "검색 결과 : " + p_ar.length + " 건");
			session.setAttribute("ar", p_ar);
			mv.addObject("length", p_ar.length);
			break;
		}
	}
	
	private boolean isContain(String str, String value) {
		boolean chk = false;

		str.replaceAll(" ", "");
		value.replaceAll(" ", "");
		
	    if(str.indexOf(value) > -1) {
	    	chk = true;
	    }	      
		return chk;
	}
	
}
