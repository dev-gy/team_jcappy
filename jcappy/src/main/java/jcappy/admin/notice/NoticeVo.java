package jcappy.admin.notice;

import java.sql.Timestamp;

import jcappy.admin.util.CommonVo;

public class NoticeVo extends CommonVo {   
	
	private int nno;
	private String ntitle;
	private String ncontent;
	private Timestamp nregdate;
	private int nreadcount;
	private String nfile_org;	// 사용자가첨부한 원본파일명
	private String nfile_real;	// 서버에 저장된 실제파일명
	private String isDel;
	private int member_mno;
	
	private int comment_count;
	private String mname;
	
	public NoticeVo() {
		setOrderby("nregdate");
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public Timestamp getNregdate() {
		return nregdate;
	}

	public void setNregdate(Timestamp nregdate) {
		this.nregdate = nregdate;
	}

	public int getNreadcount() {
		return nreadcount;
	}

	public void setNreadcount(int nreadcount) {
		this.nreadcount = nreadcount;
	}

	public String getNfile_org() {
		return nfile_org;
	}

	public void setNfile_org(String nfile_org) {
		this.nfile_org = nfile_org;
	}

	public String getNfile_real() {
		return nfile_real;
	}

	public void setNfile_real(String nfile_real) {
		this.nfile_real = nfile_real;
	}

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}

	public int getMember_mno() {
		return member_mno;
	}

	public void setMember_mno(int member_mno) {
		this.member_mno = member_mno;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	
	
}
