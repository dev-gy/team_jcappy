package jcappy.review;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class ReviewVo extends CommonVo {   
	
	private int rno;
	private int rstar;
	private String rtitle;
	private String rcontent;
	private Timestamp rregdate;
	private String rfile_org;	// 사용자가첨부한 원본파일명
	private String rfile_real;	// 서버에 저장된 실제파일명
	private int pno;
	private int ono;
	private int mno;
	private String isDel;
	private int rreadcount;
	
	private String mname;
	private String memail;
	private String mphone;
	private int comment_count;
	private String pname;
	private String pimg1_org;
	private String pimg2_org;
	private String pimg3_org;


	public ReviewVo() {
		setOrderby("rregdate");
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getRstar() {
		return rstar;
	}

	public void setRstar(int rstar) {
		this.rstar = rstar;
	}

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Timestamp getRregdate() {
		return rregdate;
	}

	public void setRregdate(Timestamp rregdate) {
		this.rregdate = rregdate;
	}

	public String getRfile_org() {
		return rfile_org;
	}

	public void setRfile_org(String rfile_org) {
		this.rfile_org = rfile_org;
	}

	public String getRfile_real() {
		return rfile_real;
	}

	public void setRfile_real(String rfile_real) {
		this.rfile_real = rfile_real;
	}

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getRreadcount() {
		return rreadcount;
	}

	public void setRreadcount(int rreadcount) {
		this.rreadcount = rreadcount;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
	
	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getPimg1_org() {
		return pimg1_org;
	}

	public void setPimg1_org(String pimg1_org) {
		this.pimg1_org = pimg1_org;
	}

	public String getPimg2_org() {
		return pimg2_org;
	}

	public void setPimg2_org(String pimg2_org) {
		this.pimg2_org = pimg2_org;
	}

	public String getPimg3_org() {
		return pimg3_org;
	}

	public void setPimg3_org(String pimg3_org) {
		this.pimg3_org = pimg3_org;
	}
	
	
}
