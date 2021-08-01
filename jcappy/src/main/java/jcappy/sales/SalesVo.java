package jcappy.sales;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class SalesVo extends CommonVo{
	
	private int year;
	private int month;
	private int price;
	
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
