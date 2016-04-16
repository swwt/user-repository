package com.csu.qxjh.util.pojo;

public class CartAmount {
	private int cart_id;
	private int amount;
	public CartAmount() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartAmount(int cart_id, int amount) {
		super();
		this.cart_id = cart_id;
		this.amount = amount;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartAmount [cart_id=" + cart_id + ", amount=" + amount + "]";
	}
	
}
