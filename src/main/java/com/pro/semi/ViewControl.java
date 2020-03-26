package com.pro.semi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.HospitalVO;
import com.data.vo.ProtectVO;
import com.data.vo.RescueVO;
import com.data.vo.ReviewVO;
import com.data.vo.StoreVO;

import mybatis.dao.ReviewDAO;

@Controller
public class ViewControl {

	@Autowired
	private HttpSession session;
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private HttpServletRequest Request;

	ReviewVO[] review_ar = null;
	RescueVO rvo = new RescueVO() ; //야생동물 구조치료기관
	HospitalVO hvo = new HospitalVO(); //동물병원
	StoreVO svo = new StoreVO(); //동물약국
	ProtectVO pvo = new ProtectVO(); //유기 동물 보호시설

	@RequestMapping("/view.inc")
	public ModelAndView view() throws Exception{

		//타입
		String type = Request.getParameter("type");

		ModelAndView mv = new ModelAndView();

		switch(Integer.parseInt(type)){
		case 0: 
			//야생동물 구조치료기관
			RescueVO[] r_ar = (RescueVO[]) session.getAttribute("ar");
			//System.out.println(r_ar.length);

			for(RescueVO r : r_ar) {
				String RESCUE_INST_TELNO = Request.getParameter("RESCUE_INST_TELNO");
				// System.out.println("RESCUE_INST_TELNO="+RESCUE_INST_TELNO);

				String RESCUE_INST_TELNO2 = r.getRESCUE_INST_TELNO();
				//System.out.println("RESCUE_INST_TELNO2="+RESCUE_INST_TELNO2);

				if(RESCUE_INST_TELNO.equals(RESCUE_INST_TELNO2)) {

					rvo.setSUM_YM(r.getSUM_YM());
					//System.out.println(r.getSIGUN_NM());

					rvo.setSIGUN_NM(r.getSIGUN_NM());
					rvo.setSIGUN_CD(r.getSIGUN_CD());
					rvo.setRESCUE_INST_NM(r.getRESCUE_INST_NM());
					rvo.setRESCUE_INST_TELNO(r.getRESCUE_INST_TELNO());
					rvo.setREFINE_ZIP_CD(r.getREFINE_ZIP_CD());
					rvo.setREFINE_LOTNO_ADDR(r.getREFINE_LOTNO_ADDR());
					rvo.setREFINE_ROADNM_ADDR(r.getREFINE_ROADNM_ADDR());
					rvo.setREFINE_WGS84_LAT(r.getREFINE_WGS84_LAT());
					rvo.setREFINE_WGS84_LOGT(r.getREFINE_WGS84_LOGT());
				}
			}
			review_ar = reviewDao.listReview(rvo.getRESCUE_INST_TELNO());
			mv.addObject("b_idx", rvo.getRESCUE_INST_TELNO());
			break;
		case 1:

			//동물병원
			HospitalVO[] h_ar = (HospitalVO[])session.getAttribute("ar");

			for(HospitalVO h : h_ar) {
				String LOCPLC_FACLT_TELNO = Request.getParameter("LOCPLC_FACLT_TELNO");
				String LOCPLC_FACLT_TELNO2 = h.getLOCPLC_FACLT_TELNO();

				if(LOCPLC_FACLT_TELNO.equals(LOCPLC_FACLT_TELNO2)) {

					hvo.setSIGUN_CD(h.getSIGUN_CD());
					hvo.setSIGUN_NM(h.getSIGUN_NM());
					hvo.setBIZPLC_NM(h.getBIZPLC_NM());
					hvo.setLICENSG_DE(h.getLICENSG_DE());
					hvo.setLICENSG_CANCL_DE(h.getLICENSG_CANCL_DE());
					hvo.setBSN_STATE_DIV_CD(h.getBSN_STATE_DIV_CD());
					hvo.setBSN_STATE_NM(h.getBSN_STATE_NM());
					hvo.setCLSBIZ_DE(h.getCLSBIZ_DE());
					hvo.setLOCPLC_FACLT_TELNO(h.getLOCPLC_FACLT_TELNO()); //   소재지시설전화번호
					hvo.setLOCPLC_AR_INFO(h.getLOCPLC_AR_INFO());            //   소재지면적정보
					hvo.setLOCPLC_ZIP_CD(h.getLOCPLC_ZIP_CD());            //   소재지우편번호
					hvo.setROADNM_ZIP_CD(h.getROADNM_ZIP_CD());  //   도로명우편번호
					hvo.setREFINE_ROADNM_ADDR(h.getREFINE_ROADNM_ADDR()); //   소재지도로명주소
					hvo.setREFINE_LOTNO_ADDR(h.getREFINE_LOTNO_ADDR()); //   소재지지번주소
					hvo.setREFINE_ZIP_CD(h.getREFINE_ZIP_CD()); //   소재지우편번호
					hvo.setREFINE_WGS84_LAT(h.getREFINE_WGS84_LAT()); //   WGS84위도
					hvo.setREFINE_WGS84_LOGT(h.getREFINE_WGS84_LOGT()); //   WGS84경도
					hvo.setBIZCOND_DIV_NM_INFO(h.getBIZCOND_DIV_NM_INFO()); //   업태구분명정보
					hvo.setX_CRDNT_VL(h.getX_CRDNT_VL());  //   X좌표값
					hvo.setY_CRDNT_VL(h.getY_CRDNT_VL());  //   Y좌표값
					hvo.setSTOCKRS_DUTY_DIV_NM(h.getSTOCKRS_DUTY_DIV_NM()); //   축산업무구분명
					hvo.setSFRMPROD_PROCSBIZ_DIV_NM(h.getSFRMPROD_PROCSBIZ_DIV_NM()); //   축산물가공업구분명
					hvo.setSTOCKRS_IDNTFY_NO(h.getSTOCKRS_IDNTFY_NO()); //   축산고유번호
					hvo.setRIGHT_MAINBD_IDNTFY_NO(h.getRIGHT_MAINBD_IDNTFY_NO());  //   권리주체일련번호
					hvo.setTOT_EMPLY_CNT(h.getTOT_EMPLY_CNT());  //   총종업원수

				}
			}
			review_ar = reviewDao.listReview(hvo.getLOCPLC_FACLT_TELNO());
			mv.addObject("b_idx", hvo.getLOCPLC_FACLT_TELNO());
			break;

		case 2 :
			//동물약국
			StoreVO[] s_ar = (StoreVO[])session.getAttribute("ar");

			for(StoreVO s : s_ar) {
				String LOCPLC_FACLT_TELNO = Request.getParameter("LOCPLC_FACLT_TELNO");
				String LOCPLC_FACLT_TELNO2 = s.getLOCPLC_FACLT_TELNO();

				if(LOCPLC_FACLT_TELNO.equals(LOCPLC_FACLT_TELNO2)) {

					svo.setSIGUN_CD(s.getSIGUN_CD()); 	//	시군코드
					svo.setSIGUN_NM(s.getSIGUN_NM()); //	시군명
					svo.setBIZPLC_NM(s.getBIZPLC_NM());	//	사업장명
					svo.setLICENSG_DE(s.getLICENSG_DE()); //	인허가일자
					svo.setLICENSG_CANCL_DE(s.getLICENSG_CANCL_DE());	//	인허가취소일자
					svo.setBSN_STATE_DIV_CD(s.getBSN_STATE_DIV_CD()); //	영업상태구분코드
					svo.setBSN_STATE_NM(s.getBSN_STATE_NM());	//	영업상태명
					svo.setCLSBIZ_DE(s.getCLSBIZ_DE());	//	폐업일자
					svo.setLOCPLC_FACLT_TELNO(s.getLOCPLC_FACLT_TELNO()); //	소재지시설전화번호
					svo.setLOCPLC_AR_INFO(s.getLOCPLC_AR_INFO());	//	소재지면적정보
					svo.setROADNM_ZIP_CD(s.getROADNM_ZIP_CD());	//	도로명우편번호
					svo.setREFINE_ROADNM_ADDR(s.getREFINE_ROADNM_ADDR()); //	소재지도로명주소
					svo.setREFINE_LOTNO_ADDR(s.getREFINE_LOTNO_ADDR()); 	//	소재지지번주소
					svo.setREFINE_ZIP_CD(s.getREFINE_ZIP_CD());	//	소재지우편번호
					svo.setREFINE_WGS84_LAT(s.getREFINE_WGS84_LAT());	//	WGS84위도
					svo.setREFINE_WGS84_LOGT(s.getREFINE_WGS84_LOGT());	//	WGS84경도
					svo.setBIZCOND_DIV_NM_INFO(s.getBIZCOND_DIV_NM_INFO()); //	업태구분명정보
					svo.setX_CRDNT_VL(s.getX_CRDNT_VL());	//	X좌표값
					svo.setY_CRDNT_VL(s.getY_CRDNT_VL());	//	Y좌표값
					svo.setSTOCKRS_DUTY_DIV_NM(s.getSTOCKRS_DUTY_DIV_NM()); //	축산업무구분명
					svo.setSFRMPROD_PROCSBIZ_DIV_NM(s.getSFRMPROD_PROCSBIZ_DIV_NM()); //	축산물가공업구분명
					svo.setSTOCKRS_IDNTFY_NO(s.getSTOCKRS_IDNTFY_NO()); 	//	축산고유번호
					svo.setRIGHT_MAINBD_IDNTFY_NO(s.getRIGHT_MAINBD_IDNTFY_NO()); //	권리주체일련번호
					svo.setTOT_EMPLY_CNT(s.getTOT_EMPLY_CNT()); //	총종업원수

				}
			}
			review_ar = reviewDao.listReview(svo.getLOCPLC_FACLT_TELNO());
			mv.addObject("b_idx", svo.getLOCPLC_FACLT_TELNO());
			break;

		default :
			//유기 동물 보호시설
			ProtectVO[] p_ar = (ProtectVO[])session.getAttribute("ar");

			for(ProtectVO p : p_ar) {
				String ENTRPS_TELNO = Request.getParameter("ENTRPS_TELNO");
				String ENTRPS_TELNO2 = p.getENTRPS_TELNO();

				if(ENTRPS_TELNO.equals(ENTRPS_TELNO2)) {

					pvo.setSUM_YY(p.getSUM_YY());	//	집계년도
					pvo.setSIGUN_NM(p.getSIGUN_NM()); //	시군명
					pvo.setSIGUN_CD(p.getSIGUN_CD()); //	시군코드
					pvo.setENTRPS_NM(p.getENTRPS_NM()); //	업체명
					pvo.setENTRPS_TELNO(p.getENTRPS_TELNO());	//	업체전화번호
					pvo.setREPRSNTV_NM(p.getREPRSNTV_NM());	//	대표자명
					pvo.setCONTRACT_PERD(p.getCONTRACT_PERD());	//	계약기간
					pvo.setACEPTNC_ABLTY_CNT(p.getACEPTNC_ABLTY_CNT()); //수용능력수
					pvo.setCORPR_ANIMAL_HOSPTL_DTLS(p.getCORPR_ANIMAL_HOSPTL_DTLS());	//	협력동물병원내역
					pvo.setRM_MATR(p.getRM_MATR()); //	비고사항
					pvo.setREFINE_ZIP_CD(p.getREFINE_ZIP_CD());	//	소재지우편번호
					pvo.setREFINE_LOTNO_ADDR(p.getREFINE_LOTNO_ADDR()); //	소재지지번주소
					pvo.setREFINE_ROADNM_ADDR(p.getREFINE_ROADNM_ADDR()); //	소재지도로명주소
					pvo.setREFINE_WGS84_LAT(p.getREFINE_WGS84_LAT());	//	WGS84위도
					pvo.setREFINE_WGS84_LOGT(p.getREFINE_WGS84_LOGT()); 	//	WGS84경도

				}
			}
			mv.addObject("b_idx", pvo.getENTRPS_TELNO());
			review_ar = reviewDao.listReview(pvo.getENTRPS_TELNO());
		}


		mv.addObject("type", type);
		mv.addObject("rvo", rvo);
		mv.addObject("hvo", hvo);
		mv.addObject("svo", svo);
		mv.addObject("pvo", pvo);
		mv.addObject("review_ar", review_ar);

		mv.setViewName("view");
		if(review_ar != null) {
			System.out.println("댓글 수 : " + review_ar.length);
		}
		return mv;

	}
}

