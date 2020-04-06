package com.pro.semi;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.HospitalVO;
import com.data.vo.MemberVO;
import com.data.vo.ProtectVO;
import com.data.vo.RescueVO;
import com.data.vo.StoreVO;

import spring.util.Paging;

@Controller
public class PagingAction {
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 10;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/reviewBbs.inc")
	public ModelAndView list(String nowPage, String s_type) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String type = null;
		if(s_type == null) {
			type = "0";
		} else {
			type = s_type;
		}
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		// ---------------------------------------
		switch(Integer.parseInt(type)) {
		case 0:
			RescueVO[] r_list = getRes(this.nowPage, s_type);
			mv.addObject("ar", r_list);
			session.setAttribute("ar", r_list);
			break;
		case 1:
			HospitalVO[] h_list = getHos(this.nowPage, s_type);
			mv.addObject("ar", h_list);
			session.setAttribute("ar", h_list);
			break;
		case 2:
			StoreVO[] s_list = getSto(this.nowPage, s_type);
			mv.addObject("ar", s_list);
			session.setAttribute("ar", s_list);
			break;
		case 3:
			ProtectVO[] p_list = getPro(this.nowPage, s_type);
			mv.addObject("ar", p_list);
			session.setAttribute("ar", p_list);
			break;
		}
		
