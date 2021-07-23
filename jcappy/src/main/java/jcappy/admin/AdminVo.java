package jcappy.admin;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class AdminVo extends CommonVo {

	private int ano;
	private String aid;
	private String apwd;
	private String aname;
	private Timestamp aregdate;
	private int admin_item;
	private int admin_order;
	private int admin_members;
	private int admin_board;
	private int admin_add;
	private int admin_account;
	private int admin_admin;
	private int auth;
	private int[] anos;

	AdminVo() {
		super.setOrderby("aregdate");
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public Timestamp getAregdate() {
		return aregdate;
	}

	public void setAregdate(Timestamp aregdate) {
		this.aregdate = aregdate;
	}

	public int getAdmin_item() {
		return admin_item;
	}

	public void setAdmin_item(int admin_item) {
		this.admin_item = admin_item;
	}

	public int getAdmin_order() {
		return admin_order;
	}

	public void setAdmin_order(int admin_order) {
		this.admin_order = admin_order;
	}

	public int getAdmin_members() {
		return admin_members;
	}

	public void setAdmin_members(int admin_members) {
		this.admin_members = admin_members;
	}

	public int getAdmin_board() {
		return admin_board;
	}

	public void setAdmin_board(int admin_board) {
		this.admin_board = admin_board;
	}

	public int getAdmin_add() {
		return admin_add;
	}

	public void setAdmin_add(int admin_add) {
		this.admin_add = admin_add;
	}

	public int getAdmin_account() {
		return admin_account;
	}

	public void setAdmin_account(int admin_account) {
		this.admin_account = admin_account;
	}

	public int getAdmin_admin() {
		return admin_admin;
	}

	public void setAdmin_admin(int admin_admin) {
		this.admin_admin = admin_admin;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int[] getAnos() {
		return anos;
	}

	public void setAnos(int[] anos) {
		this.anos = anos;
	}
}
