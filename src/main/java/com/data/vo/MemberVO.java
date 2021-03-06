package com.data.vo;

public class MemberVO {
	
	private String m_idx, m_id, m_pw, m_name, m_gender, m_status, m_phone, r_snscode, m_level, question, answer, r_date;
	
	// constructor
	public MemberVO() { }
	public MemberVO(String m_idx, String m_id, String m_pw, String m_name, String m_gender, String m_status,
			String m_phone, String r_snscode, String m_level, String question, String answer) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_status = m_status;
		this.m_phone = m_phone;
		this.r_snscode = r_snscode;
		this.m_level = m_level;
		this.question = question;
		this.answer = answer;
	}
		
	public MemberVO(String m_idx, String m_id, String m_pw, String m_name, String m_gender, String m_status,
			String m_phone, String r_snscode, String m_level, String question, String answer, String r_date) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_status = m_status;
		this.m_phone = m_phone;
		this.r_snscode = r_snscode;
		this.m_level = m_level;
		this.question = question;
		this.answer = answer;
		this.r_date = r_date;
	}
	
	
	// getter setter
	public String getM_idx() {
		return m_idx;
	}
	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_status() {
		return m_status;
	}
	public void setM_status(String m_status) {
		this.m_status = m_status;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getR_snscode() {
		return r_snscode;
	}
	public void setR_snscode(String r_snscode) {
		this.r_snscode = r_snscode;
	}
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		this.m_level = m_level;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	
	
}
