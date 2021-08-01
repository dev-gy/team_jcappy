package jcappy.orderinfo;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class OrderinfoVo extends CommonVo{
	private int ono;
	private Timestamp odate;
	private String orequest;
	private String opay;
	private String o_state;
	private String o_del;
	private int mno;
	private int oc_cancel;
	private String oc_reason;
	
	
	
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public Timestamp getOdate() {
		return odate;
	}
	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}
	public String getOrequest() {
		return orequest;
	}
	public void setOrequest(String orequest) {
		this.orequest = orequest;
	}
	public String getOpay() {
		return opay;
	}
	public void setOpay(String opay) {
		this.opay = opay;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	public String getO_del() {
		return o_del;
	}
	public void setO_del(String o_del) {
		this.o_del = o_del;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getOc_cancel() {
		return oc_cancel;
	}
	public void setOc_cancel(int oc_cancel) {
		this.oc_cancel = oc_cancel;
	}
	public String getOc_reason() {
		return oc_reason;
	}
	public void setOc_reason(String oc_reason) {
		this.oc_reason = oc_reason;
	}
}
