package jcappy.orderinfo;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class OrderinfoVo extends CommonVo {
	private int ono;
	private Timestamp odate;
	private String orequest;
	private String opay;
	private String o_state;
	private String o_del;
	private int mno;
	private int oc_cancel;
	private String oc_reason;
	private String oname;
	private String ophone;
	private String ozipcode;
	private String oaddr;
	private String oaddrde;
	private int cno;
	private String imp_uid;

	private int total_price;
	private String oi_pname;

	private int[] onos;

	OrderinfoVo() {
		super.setOrderby("odate");
	}

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

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

	public String getOzipcode() {
		return ozipcode;
	}

	public void setOzipcode(String ozipcode) {
		this.ozipcode = ozipcode;
	}

	public String getOaddr() {
		return oaddr;
	}

	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}

	public String getOaddrde() {
		return oaddrde;
	}

	public void setOaddrde(String oaddrde) {
		this.oaddrde = oaddrde;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int[] getOnos() {
		return onos;
	}

	public void setOnos(int[] onos) {
		this.onos = onos;
	}

	public String getOi_pname() {
		return oi_pname;
	}

	public void setOi_pname(String oi_pname) {
		this.oi_pname = oi_pname;
	}
}
