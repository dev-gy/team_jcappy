package jcappy.qna;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class QnaVo extends CommonVo {   
	
	
	private int qno;			// 문의 게시판 번호
	private String qtitle;		// 문의 제목	
	private String qcontent;	// 문의 내용
	private Timestamp qregdate;	// 작성 날짜
	private int q_gno;			// 그룹 번호
	private int q_ono;			// 순서 번호
	private int q_nested;		// 들여쓰기
	private String qfile_org;	// 사용자가첨부한 원본파일명
	private String qfile_real;	// 서버에 저장된 실제파일명
	private int mno;			// 회원 번호
	private int ano;			// 관리자 쪽 댓글
	private int q_havere;
	private int user_no;
	
//	private String qtitleRe;
//	private String qcontentRe;
//	private Timestamp qregdateRe;
//	private String qfile_orgRe;
//	private String qfile_realRe;
	
	private String isDel;
	private String aname;
	private String aid;
	private String mname;
	private String mphone;
	private String memail;
	
	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public int getQ_havere() {
		return q_havere;
	}


	public void setQ_havere(int q_havere) {
		this.q_havere = q_havere;
	}
	public QnaVo() {
		setOrderby("qregdate");
	}
	
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
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
	public int getQ_nested() {
		return q_nested;
	}
	public void setQ_nested(int q_nested) {
		this.q_nested = q_nested;
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
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	
	
//	public String getQtitleRe() {
//		return qtitleRe;
//	}
//
//
//	public void setQtitleRe(String qtitleRe) {
//		this.qtitleRe = qtitleRe;
//	}
//
//
//	public String getQcontentRe() {
//		return qcontentRe;
//	}
//
//
//	public void setQcontentRe(String qcontentRe) {
//		this.qcontentRe = qcontentRe;
//	}
//
//
//	public Timestamp getQregdateRe() {
//		return qregdateRe;
//	}
//
//
//	public void setQregdateRe(Timestamp qregdateRe) {
//		this.qregdateRe = qregdateRe;
//	}
//
//
//	public String getQfile_orgRe() {
//		return qfile_orgRe;
//	}
//
//
//	public void setQfile_orgRe(String qfile_orgRe) {
//		this.qfile_orgRe = qfile_orgRe;
//	}
//
//
//	public String getQfile_realRe() {
//		return qfile_realRe;
//	}
//
//
//	public void setQfile_realRe(String qfile_realRe) {
//		this.qfile_realRe = qfile_realRe;
//	}
	
}
