package jcappy.members;

import java.sql.Timestamp;

public class MembersVo {
	// InDB
	private int mno;
	private String mname;
	private String mphone;
	private String memail;
	private String mgrade;
	private String mpwd;
	private Timestamp mregdete;
	private String mzipcode;
	private String maddr;
	private String maddrde;
	
	// NonDB
	private String checkMemail;
	  
	// getter & setter
	
	public String getCheckMemail() {
		return checkMemail;
	}
	public void setCheckMemail(String checkMemail) {
		this.checkMemail = checkMemail;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public Timestamp getMregdete() {
		return mregdete;
	}
	public void setMregdete(Timestamp mregdete) {
		this.mregdete = mregdete;
	}
	public String getMzipcode() {
		return mzipcode;
	}
	public void setMzipcode(String mzipcode) {
		this.mzipcode = mzipcode;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMaddrde() {
		return maddrde;
	}
	public void setMaddrde(String maddrde) {
		this.maddrde = maddrde;
	}
	
}
