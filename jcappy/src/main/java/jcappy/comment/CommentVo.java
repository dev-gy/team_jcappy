package jcappy.comment;

import java.sql.Timestamp;

import jcappy.util.CommonVo;



public class CommentVo extends CommonVo {

	private int cm_no;
	private String cm_content;
	private Timestamp cm_regdate;
	private int cm_board_no;
	private int mno;
	private String cm_tablename;
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public Timestamp getCm_regdate() {
		return cm_regdate;
	}
	public void setCm_regdate(Timestamp cm_regdate) {
		this.cm_regdate = cm_regdate;
	}
	public int getCm_board_no() {
		return cm_board_no;
	}
	public void setCm_board_no(int cm_board_no) {
		this.cm_board_no = cm_board_no;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getCm_tablename() {
		return cm_tablename;
	}
	public void setCm_tablename(String cm_tablename) {
		this.cm_tablename = cm_tablename;
	}
	
	
	
}
