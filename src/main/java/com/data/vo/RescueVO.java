package com.data.vo;

public class RescueVO {
	private String SUM_YM,		// 집계년월
				SIGUN_NM,			// 	시군명
				SIGUN_CD,			// 	시군코드
				RESCUE_INST_NM,		// 	구조기관명
				RESCUE_INST_TELNO,	// 	구조기관전화번호
				REFINE_ZIP_CD,	// 소재지우편번호
				REFINE_LOTNO_ADDR,	// 	소재지지번주소
				REFINE_ROADNM_ADDR,	// 	소재지도로명주소
				REFINE_WGS84_LAT,	// WGS84위도
				REFINE_WGS84_LOGT;	//	WGS84경도
	
	// constructor --------------------------------------------------------------------------
	public RescueVO() { }
	public RescueVO(String sUM_YM, String sIGUN_NM, String sIGUN_CD, String rESCUE_INST_NM, String rESCUE_INST_TELNO,
			String rEFINE_ZIP_CD, String rEFINE_LOTNO_ADDR, String rEFINE_ROADNM_ADDR, String rEFINE_WGS84_LAT,
			String rEFINE_WGS84_LOGT) {
		SUM_YM = sUM_YM;
		SIGUN_NM = sIGUN_NM;
		SIGUN_CD = sIGUN_CD;
		RESCUE_INST_NM = rESCUE_INST_NM;
		RESCUE_INST_TELNO = rESCUE_INST_TELNO;
		REFINE_ZIP_CD = rEFINE_ZIP_CD;
		REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR;
		REFINE_ROADNM_ADDR = rEFINE_ROADNM_ADDR;
		REFINE_WGS84_LAT = rEFINE_WGS84_LAT;
		REFINE_WGS84_LOGT = rEFINE_WGS84_LOGT;
	}
	
	// getter setter ------------------------------------------------------------------------
	public String getSUM_YM() { return SUM_YM; }
	public void setSUM_YM(String sUM_YM) { SUM_YM = sUM_YM; }
	public String getSIGUN_NM() { return SIGUN_NM; }
	public void setSIGUN_NM(String sIGUN_NM) { SIGUN_NM = sIGUN_NM; }
	public String getSIGUN_CD() { return SIGUN_CD; }
	public void setSIGUN_CD(String sIGUN_CD) { SIGUN_CD = sIGUN_CD; }
	public String getRESCUE_INST_NM() { return RESCUE_INST_NM; }
	public void setRESCUE_INST_NM(String rESCUE_INST_NM) { RESCUE_INST_NM = rESCUE_INST_NM; }
	public String getRESCUE_INST_TELNO() { return RESCUE_INST_TELNO; }
	public void setRESCUE_INST_TELNO(String rESCUE_INST_TELNO) { RESCUE_INST_TELNO = rESCUE_INST_TELNO; }
	public String getREFINE_ZIP_CD() { return REFINE_ZIP_CD; }
	public void setREFINE_ZIP_CD(String rEFINE_ZIP_CD) {REFINE_ZIP_CD = rEFINE_ZIP_CD;  }
	public String getREFINE_LOTNO_ADDR() { return REFINE_LOTNO_ADDR; }
	public void setREFINE_LOTNO_ADDR(String rEFINE_LOTNO_ADDR) { REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR; }
	public String getREFINE_ROADNM_ADDR() {return REFINE_ROADNM_ADDR;  }
	public void setREFINE_ROADNM_ADDR(String rEFINE_ROADNM_ADDR) { REFINE_ROADNM_ADDR = rEFINE_ROADNM_ADDR; }
	public String getREFINE_WGS84_LAT() { return REFINE_WGS84_LAT; }
	public void setREFINE_WGS84_LAT(String rEFINE_WGS84_LAT) { REFINE_WGS84_LAT = rEFINE_WGS84_LAT; }
	public String getREFINE_WGS84_LOGT() { return REFINE_WGS84_LOGT; }
	public void setREFINE_WGS84_LOGT(String rEFINE_WGS84_LOGT) { REFINE_WGS84_LOGT = rEFINE_WGS84_LOGT; }
	
}
