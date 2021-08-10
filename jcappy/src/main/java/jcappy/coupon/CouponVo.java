package jcappy.coupon;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class CouponVo extends CommonVo{
	private int cno;
	private String cname;
	private int cprice;
	private Timestamp cregdate;
	private int cdate;
	private int mno;
	private int c_exist; 
	private int[] cnos;
	
	private String memail;
	private String mname;
	private Timestamp cenddate;
	
	public CouponVo() {
		setOrderby("cregdate");
	}
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	public Timestamp getCregdate() {
		return cregdate;
	}
	public void setCregdate(Timestamp cregdate) {
		this.cregdate = cregdate;
	}
	public int getCdate() {
		return cdate;
	}
	public void setCdate(int cdate) {
		this.cdate = cdate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getC_exist() {
		return c_exist;
	}

	public void setC_exist(int c_exist) {
		this.c_exist = c_exist;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int[] getCnos() {
		return cnos;
	}

	public void setCnos(int[] cnos) {
		this.cnos = cnos;
	}

	public Timestamp getCenddate() {
		return cenddate;
	}

	public void setCenddate(Timestamp cenddate) {
		this.cenddate = cenddate;
	}
	
}
