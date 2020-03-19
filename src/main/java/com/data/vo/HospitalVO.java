package com.data.vo;

public class HospitalVO {
	private String SIGUN_CD,				//	시군코드
				SIGUN_NM,					//	시군명
				BIZPLC_NM,					//	사업장명
				LICENSG_DE,					//	인허가일자
				LICENSG_CANCL_DE,			//	인허가취소일자
				BSN_STATE_DIV_CD,			//	영업상태구분코드
				BSN_STATE_NM,				//	영업상태명
				CLSBIZ_DE,					//	폐업일자
				LOCPLC_FACLT_TELNO,			//	소재지시설전화번호
				LOCPLC_AR_INFO,				//	소재지면적정보
				LOCPLC_ZIP_CD,				//	소재지우편번호
				ROADNM_ZIP_CD,				//	도로명우편번호
				REFINE_ROADNM_ADDR,			//	소재지도로명주소
				REFINE_LOTNO_ADDR,			//	소재지지번주소
				REFINE_ZIP_CD,				//	소재지우편번호
				REFINE_WGS84_LAT,			//	WGS84위도
				REFINE_WGS84_LOGT,			//	WGS84경도
				BIZCOND_DIV_NM_INFO,		//	업태구분명정보
				X_CRDNT_VL,					//	X좌표값
				Y_CRDNT_VL,					//	Y좌표값
				STOCKRS_DUTY_DIV_NM,		//	축산업무구분명
				SFRMPROD_PROCSBIZ_DIV_NM,	//	축산물가공업구분명
				STOCKRS_IDNTFY_NO,			//	축산고유번호
				RIGHT_MAINBD_IDNTFY_NO,		//	권리주체일련번호
				TOT_EMPLY_CNT;				//	총종업원수

	// constructor --------------------------------------------------------------------------
	public HospitalVO() {}
	public HospitalVO(String sIGUN_CD, String sIGUN_NM, String bIZPLC_NM, String lICENSG_DE, String lICENSG_CANCL_DE,
			String bSN_STATE_DIV_CD, String bSN_STATE_NM, String cLSBIZ_DE, String lOCPLC_FACLT_TELNO,
			String lOCPLC_AR_INFO, String lOCPLC_ZIP_CD, String rOADNM_ZIP_CD, String rEFINE_ROADNM_ADDR,
			String rEFINE_LOTNO_ADDR, String rEFINE_ZIP_CD, String rEFINE_WGS84_LAT, String rEFINE_WGS84_LOGT,
			String bIZCOND_DIV_NM_INFO, String x_CRDNT_VL, String y_CRDNT_VL, String sTOCKRS_DUTY_DIV_NM,
			String sFRMPROD_PROCSBIZ_DIV_NM, String sTOCKRS_IDNTFY_NO, String rIGHT_MAINBD_IDNTFY_NO,
			String tOT_EMPLY_CNT) {
		SIGUN_CD = sIGUN_CD;
		SIGUN_NM = sIGUN_NM;
		BIZPLC_NM = bIZPLC_NM;
		LICENSG_DE = lICENSG_DE;
		LICENSG_CANCL_DE = lICENSG_CANCL_DE;
		BSN_STATE_DIV_CD = bSN_STATE_DIV_CD;
		BSN_STATE_NM = bSN_STATE_NM;
		CLSBIZ_DE = cLSBIZ_DE;
		LOCPLC_FACLT_TELNO = lOCPLC_FACLT_TELNO;
		LOCPLC_AR_INFO = lOCPLC_AR_INFO;
		LOCPLC_ZIP_CD = lOCPLC_ZIP_CD;
		ROADNM_ZIP_CD = rOADNM_ZIP_CD;
		REFINE_ROADNM_ADDR = rEFINE_ROADNM_ADDR;
		REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR;
		REFINE_ZIP_CD = rEFINE_ZIP_CD;
		REFINE_WGS84_LAT = rEFINE_WGS84_LAT;
		REFINE_WGS84_LOGT = rEFINE_WGS84_LOGT;
		BIZCOND_DIV_NM_INFO = bIZCOND_DIV_NM_INFO;
		X_CRDNT_VL = x_CRDNT_VL;
		Y_CRDNT_VL = y_CRDNT_VL;
		STOCKRS_DUTY_DIV_NM = sTOCKRS_DUTY_DIV_NM;
		SFRMPROD_PROCSBIZ_DIV_NM = sFRMPROD_PROCSBIZ_DIV_NM;
		STOCKRS_IDNTFY_NO = sTOCKRS_IDNTFY_NO;
		RIGHT_MAINBD_IDNTFY_NO = rIGHT_MAINBD_IDNTFY_NO;
		TOT_EMPLY_CNT = tOT_EMPLY_CNT;
	}
	
