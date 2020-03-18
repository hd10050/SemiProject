package com.data.vo;

public class ShopVO {
	
	private String seq,				// 일련번호
				bzNm,				// 청년창업매장명칭
				stime,				// 시작시간
				etime,				// 종료시간
				stdRestCd,			// 표준휴게소코드
				regDtime,			// 최종수정일시(2016-03-09)
				regId,				// 최종수정자
				IsttmAltUser,		// 최종수정사용자
				IsttmAltrDttm,		// 최종수정일(2019-10-02)
				stdRestNm,			// 휴게소명
				svarAddr;			// 휴게소주소

	// constructor -------------------------------------------------------------------------
	public ShopVO() { }
	public ShopVO(String seq, String bzNm, String stime, String etime, String stdRestCd, String regDtime, String regId,
			String isttmAltUser, String isttmAltrDttm, String stdRestNm, String svarAddr) {
		this.seq = seq;
		this.bzNm = bzNm;
		this.stime = stime;
		this.etime = etime;
		this.stdRestCd = stdRestCd;
		this.regDtime = regDtime;
		this.regId = regId;
		IsttmAltUser = isttmAltUser;
		IsttmAltrDttm = isttmAltrDttm;
		this.stdRestNm = stdRestNm;
		this.svarAddr = svarAddr;
	}
		
	// getter setter -----------------------------------------------------------------------
	public String getSeq() { return seq; }
	public void setSeq(String seq) { this.seq = seq; }
	public String getBzNm() { return bzNm; }
	public void setBzNm(String bzNm) { this.bzNm = bzNm; }
	public String getStime() { return stime; }
	public void setStime(String stime) { this.stime = stime; }
	public String getEtime() { return etime; }
	public void setEtime(String etime) { this.etime = etime; }
	public String getStdRestCd() { return stdRestCd; }
	public void setStdRestCd(String stdRestCd) { this.stdRestCd = stdRestCd; }
	public String getRegDtime() { return regDtime; }
	public void setRegDtime(String regDtime) { this.regDtime = regDtime; }
	public String getRegId() { return regId; }
	public void setRegId(String regId) { this.regId = regId; }
	public String getIsttmAltUser() { return IsttmAltUser; }
	public void setIsttmAltUser(String isttmAltUser) { IsttmAltUser = isttmAltUser; }
	public String getIsttmAltrDttm() { return IsttmAltrDttm; }
	public void setIsttmAltrDttm(String isttmAltrDttm) { IsttmAltrDttm = isttmAltrDttm; }
	public String getStdRestNm() { return stdRestNm; }
	public void setStdRestNm(String stdRestNm) { this.stdRestNm = stdRestNm; }
	public String getSvarAddr() { return svarAddr; }
	public void setSvarAddr(String svarAddr) { this.svarAddr = svarAddr; }

}
