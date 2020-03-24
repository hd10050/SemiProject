package com.data.vo;

public class ReviewVO {
	
	private String r_idx, m_idx, b_idx, r_score, r_content, r_date, r_status;

	// constructor
	public ReviewVO() { }
	public ReviewVO(String r_idx, String m_idx, String b_idx, String r_score, String r_content, String r_date,
			String r_status) {
		this.r_idx = r_idx;
		this.m_idx = m_idx;
		this.b_idx = b_idx;
		this.r_score = r_score;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_status = r_status;
	}
	
	// getter setter
	public String getR_idx() { return r_idx; }
	public void setR_idx(String r_idx) { this.r_idx = r_idx; } 
	public String getM_idx() { return m_idx; }
	public void setM_idx(String m_idx) { this.m_idx = m_idx; }
	public String getB_idx() { return b_idx; }
	public void setB_idx(String b_idx) { this.b_idx = b_idx; }
	public String getR_score() { return r_score; }
	public void setR_score(String r_score) { this.r_score = r_score; }
	public String getR_content() { return r_content; }
	public void setR_content(String r_content) { this.r_content = r_content; }
	public String getR_date() { return r_date; }
	public void setR_date(String r_date) { this.r_date = r_date; }
	public String getR_status() { return r_status; }
	public void setR_status(String r_status) { this.r_status = r_status; }
	
}