	// getter setter ------------------------------------------------------------------------
	public String getSIGUN_CD() {
		return SIGUN_CD;
	}
	public void setSIGUN_CD(String sIGUN_CD) {
		SIGUN_CD = sIGUN_CD;
	}
	public String getSIGUN_NM() {
		return SIGUN_NM;
	}
	public void setSIGUN_NM(String sIGUN_NM) {
		SIGUN_NM = sIGUN_NM;
	}
	public String getBIZPLC_NM() {
		return BIZPLC_NM;
	}
	public void setBIZPLC_NM(String bIZPLC_NM) {
		BIZPLC_NM = bIZPLC_NM;
	}
	public String getLICENSG_DE() {
		return LICENSG_DE;
	}
	public void setLICENSG_DE(String lICENSG_DE) {
		LICENSG_DE = lICENSG_DE;
	}
	public String getLICENSG_CANCL_DE() {
		return LICENSG_CANCL_DE;
	}
	public void setLICENSG_CANCL_DE(String lICENSG_CANCL_DE) {
		LICENSG_CANCL_DE = lICENSG_CANCL_DE;
	}
	public String getBSN_STATE_DIV_CD() {
		return BSN_STATE_DIV_CD;
	}
	public void setBSN_STATE_DIV_CD(String bSN_STATE_DIV_CD) {
		BSN_STATE_DIV_CD = bSN_STATE_DIV_CD;
	}
	public String getBSN_STATE_NM() {
		return BSN_STATE_NM;
	}
	public void setBSN_STATE_NM(String bSN_STATE_NM) {
		BSN_STATE_NM = bSN_STATE_NM;
	}
	public String getCLSBIZ_DE() {
		return CLSBIZ_DE;
	}
	public void setCLSBIZ_DE(String cLSBIZ_DE) {
		CLSBIZ_DE = cLSBIZ_DE;
	}
	public String getLOCPLC_FACLT_TELNO() {
		return LOCPLC_FACLT_TELNO;
	}
	public void setLOCPLC_FACLT_TELNO(String lOCPLC_FACLT_TELNO) {
		LOCPLC_FACLT_TELNO = lOCPLC_FACLT_TELNO;
	}
	public String getLOCPLC_AR_INFO() {
		return LOCPLC_AR_INFO;
	}
	public void setLOCPLC_AR_INFO(String lOCPLC_AR_INFO) {
		LOCPLC_AR_INFO = lOCPLC_AR_INFO;
	}
	public String getLOCPLC_ZIP_CD() {
		return LOCPLC_ZIP_CD;
	}
	public void setLOCPLC_ZIP_CD(String lOCPLC_ZIP_CD) {
		LOCPLC_ZIP_CD = lOCPLC_ZIP_CD;
	}
	public String getROADNM_ZIP_CD() {
		return ROADNM_ZIP_CD;
	}
	public void setROADNM_ZIP_CD(String rOADNM_ZIP_CD) {
		ROADNM_ZIP_CD = rOADNM_ZIP_CD;
	}
	public String getREFINE_ROADNM_ADDR() {
		return REFINE_ROADNM_ADDR;
	}
	public void setREFINE_ROADNM_ADDR(String rEFINE_ROADNM_ADDR) {
		REFINE_ROADNM_ADDR = rEFINE_ROADNM_ADDR;
	}
	public String getREFINE_LOTNO_ADDR() {
		return REFINE_LOTNO_ADDR;
	}
	public void setREFINE_LOTNO_ADDR(String rEFINE_LOTNO_ADDR) {
		REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR;
	}
	public String getREFINE_ZIP_CD() {
		return REFINE_ZIP_CD;
	}
	public void setREFINE_ZIP_CD(String rEFINE_ZIP_CD) {
		REFINE_ZIP_CD = rEFINE_ZIP_CD;
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
	public String getBIZCOND_DIV_NM_INFO() {
		return BIZCOND_DIV_NM_INFO;
	}
	public void setBIZCOND_DIV_NM_INFO(String bIZCOND_DIV_NM_INFO) {
		BIZCOND_DIV_NM_INFO = bIZCOND_DIV_NM_INFO;
	}
	public String getX_CRDNT_VL() {
		return X_CRDNT_VL;
	}
	public void setX_CRDNT_VL(String x_CRDNT_VL) {
		X_CRDNT_VL = x_CRDNT_VL;
	}
	public String getY_CRDNT_VL() {
		return Y_CRDNT_VL;
	}
	public void setY_CRDNT_VL(String y_CRDNT_VL) {
		Y_CRDNT_VL = y_CRDNT_VL;
	}
	public String getSTOCKRS_DUTY_DIV_NM() {
		return STOCKRS_DUTY_DIV_NM;
	}
	public void setSTOCKRS_DUTY_DIV_NM(String sTOCKRS_DUTY_DIV_NM) {
		STOCKRS_DUTY_DIV_NM = sTOCKRS_DUTY_DIV_NM;
	}
	public String getSFRMPROD_PROCSBIZ_DIV_NM() {
		return SFRMPROD_PROCSBIZ_DIV_NM;
	}
	public void setSFRMPROD_PROCSBIZ_DIV_NM(String sFRMPROD_PROCSBIZ_DIV_NM) {
		SFRMPROD_PROCSBIZ_DIV_NM = sFRMPROD_PROCSBIZ_DIV_NM;
	}
	public String getSTOCKRS_IDNTFY_NO() {
		return STOCKRS_IDNTFY_NO;
	}
	public void setSTOCKRS_IDNTFY_NO(String sTOCKRS_IDNTFY_NO) {
		STOCKRS_IDNTFY_NO = sTOCKRS_IDNTFY_NO;
	}
	public String getRIGHT_MAINBD_IDNTFY_NO() {
		return RIGHT_MAINBD_IDNTFY_NO;
	}
	public void setRIGHT_MAINBD_IDNTFY_NO(String rIGHT_MAINBD_IDNTFY_NO) {
		RIGHT_MAINBD_IDNTFY_NO = rIGHT_MAINBD_IDNTFY_NO;
	}
	public String getTOT_EMPLY_CNT() {
		return TOT_EMPLY_CNT;
	}
	public void setTOT_EMPLY_CNT(String tOT_EMPLY_CNT) {
		TOT_EMPLY_CNT = tOT_EMPLY_CNT;
	}
	
}
