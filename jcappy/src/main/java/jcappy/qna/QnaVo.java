package jcappy.qna;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class QnaVo extends CommonVo {   
	
	private int qno;
	private String qtitle;
	private String qcontent;
	private Timestamp qregdate;
	private int q_gno;
	private int q_ono;
	private int qnested;
	private String qfile_org;	// 사용자가첨부한 원본파일명
	private String qfile_real;	// 서버에 저장된 실제파일명
	private int mno;
	private String isDel;
	
	private int comment_count;
	private String mname;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Timestamp getQregdate() {
		return qregdate;
	}
	public void setQregdate(Timestamp qregdate) {
		this.qregdate = qregdate;
	}
	public int getQ_gno() {
		return q_gno;
	}
	public void setQ_gno(int q_gno) {
		this.q_gno = q_gno;
	}
	public int getQ_ono() {
		return q_ono;
	}
	public void setQ_ono(int q_ono) {
		this.q_ono = q_ono;
	}
	public int getQnested() {
		return qnested;
	}
	public void setQnested(int qnested) {
		this.qnested = qnested;
	}
	public String getQfile_org() {
		return qfile_org;
	}
	public void setQfile_org(String qfile_org) {
		this.qfile_org = qfile_org;
	}
	public String getQfile_real() {
		return qfile_real;
	}
	public void setQfile_real(String qfile_real) {
		this.qfile_real = qfile_real;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
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
