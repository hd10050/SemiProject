package com.data.vo;

public class RestVO {

	private String stdRestCd,	// 표준 주유소코드
				psCode,			// 편의시설 코드
				psName,			// 편의시설 명칭
				psDesc,			// 상세내용
				stime,			// 시작시간
				etime,			// 종료시간
				redId,			// 최종수정자
				redDtime,		// 최종수정일(16/03/10)
				IsttmAltrUser,	// 최종수정사용자
				IsttmAltrDttm,	// 최종수정일(2019-10-02)
				svarAddr;		// 휴게소주소
	
	// constructor -------------------------------------------------------------------------
	public RestVO() { }
	public RestVO(String stdRestCd, String psCode, String psName, String psDesc, String stime, String etime,
			String redId, String redDtime, String isttmAltrUser, String isttmAltrDttm, String svarAddr) {
		this.stdRestCd = stdRestCd;
		this.psCode = psCode;
		this.psName = psName;
		this.psDesc = psDesc;
		this.stime = stime;
		this.etime = etime;
		this.redId = redId;
		this.redDtime = redDtime;
		IsttmAltrUser = isttmAltrUser;
		IsttmAltrDttm = isttmAltrDttm;
		this.svarAddr = svarAddr;
	}
	
	// getter setter -----------------------------------------------------------------------
	public String getStdRestCd() { return stdRestCd; }
	public void setStdRestCd(String stdRestCd) { this.stdRestCd = stdRestCd; }
	public String getPsCode() { return psCode; }
	public void setPsCode(String psCode) { this.psCode = psCode; }
	public String getPsName() { return psName; }
	public void setPsName(String psName) { this.psName = psName; }
	public String getPsDesc() { return psDesc; }
	public void setPsDesc(String psDesc) { this.psDesc = psDesc; }
	public String getStime() { return stime; }
	public void setStime(String stime) { this.stime = stime; }
	public String getEtime() { return etime; }
	public void setEtime(String etime) { this.etime = etime; }
	public String getRedId() { return redId; }
	public void setRedId(String redId) { this.redId = redId; }
	public String getRedDtime() { return redDtime; }
	public void setRedDtime(String redDtime) { this.redDtime = redDtime; }
	public String getIsttmAltrUser() { return IsttmAltrUser; }
	public void setIsttmAltrUser(String isttmAltrUser) { IsttmAltrUser = isttmAltrUser; }
	public String getIsttmAltrDttm() { return IsttmAltrDttm; }
	public void setIsttmAltrDttm(String isttmAltrDttm) { IsttmAltrDttm = isttmAltrDttm; }
	public String getSvarAddr() { return svarAddr; }
	public void setSvarAddr(String svarAddr) { this.svarAddr = svarAddr; }
				
}
