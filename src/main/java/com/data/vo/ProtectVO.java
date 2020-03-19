package com.data.vo;

public class ProtectVO {
	private String SUM_YY,		//	집계년도
	SIGUN_NM,					//	시군명
	SIGUN_CD,					//	시군코드
	ENTRPS_NM,					//	업체명
	ENTRPS_TELNO,				//	업체전화번호
	REPRSNTV_NM,				//	대표자명
	CONTRACT_PERD,				//	계약기간
	ACEPTNC_ABLTY_CNT,			//	수용능력수
	CORPR_ANIMAL_HOSPTL_DTLS,	//	협력동물병원내역
	RM_MATR,					//	비고사항
	REFINE_ZIP_CD,				//	소재지우편번호
	REFINE_LOTNO_ADDR,			//	소재지지번주소
	REFINE_ROADNM_ADDR,			//	소재지도로명주소
	REFINE_WGS84_LAT,			//	WGS84위도
	REFINE_WGS84_LOGT;			//	WGS84경도

	// constructor --------------------------------------------------------------------------
	public ProtectVO() {}
	public ProtectVO(String sUM_YY, String sIGUN_NM, String sIGUN_CD, String eNTRPS_NM, String eNTRPS_TELNO,
			String rEPRSNTV_NM, String cONTRACT_PERD, String aCEPTNC_ABLTY_CNT, String cORPR_ANIMAL_HOSPTL_DTLS,
			String rM_MATR, String rEFINE_ZIP_CD, String rEFINE_LOTNO_ADDR, String rEFINE_ROADNM_ADDR,
			String rEFINE_WGS84_LAT, String rEFINE_WGS84_LOGT) {
		SUM_YY = sUM_YY;
		SIGUN_NM = sIGUN_NM;
		SIGUN_CD = sIGUN_CD;
		ENTRPS_NM = eNTRPS_NM;
		ENTRPS_TELNO = eNTRPS_TELNO;
		REPRSNTV_NM = rEPRSNTV_NM;
		CONTRACT_PERD = cONTRACT_PERD;
		ACEPTNC_ABLTY_CNT = aCEPTNC_ABLTY_CNT;
		CORPR_ANIMAL_HOSPTL_DTLS = cORPR_ANIMAL_HOSPTL_DTLS;
		RM_MATR = rM_MATR;
		REFINE_ZIP_CD = rEFINE_ZIP_CD;
		REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR;
		REFINE_ROADNM_ADDR = rEFINE_ROADNM_ADDR;
		REFINE_WGS84_LAT = rEFINE_WGS84_LAT;
		REFINE_WGS84_LOGT = rEFINE_WGS84_LOGT;
	}
	
	// getter setter ------------------------------------------------------------------------
	public String getSUM_YY() {
		return SUM_YY;
	}
	public void setSUM_YY(String sUM_YY) {
		SUM_YY = sUM_YY;
	}
	public String getSIGUN_NM() {
		return SIGUN_NM;
	}
	public void setSIGUN_NM(String sIGUN_NM) {
		SIGUN_NM = sIGUN_NM;
	}
	public String getSIGUN_CD() {
		return SIGUN_CD;
	}
	public void setSIGUN_CD(String sIGUN_CD) {
		SIGUN_CD = sIGUN_CD;
	}
	public String getENTRPS_NM() {
		return ENTRPS_NM;
	}
	public void setENTRPS_NM(String eNTRPS_NM) {
		ENTRPS_NM = eNTRPS_NM;
	}
	public String getENTRPS_TELNO() {
		return ENTRPS_TELNO;
	}
	public void setENTRPS_TELNO(String eNTRPS_TELNO) {
		ENTRPS_TELNO = eNTRPS_TELNO;
	}
	public String getREPRSNTV_NM() {
		return REPRSNTV_NM;
	}
	public void setREPRSNTV_NM(String rEPRSNTV_NM) {
		REPRSNTV_NM = rEPRSNTV_NM;
	}
	public String getCONTRACT_PERD() {
		return CONTRACT_PERD;
	}
	public void setCONTRACT_PERD(String cONTRACT_PERD) {
		CONTRACT_PERD = cONTRACT_PERD;
	}
	public String getACEPTNC_ABLTY_CNT() {
		return ACEPTNC_ABLTY_CNT;
	}
	public void setACEPTNC_ABLTY_CNT(String aCEPTNC_ABLTY_CNT) {
		ACEPTNC_ABLTY_CNT = aCEPTNC_ABLTY_CNT;
	}
	public String getCORPR_ANIMAL_HOSPTL_DTLS() {
		return CORPR_ANIMAL_HOSPTL_DTLS;
	}
	public void setCORPR_ANIMAL_HOSPTL_DTLS(String cORPR_ANIMAL_HOSPTL_DTLS) {
		CORPR_ANIMAL_HOSPTL_DTLS = cORPR_ANIMAL_HOSPTL_DTLS;
	}
	public String getRM_MATR() {
		return RM_MATR;
	}
	public void setRM_MATR(String rM_MATR) {
		RM_MATR = rM_MATR;
	}
	public String getREFINE_ZIP_CD() {
		return REFINE_ZIP_CD;
	}
	public void setREFINE_ZIP_CD(String rEFINE_ZIP_CD) {
		REFINE_ZIP_CD = rEFINE_ZIP_CD;
	}
	public String getREFINE_LOTNO_ADDR() {
		return REFINE_LOTNO_ADDR;
	}
	public void setREFINE_LOTNO_ADDR(String rEFINE_LOTNO_ADDR) {
		REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR;
	}
	public String getREFINE_ROADNM_ADDR() {
		return REFINE_ROADNM_ADDR;
	}
	public void setREFINE_ROADNM_ADDR(String rEFINE_ROADNM_ADDR) {
		REFINE_ROADNM_ADDR = rEFINE_ROADNM_ADDR;
	}
	public String getREFINE_WGS84_LAT() {
		return REFINE_WGS84_LAT;
	}
	public void setREFINE_WGS84_LAT(String rEFINE_WGS84_LAT) {
		REFINE_WGS84_LAT = rEFINE_WGS84_LAT;
	}
	public String getREFINE_WGS84_LOGT() {
		return REFINE_WGS84_LOGT;
	}
	public void setREFINE_WGS84_LOGT(String rEFINE_WGS84_LOGT) {
		REFINE_WGS84_LOGT = rEFINE_WGS84_LOGT;
	}
	
}
