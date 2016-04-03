package com.csu.qxjh.test.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book {
	
	private int id;
	private String book_name;
	
	
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}




	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	
	public void setId(int id) {
		this.id = id;
	}



	@Column
	public String getBook_name() {
		return book_name;
	}




	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}




	public Book(int id, String book_name) {
		super();
		this.id = id;
		this.book_name = book_name;
	}




	@Override
	public String toString() {
		return "Book [id=" + id + ", book_name=" + book_name + "]";
	}



	
}