		//this.rowTotal = bbsDao.getTotalCount(bname);
		Paging page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, type);

		// 페이지 기법의 HTML코드
		pageCode = page.getSb().toString();
		
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("type", type);
		mv.setViewName("reviewBbs");
		request.setAttribute("type", type);
		request.setAttribute("chk", "0");
		// ----------
		Object obj = session.getAttribute("mvo");
		if(obj != null) {
			MemberVO mvo = (MemberVO)obj;
			System.out.println("main.inc 로그인 계정 : " + mvo.getM_idx());
		}
		// -----------
		return mv;
	}
	
	private RescueVO[] getRes(int nowPage2, String s_type) throws Exception {
		URL url = new URL("https://openapi.gg.go.kr/WldnsRescueMedicalTreatInst?KEY=3c4f29c142804973bb865407b581dd9b&pSize=" + BLOCK_LIST + "&pIndex=" + nowPage2);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 연결 객체
		
		conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
		conn.connect();
		// -------------------------------------------------------
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());	// XML문서 load

		Element root = doc.getRootElement();		// XML문서의 RootElement
		Element head = root.getChild("head");
		Element cnt = head.getChild("list_total_count");	// 글갯수
		System.out.println("글갯수:" + cnt.getText());
		List<Element> i_list = root.getChildren("row");
		// -------------------------------------------------------
		RescueVO[] ar = new RescueVO[i_list.size()];
		for(int i = 0 ; i < i_list.size() ; i++) {
			Element e = i_list.get(i);
			RescueVO vo = new RescueVO(e.getChildText("SUM_YM"), e.getChildText("SIGUN_NM"), e.getChildText("SIGUN_CD"), e.getChildText("RESCUE_INST_NM"), e.getChildText("RESCUE_INST_TELNO"),
					e.getChildText("REFINE_ZIP_CD"), e.getChildText("REFINE_LOTNO_ADDR"), e.getChildText("REFINE_ROADNM_ADDR"), e.getChildText("REFINE_WGS84_LAT"), e.getChildText("REFINE_WGS84_LOGT"));
			ar[i] = vo;
		}
		this.rowTotal = Integer.parseInt(cnt.getText());
		return ar;
	}
	
	private HospitalVO[] getHos(int nowPage2, String s_type) throws Exception {
		URL url = new URL("https://openapi.gg.go.kr/Animalhosptl?KEY=3c4f29c142804973bb865407b581dd9b&pSize=" + BLOCK_LIST + "&pIndex=" + nowPage2);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 연결 객체
		
		conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
		conn.connect();
		// -------------------------------------------------------
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());	// XML문서 load

		Element root = doc.getRootElement();		// XML문서의 RootElement
		Element head = root.getChild("head");
		Element cnt = head.getChild("list_total_count");	// 글갯수
		System.out.println("글갯수:" + cnt.getText());
		List<Element> i_list = root.getChildren("row");
		// -------------------------------------------------------
		HospitalVO[] ar = new HospitalVO[i_list.size()];
		for(int i = 0 ; i < i_list.size() ; i++) {
			Element e = i_list.get(i);
			HospitalVO vo = new HospitalVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),
					e.getChildText("LICENSG_DE"),e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),
					e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),
					e.getChildText("LOCPLC_ZIP_CD"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_LOTNO_ADDR"),
					e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("BIZCOND_DIV_NM_INFO"),
					e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
					e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
			ar[i] = vo;
		}
		this.rowTotal = Integer.parseInt(cnt.getText());
		return ar;
	}

	private StoreVO[] getSto(int nowPage2, String s_type) throws Exception {
		URL url = new URL("https://openapi.gg.go.kr/AnimalPharmacy?KEY=3c4f29c142804973bb865407b581dd9b&pSize=" + BLOCK_LIST + "&pIndex=" + nowPage2);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 연결 객체
		
		conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
		conn.connect();
		// -------------------------------------------------------
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());	// XML문서 load

		Element root = doc.getRootElement();		// XML문서의 RootElement
		Element head = root.getChild("head");
		Element cnt = head.getChild("list_total_count");	// 글갯수
		System.out.println("글갯수:" + cnt.getText());
		List<Element> i_list = root.getChildren("row");
		// -------------------------------------------------------
		StoreVO[] ar = new StoreVO[i_list.size()];
		for(int i = 0 ; i < i_list.size() ; i++) {
			Element e = i_list.get(i);
			StoreVO vo = new StoreVO(e.getChildText("SIGUN_CD"),e.getChildText("SIGUN_NM"),e.getChildText("BIZPLC_NM"),e.getChildText("LICENSG_DE"),
					e.getChildText("LICENSG_CANCL_DE"),e.getChildText("BSN_STATE_DIV_CD"),e.getChildText("BSN_STATE_NM"),e.getChildText("CLSBIZ_DE"),
					e.getChildText("LOCPLC_FACLT_TELNO"),e.getChildText("LOCPLC_AR_INFO"),e.getChildText("ROADNM_ZIP_CD"),e.getChildText("REFINE_ROADNM_ADDR"),
					e.getChildText("REFINE_LOTNO_ADDR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"),e.getChildText("bIZCOND_DIV_NM_INFO"),
					e.getChildText("X_CRDNT_VL"),e.getChildText("Y_CRDNT_VL"),e.getChildText("STOCKRS_DUTY_DIV_NM"),e.getChildText("SFRMPROD_PROCSBIZ_DIV_NM"),
					e.getChildText("STOCKRS_IDNTFY_NO"),e.getChildText("RIGHT_MAINBD_IDNTFY_NO"),e.getChildText("TOT_EMPLY_CNT"));
			ar[i] = vo;
		}
		this.rowTotal = Integer.parseInt(cnt.getText());
		return ar;
	}
	
	private ProtectVO[] getPro(int nowPage2, String s_type) throws Exception {
		URL url = new URL("https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?KEY=3c4f29c142804973bb865407b581dd9b&pSize=" + BLOCK_LIST + "&pIndex=" + nowPage2);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 연결 객체
		
		conn.setRequestProperty("Content-Type", "application/xml");	// conn으로 부터 결과를 받는 contentType 설정
		conn.connect();
		// -------------------------------------------------------
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(conn.getInputStream());	// XML문서 load

		Element root = doc.getRootElement();		// XML문서의 RootElement
		Element head = root.getChild("head");
		Element cnt = head.getChild("list_total_count");	// 글갯수
		System.out.println("글갯수:" + cnt.getText());
		List<Element> i_list = root.getChildren("row");
		// -------------------------------------------------------
		ProtectVO[] ar = new ProtectVO[i_list.size()];
		for(int i = 0 ; i < i_list.size() ; i++) {
			Element e = i_list.get(i);
			ProtectVO vo = new ProtectVO(e.getChildText("SUM_YY"),e.getChildText("SIGUN_NM"),e.getChildText("SIGUN_CD"),e.getChildText("ENTRPS_NM"),
					e.getChildText("ENTRPS_TELNO"),e.getChildText("REPRSNTV_NM"),e.getChildText("CONTRACT_PERD"),e.getChildText("ACEPTNC_ABLTY_CNT"),
					e.getChildText("CORPR_ANIMAL_HOSPTL_DTLS"),e.getChildText("RM_MATR"),e.getChildText("REFINE_ZIP_CD"),e.getChildText("REFINE_LOTNO_ADDR"),
					e.getChildText("REFINE_ROADNM_ADDR"),e.getChildText("REFINE_WGS84_LAT"),e.getChildText("REFINE_WGS84_LOGT"));
			ar[i] = vo;
		}
		this.rowTotal = Integer.parseInt(cnt.getText());
		return ar;
	}


}